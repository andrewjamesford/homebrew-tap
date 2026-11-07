class PageflickTools < Formula
  include Language::Python::Shebang

  desc "CLI and MCP companion for the PageFlick Mac app"
  homepage "https://github.com/andrewjamesford/pageflick-tools"
  url "https://github.com/andrewjamesford/pageflick-tools/releases/download/v1.0.0/pageflick-tools-1.0.0.tar.gz"
  sha256 "8da11256437b1a7c61da6d07527789a318d8770b49d3b8a76ce3791b80637b21"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :golden_gate
  depends_on "python@3.15"

  def install
    rewrite_shebang detected_python_shebang, "scripts/pageflick"
    bin.install "scripts/pageflick"
  end

  def caveats
    <<~EOS
      Preview: requires a PageFlick build with the local API enabled.
      Compatibility with the current App Store 1.0 build has not been verified.
      Check for the local API setting in your app before pairing.
      Keep PageFlick open. This formula installs only the CLI/MCP companion.
      Enable Settings > Automation > Local API, CLI and MCP, then copy its connection.
      Pair with: pageflick pair --clipboard
      Re-pair with --replace after restarting PageFlick or rotating its key.
      For a trusted MCP client, use #{opt_bin}/pageflick with argument: mcp
    EOS
  end

  test do
    assert_match "PageFlick local tools #{version}", shell_output("#{bin}/pageflick --version")
    connection = testpath/"connection.json"
    config = {
      schemaVersion: 1,
      host:          "127.0.0.1",
      port:          1,
      token:         "a" * 64,
      bundleID:      "nz.co.andrewford.PageFlick",
    }
    pipe_output("#{bin}/pageflick --connection #{connection} pair", JSON.generate(config), 0)
    assert_equal 0600, connection.stat.mode & 0777

    requests = [
      { jsonrpc: "2.0", id: 1, method: "initialize", params: { protocolVersion: "2025-11-25" } },
      { jsonrpc: "2.0", method: "notifications/initialized" },
      { jsonrpc: "2.0", id: 2, method: "tools/list" },
    ]
    input = requests.map { |request| JSON.generate(request) }.join("\n") + "\n"
    output = pipe_output("#{bin}/pageflick --connection #{connection} mcp", input, 0)
    replies = output.lines.map { |line| JSON.parse(line) }
    listed = replies.find { |reply| reply["id"] == 2 }.fetch("result").fetch("tools")
    assert_equal %w[continue_reading library_books open_book reading_export reading_stats],
                 listed.map { |tool| tool.fetch("name") }.sort
  end
end
