# Providers

Gauntlet runs on whatever models you have keys for. The PAL server underneath
already speaks to every provider below out of the box. You don't wire anything
up. You add a key, and that provider's models become callable by name in your
prompts. For red-teaming you want **at least two providers from different
vendors** so the models checking each other have genuinely different blind
spots.

Check what's live at any time with the `listmodels` tool inside your CLI.

## Supported out of the box

| Provider | Env var | Get a key | Notable models |
|----------|---------|-----------|----------------|
| Google Gemini | `GEMINI_API_KEY` | https://aistudio.google.com/app/apikey | gemini-2.5-pro, gemini-2.5-flash |
| OpenAI | `OPENAI_API_KEY` | https://platform.openai.com/api-keys | gpt-5, o-series |
| Anthropic | `ANTHROPIC_API_KEY` | https://console.anthropic.com/ | claude opus / sonnet |
| X.AI (Grok) | `XAI_API_KEY` | https://console.x.ai/ | grok |
| Azure OpenAI | `AZURE_OPENAI_API_KEY` + `AZURE_OPENAI_ENDPOINT` | Azure Portal | your Azure deployments |
| OpenRouter | `OPENROUTER_API_KEY` | https://openrouter.ai/ | one key, many models (GPT, Mistral, etc.) |
| DIAL | `DIAL_API_KEY` | enterprise gateway | unified enterprise access |
| Local / on-device | `CUSTOM_API_URL` | Ollama / LM Studio / vLLM | llama3.2, qwen, etc. |

### Turn one on
Add the key to `pal-mcp-server/.env`, then restart your MCP client. Example:

```bash
echo 'OPENAI_API_KEY=sk-...' >> pal-mcp-server/.env
echo 'XAI_API_KEY=xai-...'   >> pal-mcp-server/.env
```

Then confirm inside your CLI:

```
listmodels
```

You should see the provider flip from ❌ Not configured to ✅ Configured.

### Pick a unified gateway OR native keys, not both
If you use OpenRouter or DIAL (one key, many models), don't also set the native
OpenAI/Gemini/XAI keys. Having two unified providers makes model routing
ambiguous. Native keys give the most direct access and are recommended for
red-teaming; OpenRouter is the fastest way to get many models with a single key.

### Local models are a free extra voice
A local model via Ollama costs nothing per call and adds a third architecture to
the debate. Point `CUSTOM_API_URL` at it:

```bash
CUSTOM_API_URL=http://localhost:11434/v1
CUSTOM_MODEL_NAME=llama3.2
```

## Adding a provider that isn't listed

Provider support lives in the upstream PAL server, not in this kit. If you want
a provider Gauntlet doesn't list yet:

1. Check whether OpenRouter already exposes it. That's usually the fastest path,
   no new code required.
2. If it needs native support, follow upstream PAL's guide:
   [docs/adding_providers.md](https://github.com/BeehiveInnovations/pal-mcp-server/blob/main/docs/adding_providers.md),
   and open the PR against [BeehiveInnovations/pal-mcp-server](https://github.com/BeehiveInnovations/pal-mcp-server).
3. Model rosters per provider are JSON in the server's `conf/` directory
   (`conf/openai_models.json`, `conf/gemini_models.json`, etc.) if you only need
   to expose a new model on an existing provider.

Contributions to Gauntlet itself (new red-team prompts, presets, docs) are
welcome here. See [CONTRIBUTING.md](../CONTRIBUTING.md).
