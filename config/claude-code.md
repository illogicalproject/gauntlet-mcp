# Registering the kit with Claude Code (CLI)

After `./install.sh` finishes, register the PAL server with Claude Code.
Replace `ABSOLUTE_PATH` with the full path to this repo.

```bash
claude mcp add gauntlet \
  "ABSOLUTE_PATH/pal-mcp-server/.pal_venv/bin/python" \
  "ABSOLUTE_PATH/pal-mcp-server/server.py"
```

Verify it loaded:

```bash
claude mcp list          # should show gauntlet
```

Then, inside a Claude Code session, the red-team tools are available as
`consensus`, `challenge`, `clink`, `thinkdeep`, `codereview`, `secaudit`, etc.

> Tip: PAL ships a helper that prints the exact config for your machine.
> From the installed server folder: `./run-server.sh -c`
