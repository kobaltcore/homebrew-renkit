class Renkit < Formula
  version "4.0.1"
  on_macos do
    on_arm do
      url "https://github.com/kobaltcore/renkit/releases/download/v4.0.1/renkit-aarch64-apple-darwin.tar.xz"
      sha256 "10171b03a09dc47ae4ec93b93a5f65cea98347e5f07634aa16862d53802ad576"
    end
    on_intel do
      url "https://github.com/kobaltcore/renkit/releases/download/v4.0.1/renkit-x86_64-apple-darwin.tar.xz"
      sha256 "72974e0fc17b3e0b6cbc6cc760eb1b5b10e07478994114643f698e94cab74581"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/kobaltcore/renkit/releases/download/v4.0.1/renkit-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a11589a34c7e7fb29190b7f5afd1ff108d950ccc7a9f94327ea9950da92435a8"
    end
    on_intel do
      url "https://github.com/kobaltcore/renkit/releases/download/v4.0.1/renkit-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "bb8c17a6850260c48609b02d5239014e8425a2f1efd122ce0e546a5cc33dd847"
    end
  end

  def install
    on_macos do
      on_arm do
        bin.install "renconstruct", "renotize", "renutil"
      end
    end
    on_macos do
      on_intel do
        bin.install "renconstruct", "renotize", "renutil"
      end
    end
    on_linux do
      on_arm do
        bin.install "renconstruct", "renotize", "renutil"
      end
    end
    on_linux do
      on_intel do
        bin.install "renconstruct", "renotize", "renutil"
      end
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
