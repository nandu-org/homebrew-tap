class Ndf < Formula
  desc "Nandu Development Framework CLI"
  homepage "https://github.com/nandu-org/nandu-dev-framework-cli"
  version "2.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nandu-org/nandu-dev-framework-cli/releases/download/v#{version}/ndf-darwin-arm64"
      sha256 "b83ac5c649f4f3ffd34b42718658a389780d20b12058d43b804f7eed8fcfaf3d"
    end
    on_intel do
      url "https://github.com/nandu-org/nandu-dev-framework-cli/releases/download/v#{version}/ndf-darwin-amd64"
      sha256 "89685a832c88db5dd97ddc188b065122ddc77120df8511c36d0cddb3499437a7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nandu-org/nandu-dev-framework-cli/releases/download/v#{version}/ndf-linux-amd64"
      sha256 "73e038e800526a5013a8a0f31d8f6cbb34f64152c7ec6d0ef62ceed9d67274ec"
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
