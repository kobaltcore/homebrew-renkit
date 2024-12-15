class Renkit < Formula
  desc "A collection of tools to help you organise and use Ren'Py instances from the command line."
  homepage "https://github.com/kobaltcore/renkit"
  version "5.0.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kobaltcore/renkit/releases/download/v5.0.0/renkit-aarch64-apple-darwin.tar.xz"
      sha256 "2f74441e85f8b85c324e771e8eb59c2d9310a0ef153d384b8c57c054d50598c4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/kobaltcore/renkit/releases/download/v5.0.0/renkit-x86_64-apple-darwin.tar.xz"
      sha256 "29da68d94b4d0c35082964a3048bef7a12a8ea63aef966a196cfc30ca87259a2"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/kobaltcore/renkit/releases/download/v5.0.0/renkit-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "7f63e568aaefc962560552ea9e2df0393dc21b0f1d10c4556df5f0a53eae1aa0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/kobaltcore/renkit/releases/download/v5.0.0/renkit-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d209b97517cdb809d9d25b88f607d2ff27f913ada798c2cc2e910f0ef31b656d"
    end
  end
  depends_on "openjdk@21"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "renconstruct", "renotize", "renutil" if OS.mac? && Hardware::CPU.arm?
    bin.install "renconstruct", "renotize", "renutil" if OS.mac? && Hardware::CPU.intel?
    bin.install "renconstruct", "renotize", "renutil" if OS.linux? && Hardware::CPU.arm?
    bin.install "renconstruct", "renotize", "renutil" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
