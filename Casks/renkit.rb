cask "renkit" do
  arch arm: "arm64", intel: "amd64"

  version "3.3.1"
  sha256 arm:   "75fefc60913e69d59a25157a5af1a617a2645802c35f68aa0b85d5ae401c98f0",
         intel: "391e79ecb910d534fc99c1c580db5984e3287e3fd23846901406b09ed162db07"

  url "https://github.com/kobaltcore/renkit/releases/download/v#{version}/renkit-macos-#{arch}.tar.gz"
  name "renkit"
  desc "Collection of tools to help you use Ren'Py instances from the command-line"
  homepage "https://github.com/kobaltcore/renkit"

  binary "renutil"
  binary "renotize"
  binary "renconstruct"
end
