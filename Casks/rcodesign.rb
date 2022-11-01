cask "rcodesign" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.20.0"
  sha256 arm:   "2e2749e9772da865dd2478eab73978dc1222add2bc3f68dfc68423de3b20c151",
         intel: "744109df86edc3025779518ae9471b18ee57cd9ca4b5c7b5d02e6840fe160e6f"

  url "https://github.com/indygreg/apple-platform-rs/releases/download/apple-codesign%2F#{version}/apple-codesign-0.20.0-#{arch}-apple-darwin.tar.gz"
  name "rcodesign"
  desc "Rust implementation of Apple code signing and notarization"
  homepage "https://github.com/indygreg/apple-platform-rs"

  binary "apple-codesign-#{version}-#{arch}-apple-darwin/rcodesign", target: "rcodesign"
end
