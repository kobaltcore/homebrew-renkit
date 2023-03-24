cask "renkit" do
  arch arm: "arm64", intel: "amd64"

  version "3.0.3"
  sha256 arm:   "9b41eb243d03f17b320fb267f5aabc550ffd30bd946c49a1078e8c19500af72e",
         intel: "9e831d31ce0a2a1e67c76506778cbda0b43f2f881cd2c0db9dbc0fa915a76912"

  url "https://github.com/kobaltcore/renkit/releases/download/v#{version}/renkit-macos-#{arch}.tar.gz"
  name "renkit"
  desc "Collection of tools to help you use Ren'Py instances from the command-line"
  homepage "https://github.com/kobaltcore/renkit"

  binary "renutil"
  binary "renotize"
  binary "renconstruct"
end
