class Renkit < Formula
  version "4.0.3"
  on_macos do
    on_arm do
      url "https://github.com/kobaltcore/renkit/releases/download/v4.0.3/renkit-aarch64-apple-darwin.tar.xz"
      sha256 "9063e93de64c2304271996c3e4d2870ee655074e5ee4497c86b11f3bf97a2231"
    end
    on_intel do
      url "https://github.com/kobaltcore/renkit/releases/download/v4.0.3/renkit-x86_64-apple-darwin.tar.xz"
      sha256 "2fd653c0efab184b5d2f9557c645afbcbf020a499f7a6f952b09f23538ae577f"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/kobaltcore/renkit/releases/download/v4.0.3/renkit-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "cb8a88180dd78077562aa8e8b0bf8663085f738792e8c9788d5d76f7b116399d"
    end
    on_intel do
      url "https://github.com/kobaltcore/renkit/releases/download/v4.0.3/renkit-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e103bbd6dfb099e390be277cfdecf3bbc4c851b14130e8dcff0da5f4bffa28ec"
    end
  end
  
  depends_on "openjdk@21"

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
