class Ndf < Formula
  desc "Nandu Development Framework CLI"
  homepage "https://github.com/nandu-org/nandu-dev-framework-cli"
  version "2.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nandu-org/nandu-dev-framework-cli/releases/download/v#{version}/ndf-darwin-arm64"
      sha256 "9e5aea8f856a108d9b900eb0f020a6d67a5095b218603c4a79d440dd2245dd72"
    end
    on_intel do
      url "https://github.com/nandu-org/nandu-dev-framework-cli/releases/download/v#{version}/ndf-darwin-amd64"
      sha256 "b4b65e43d87221073fc423782dd643dca5a130b37b8ab3f9723f77a82b52c647"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nandu-org/nandu-dev-framework-cli/releases/download/v#{version}/ndf-linux-amd64"
      sha256 "598966d1bbf0be4b81ed83bc2b126445e507e28f14b65feb23646c45bd23aa18"
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
