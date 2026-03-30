class MaumSora < Formula
  desc "Maum Sora background service"
  homepage "https://github.com/hanbyeongtak/sora-app"
  url "https://github.com/hanbyeongtak/sora-app/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "ae85754a1fc6df47b7bc24b1230ab0ec5708ac5a959b71a7833ca8c6fad94b79"
  license "MIT"

  depends_on "uv"
  depends_on "ffmpeg"
  depends_on "gstreamer"

  def install
    libexec.install Dir["*"]

    (bin/"maum-sora").write <<~EOS
      #!/usr/bin/env bash
      export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:$PATH"

      APP_ROOT="$(brew --prefix maum-sora)/libexec"
      cd "$APP_ROOT"

      exec uv run --frozen python ./__main__.py "$@"
    EOS

    chmod 0755, bin/"maum-sora"
  end

  service do
    run [opt_bin/"maum-sora"]
    keep_alive true
    working_dir var
    log_path var/"log/maum-sora.log"
    error_log_path var/"log/maum-sora.err.log"
  end

  test do
    system "#{bin}/maum-sora", "--help"
  end
end