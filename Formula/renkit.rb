class Renkit < Formula
  version "4.0.2"
  on_macos do
    on_arm do
      url "https://github.com/kobaltcore/renkit/releases/download/v4.0.2/renkit-aarch64-apple-darwin.tar.xz"
      sha256 "44ff82a04d1edb154f19b669e56a4b6166781d7e19cda08d001dbf6b7697facb"
    end
    on_intel do
      url "https://github.com/kobaltcore/renkit/releases/download/v4.0.2/renkit-x86_64-apple-darwin.tar.xz"
      sha256 "5eaa9004316baeecb46df60280579dc0a655eba3b2d89254c1397432c9a27685"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/kobaltcore/renkit/releases/download/v4.0.2/renkit-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "1c25ebbf77d118683bf7ef1edf7b0fc055a89bfc3fe73fe12daf0228c8e640cd"
    end
    on_intel do
      url "https://github.com/kobaltcore/renkit/releases/download/v4.0.2/renkit-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "df0bcdc865052c24ba885371f590f7925c035a07e305a97a54da93fc87b1ee16"
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
