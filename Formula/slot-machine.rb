# Homebrew formula for slot-machine (shell bin: `sm`). Zero-dependency Node CLI + MCP server.
#
# Releasing (refresh url/sha256 per version):
#   1. npm run pack                       # -> slot-machine-v<version>.tar.gz (tracked files at HEAD)
#   2. upload it as the v<version> GitHub release asset
#   3. shasum -a 256 slot-machine-v<version>.tar.gz   # paste into `sha256`, bump the url version
# Installing before you publish (local tap): see README "Install (Homebrew)".
class SlotMachine < Formula
  desc "Orchestrate tmux + git worktrees for Claude agent fleets (CLI + MCP server)"
  homepage "https://github.com/tylerbre/slot-machine"
  url "https://github.com/TylerBre/slot-machine/releases/download/v1.5.0/slot-machine-v1.5.0.tar.gz"
  sha256 "ee0e0a45444d66fdc833683843057434dbab6aaf1b9bbc5c5c064c40a03284c3" # regenerate per release
  license "GPL-3.0-or-later"

  depends_on "node"

  def install
    # bin/* import ../lib and ../schema by relative path, so keep the tree intact under libexec
    # and symlink only the entry points onto PATH (sm is the primary shell bin).
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/sm"
    bin.install_symlink libexec/"bin/slot-machine"
    bin.install_symlink libexec/"bin/slot-machine-mcp"
  end

  test do
    system bin/"sm", "help"
  end
end
