# Reading a multi-model red-team review (plain-language guide)

For reviewers, clients, and anyone who didn't run the prompts themselves.

## The one idea
No single AI model is trustworthy on its own for high-stakes work. Each
has consistent blind spots. This kit runs the same problem past several
models from different makers (Google, OpenAI, Anthropic, others) and makes
them argue. **Disagreement is the product.** It points a flashlight at the
parts a single model would have waved through.

## How to read the output

**Agreement between models = higher confidence.** When Gemini and GPT and
Claude all flag the same issue, take it seriously. Three different systems
independently arriving at the same concern is strong signal.

**Disagreement = look closer, don't average.** If only one model raises an
issue, that's not noise to ignore. It's either a real edge case the others
missed, or a quirk of that one model. Either way it deserves a human look.
Do not "average" the models into a mushy middle, read *why* they split.

**Silence is not safety.** If no model objects, that means nothing
obvious is wrong to those models. It is not a proof of correctness. Big,
novel, or domain-specific risks can sail past all of them.

## What this is good for
- Security and code review (a model attacking code another model wrote)
- Big either/or decisions where you want the trade-offs made explicit
- Choosing which model to rely on for a recurring task, with evidence

## What it is not
- Not a substitute for human judgment, testing, or a domain expert.
- Not deterministic, models can answer differently run to run. For
  important calls, run it more than once.

## Credit
The engine underneath is the open-source PAL MCP server by
BeehiveInnovations. This kit is the red-team configuration and playbook
layered on top.
