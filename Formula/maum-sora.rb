class MaumSora < Formula
  desc "Maum Sora background service"
  homepage "https://github.com/hanbyeongtak/sora-app"
  url "https://github.com/hanbyeongtak/sora-app/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "115e189c343831e239893ecbeed249f7b6389f200552af383c6a57157b18f42c"
  license "MIT"

  depends_on "uv"
  depends_on "ffmpeg"
  depends_on "gstreamer"
  depends_on "gst-plugins-base"
  depends_on "gst-plugins-good"
  depends_on "gst-plugins-bad"
  depends_on "gst-plugins-ugly"
  depends_on "gst-libav"
  depends_on "pkg-config"
  depends_on "cairo"

  def install
    # libexec.install Dir["*"]

    # bin.install libexec/"scripts/maum-sora"
    # bin.install libexec/"scripts/maum-sora-service"


    libexec.install Dir["*"]

    bin.install Dir["scripts/maum-sora"]
    bin.install Dir["scripts/maum-sora-service"]
  end

  service do
    run [opt_bin/"maum-sora-service"]
    keep_alive true
    working_dir var
    log_path var/"log/maum-sora.log"
    error_log_path var/"log/maum-sora.err.log"
  end

  test do
    assert_predicate bin/"maum-sora", :exist?
  end
end