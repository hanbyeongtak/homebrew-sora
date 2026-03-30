class MaumSora < Formula
  desc "Maum Sora background service"
  homepage "https://github.com/hanbyeongtak/sora-app"
  url "https://github.com/hanbyeongtak/sora-app/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "115e189c343831e239893ecbeed249f7b6389f200552af383c6a57157b18f42c"
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

      exec uv run --frozen python __main__.py "$@"
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