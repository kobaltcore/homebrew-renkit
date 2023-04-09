cask "renkit" do
  arch arm: "arm64", intel: "amd64"

  version "3.2.0"
  sha256 arm:   "5112deb2d8f6dd51bd6da9cfbd51eec8454cac26a6621d8ac275e02455b4e6e3",
         intel: "4eb4486894767cb5ae6fed4c57bd5aa3ac102c33d0457b03abcf67d4e06deacf"

  url "https://github.com/kobaltcore/renkit/releases/download/v#{version}/renkit-macos-#{arch}.tar.gz"
  name "renkit"
  desc "Collection of tools to help you use Ren'Py instances from the command-line"
  homepage "https://github.com/kobaltcore/renkit"

  binary "renutil"
  binary "renotize"
  binary "renconstruct"
end
