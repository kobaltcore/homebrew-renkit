class Renkit < Formula
  desc "Description"
  homepage "https://github.com/kobaltcore/renkit"
  version "4.4.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kobaltcore/renkit/releases/download/v4.4.0/renkit-aarch64-apple-darwin.tar.xz"
      sha256 "06e25c0d608075c306c5ce20bf95f1a1ca303611ee36621b9b89a4a23c210269"
    end
    if Hardware::CPU.intel?
      url "https://github.com/kobaltcore/renkit/releases/download/v4.4.0/renkit-x86_64-apple-darwin.tar.xz"
      sha256 "38e8a36ec9989502fe2e6ceefab62efbb526bdb44255329ec443142fef12a7d7"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/kobaltcore/renkit/releases/download/v4.4.0/renkit-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "75e1e23d4dc2eea196a7018a3f96fd46e409a650f92a12cbb58fb21c23599d69"
    end
    if Hardware::CPU.intel?
      url "https://github.com/kobaltcore/renkit/releases/download/v4.4.0/renkit-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a526a4e49f5bbe3919d580b93f3cb013f45ab140db84ed2626dad18ed0caacd0"
    end
  end
  
  depends_on "openjdk@21"

  BINARY_ALIASES = {"aarch64-apple-darwin": {}, "aarch64-unknown-linux-gnu": {}, "x86_64-apple-darwin": {}, "x86_64-pc-windows-gnu": {}, "x86_64-unknown-linux-gnu": {}}

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

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
