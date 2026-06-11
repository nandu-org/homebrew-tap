class Ndf < Formula
  desc "Nandu Development Framework CLI"
  homepage "https://github.com/nandu-org/nandu-dev-framework-cli"
  version "2.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nandu-org/nandu-dev-framework-cli/releases/download/v#{version}/ndf-darwin-arm64"
      sha256 "1eca9d6132579f2dc93f9de50dc48fd319f8fe23dba6092e243723cedaadb7a7"
    end
    on_intel do
      url "https://github.com/nandu-org/nandu-dev-framework-cli/releases/download/v#{version}/ndf-darwin-amd64"
      sha256 "52eea2d30e667f8fd4bdb9e417b343eb883b3d8acc24b89cd69c0c336ede914f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nandu-org/nandu-dev-framework-cli/releases/download/v#{version}/ndf-linux-amd64"
      sha256 "e6c91af450fc88f832587421716007fc94aec4675234fae8cf3d7ba1badea509"
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
