class Renkit < Formula
  version "4.0.0"
  on_macos do
    on_arm do
      url "https://github.com/kobaltcore/renkit/releases/download/v4.0.0/renkit-aarch64-apple-darwin.tar.xz"
      sha256 "23d59534763b32594c9930c36df3cf73a20f0775cb8b703746a5caf8fc089266"
    end
    on_intel do
      url "https://github.com/kobaltcore/renkit/releases/download/v4.0.0/renkit-x86_64-apple-darwin.tar.xz"
      sha256 "3ecbe402b46333e1e8d733363e732bc3a25c2ac5b87e62a58872702ea79dc907"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/kobaltcore/renkit/releases/download/v4.0.0/renkit-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "258e7a0d1cc9e670fbf6d51bf65f4ab8f8ad9a257a5873f5efcc7daa202b29a4"
    end
    on_intel do
      url "https://github.com/kobaltcore/renkit/releases/download/v4.0.0/renkit-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "37e99b2df2188b37eff9daa3e3b358b8798f72867c7a9cea3cc0bbbc0f3d08f6"
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
