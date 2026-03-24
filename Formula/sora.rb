class MyTool < Formula
    desc "내 도구에 대한 간단한 설명"
    homepage "https://github.com/hanbyeongtak/homebrew-sora"
    url "https://github.com/hanbyeongtak/homebrew-sora/archive/refs/tags/v1.0.0.tar.gz"
    sha256 "110cf9bb6be8fbe9c9ef63a98ea6801750a023dbb265d97fcaff0eb7be6f9356" # 'shasum -a 256 파일명'으로 확인 가능
    license "MIT"
    def install
      # 1. 실행 파일 설치: bin 폴더에 넣으면 자동으로 PATH에 등록됩니다.
      # 기존 쉘 스크립트 파일이 'my-script.sh'라면
      bin.install "my-script.sh" => "my-tool"
  
      # 2. 기타 리소스 파일이 있다면
      # pkgshare.install "config.json"
    end
  
    test do
      # 설치가 잘 되었는지 확인하는 간단한 테스트
      system "#{bin}/my-tool", "--version"
    end
  end