class Xcbuild < Formula
  desc "Xcode-compatible build tool"
  homepage "https://github.com/facebook/xcbuild"
  head "https://github.com/facebook/xcbuild.git", :shallow => false

  depends_on "ninja"
  depends_on "cmake"
  depends_on "libpng"
  depends_on "pkg-config"

  def install
    system "cmake", ".", '-G', 'Ninja', *std_cmake_args
    system "ninja", "install"
    bin.install_symlink "#{prefix}/usr/bin/xcbuild"
  end

  test do
    system "#{bin}/xcbuild", "-showsdks"
  end
end
