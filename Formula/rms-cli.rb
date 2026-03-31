class RmsCli < Formula
  desc "Maum Sora background service"
  homepage "https://github.com/hanbyeongtak/rms_cli"
  url "https://github.com/hanbyeongtak/rms_cli/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "34452f3f010d53a293a48388c65710e09a5008ac4b08dd6b18233a57913c3fd8"
  license "Copyright (c) 2026 MAUM.AI Inc. All rights reserved."

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