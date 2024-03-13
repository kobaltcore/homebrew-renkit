class Renkit < Formula
  version "4.1.0"
  on_macos do
    on_arm do
      url "https://github.com/kobaltcore/renkit/releases/download/v4.1.0/renkit-aarch64-apple-darwin.tar.xz"
      sha256 "7d7cf23e73c864bce1f9de266f194110fecd279f84d04e14951475d3801fb37b"
    end
    on_intel do
      url "https://github.com/kobaltcore/renkit/releases/download/v4.1.0/renkit-x86_64-apple-darwin.tar.xz"
      sha256 "74814ef64f847079a996f7ab0d5d90dc587189873ab52c72442eb54161198834"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/kobaltcore/renkit/releases/download/v4.1.0/renkit-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "b950c61221d18382aeaf82b8e8f8df22f47c5a38112c363e8e790c612b878b4b"
    end
    on_intel do
      url "https://github.com/kobaltcore/renkit/releases/download/v4.1.0/renkit-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "34883558b4518bc64a66f601963133794d5cae5ee9e8c4cb108f4f5e970929d8"
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
