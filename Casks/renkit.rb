cask "renkit" do
  arch arm: "arm64", intel: "amd64"

  version "3.3.0"
  sha256 arm:   "5bd2a01ed6a5dc83dfcbcd7b19c903b36ba81bf49a1b94acd24fc383517070a2",
         intel: "72a66b3f59e18c0b62d117487e27edc54d2e0569e31ec4f5cf2e0bba33dd3e7c"

  url "https://github.com/kobaltcore/renkit/releases/download/v#{version}/renkit-macos-#{arch}.tar.gz"
  name "renkit"
  desc "Collection of tools to help you use Ren'Py instances from the command-line"
  homepage "https://github.com/kobaltcore/renkit"

  binary "renutil"
  binary "renotize"
  binary "renconstruct"
end
