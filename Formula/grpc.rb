# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb

class Grpc < Formula
  homepage "http://www.grpc.io/"
  head "https://github.com/grpc/grpc.git"
  url "https://github.com/grpc/grpc/archive/release-0_6_0.tar.gz"
  version "0.6.0"
  sha256 "0671c8b264bd0b087b7699da24b4251fb998657ceb516aa672419aa709f6fb19"

  depends_on "grpc/google-protobuf"
  depends_on "openssl"
  depends_on "pkg-config" => :build

  bottle do
    root_url "http://storage.googleapis.com/grpc-public/bottles"
    sha256 "9e23cbcc4d4e9850cb608b66c44e76925f54c6d1f377dbeb64dd661c32eb67e4" => :yosemite
    sha256 "a7cd10d66343f304600343733d47400a857356b03a22dc1dfbff91b5101463b0" => :x86_64_linux
  end

  def install
    system "make", "install", "install_grpc_csharp_ext", "prefix=#{prefix}"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test grpc`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
