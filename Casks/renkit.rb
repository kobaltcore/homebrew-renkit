cask "renkit" do
  arch arm: "arm64", intel: "amd64"

  version "2.4.0"
  sha256 arm:   "fba006c76a369f0b2a291cf9b54268ffac18f2b92faed34d7570598f6fffad5e",
         intel: "5771c5a72b3400d1ee12400c9dfb3df18b8f72fdc9ccc9df6bedf5290c65adc0"

  url "https://github.com/kobaltcore/renkit/releases/download/v#{version}/renkit-macos-#{arch}.zip"
  name "renkit"
  desc "A collection of tools to help you organise and use Ren'Py instances from the command line. Especially useful for headless servers."
  homepage "https://github.com/kobaltcore/renkit"

  binary "renutil"
  binary "renotize"
  binary "renconstruct"
end
