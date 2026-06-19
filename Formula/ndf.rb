class Ndf < Formula
  desc "Nandu Development Framework CLI"
  homepage "https://github.com/nandu-org/nandu-dev-framework-cli"
  version "2.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nandu-org/nandu-dev-framework-cli/releases/download/v#{version}/ndf-darwin-arm64"
      sha256 "6bba7073e24f7b60e301823c618acb1d30442ad09df022b000b8aa41e0438b43"
    end
    on_intel do
      url "https://github.com/nandu-org/nandu-dev-framework-cli/releases/download/v#{version}/ndf-darwin-amd64"
      sha256 "3e13510d8e315c624d47a3d072c3923fa96c98cd4e14a2a681dac4675fb53067"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nandu-org/nandu-dev-framework-cli/releases/download/v#{version}/ndf-linux-amd64"
      sha256 "f235527b5908855126eb2416345deb13be8a7b7bc6c82589ec22e1dc1e0d6e3a"
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
