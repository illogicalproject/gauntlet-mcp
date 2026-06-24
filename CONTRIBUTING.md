# Contributing to Gauntlet

Thanks for considering a contribution. Gauntlet is intentionally small: it's
a configuration + playbook layer on top of [PAL MCP](https://github.com/BeehiveInnovations/pal-mcp-server),
not a fork of it. That scope shapes what belongs here.

## What belongs in this repo
- **New red-team / comparison prompt patterns** (`prompts/`), a documented
  workflow that gets more out of multiple models.
- **Config presets** (`.env.example`, `config/`), support for another
  provider, CLI client, or a sharper default.
- **Docs that help people read multi-model output** (`docs/`).
- **Installer improvements** (`install.sh`), better setup UX, more shells/OSes.

## What does NOT belong here
- **Changes to the PAL server itself.** Those go upstream at
  [BeehiveInnovations/pal-mcp-server](https://github.com/BeehiveInnovations/pal-mcp-server).
  We pull their code; we don't vendor or patch it.
- **Anything that bundles or copies upstream source** into this repo.
- **Real API keys or secrets.** `.env` is git-ignored for a reason.

## Adding a prompt pattern
Each file in `prompts/` follows the same shape so they stay scannable:

1. **Goal**, one or two sentences on what the pattern is for.
2. **Pattern**, the mechanic (which tools, which model roles).
3. **Template**, a copy-pasteable prompt block.
4. **Reading the result**, how to interpret the output, including failure modes.

Keep templates model-agnostic where you can (say "a different vendor's model"
rather than hardcoding one), and always include how to read disagreement.

## Workflow
1. Fork and branch (`feat/...` or `docs/...`).
2. Make the change. If you touched `install.sh`, run `bash -n install.sh`
   and, ideally, a real `./install.sh` on a clean checkout.
3. Keep PRs focused, one pattern or one config concern at a time.
4. Open a PR describing the use case and, for prompt patterns, a short
   example of the output it produces.

## Licensing
By contributing you agree your contribution is licensed under Apache-2.0,
consistent with this repo and upstream PAL MCP. See [LICENSE](./LICENSE) and
[NOTICE](./NOTICE).

## Conduct
Be decent. Assume good faith. Disagreement is fine, that's literally the
point of the project, but keep it about the work.
