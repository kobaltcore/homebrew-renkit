class Renkit < Formula
  desc "Description"
  homepage "https://github.com/kobaltcore/renkit"
  version "4.3.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kobaltcore/renkit/releases/download/v4.3.0/renkit-aarch64-apple-darwin.tar.xz"
      sha256 "225af0787d99794bed49c2bdf1e681f9336f2da13054b4a7f1cb7b38453e6ced"
    end
    if Hardware::CPU.intel?
      url "https://github.com/kobaltcore/renkit/releases/download/v4.3.0/renkit-x86_64-apple-darwin.tar.xz"
      sha256 "5e0a5b6def4f79f05f9937a5c25db7e94dcc88a3e989214bbde301b899d29a8f"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/kobaltcore/renkit/releases/download/v4.3.0/renkit-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "1c113f644c4bd0e61a61b6a7e0e8dc6fe5d58f5699b2e9b8ae4565949ea48375"
    end
    if Hardware::CPU.intel?
      url "https://github.com/kobaltcore/renkit/releases/download/v4.3.0/renkit-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "52c1508a1b1c0ba33e02b4366b978f1935d758ead0ac5fef9e7c5f7050a22e54"
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
