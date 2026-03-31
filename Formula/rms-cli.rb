class RmsCli < Formula
  desc "Maum Sora background service"
  homepage "https://github.com/hanbyeongtak/rms_cli"
  url "https://github.com/hanbyeongtak/rms_cli/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "02effcbd9026740b2487a9df6ffe2907d1997490fb9305a3da953608f2644aa4"
  license "MIT"

  def install
    libexec.install Dir["*"]

    (bin/"rms-cli").write <<~EOS
      #!/usr/bin/env bash
      export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:$PATH"

      APP_ROOT="$(brew --prefix rms-cli)/libexec"
      cd "$APP_ROOT"

      exec uv run python3 scripts/setup_rms.py "$@"
    EOS

    chmod 0755, bin/"rms-cli"
  end


  test do
    system "#{bin}/rms-cli", "--help"
  end
end