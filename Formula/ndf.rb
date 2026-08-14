class Ndf < Formula
  desc "Nandu Development Framework CLI"
  homepage "https://github.com/nandu-org/nandu-dev-framework-cli"
  version "2.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nandu-org/nandu-dev-framework-cli/releases/download/v#{version}/ndf-darwin-arm64"
      sha256 "43064ebcc4c6f66086d034cb178210590af6e45de0e380a9b9293f55f85f47b9"
    end
    on_intel do
      url "https://github.com/nandu-org/nandu-dev-framework-cli/releases/download/v#{version}/ndf-darwin-amd64"
      sha256 "38a238781d4864ced7415580bbb831377ed7ad1ce1d14e59c23d3748fd64eb0f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nandu-org/nandu-dev-framework-cli/releases/download/v#{version}/ndf-linux-amd64"
      sha256 "c2d00a8772d63ad6f81758a518bb0c01a32ce30aab74053a6741c2e1f5cd1c9b"
    end
  end

  def install
    # Single-file binary download — pwd contains it under the artifact name.
    binary = Pathname.pwd.children.find { |c| c.file? }
    bin.install binary => "ndf"
  end

  test do
    assert_match "ndf v#{version}", shell_output("#{bin}/ndf version")
  end
end
