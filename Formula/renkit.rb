class Renkit < Formula
  desc "Description"
  homepage "https://github.com/kobaltcore/renkit"
  version "4.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kobaltcore/renkit/releases/download/v4.2.0/renkit-aarch64-apple-darwin.tar.xz"
      sha256 "376b11645ff3136a12458e8ab815571b5b558b6d88cdea8ee74ababc87738ca6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/kobaltcore/renkit/releases/download/v4.2.0/renkit-x86_64-apple-darwin.tar.xz"
      sha256 "489b793db138320e054d51e3f8e3195baca01f3bd30d59ea3fdbbdd06c25132b"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/kobaltcore/renkit/releases/download/v4.2.0/renkit-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "78d26e0e58f6bb52f72c700be4ce6ad784d96ba731d81cac1a1ed650b7cac87e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/kobaltcore/renkit/releases/download/v4.2.0/renkit-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "04f2a88c301bb33a4b4aa35714e96df31bc0f91b69a9bf0693c95ad8af4b774a"
    end
  end
  
  depends_on "openjdk@21"

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "renconstruct", "renotize", "renutil"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "renconstruct", "renotize", "renutil"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "renconstruct", "renotize", "renutil"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "renconstruct", "renotize", "renutil"
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
