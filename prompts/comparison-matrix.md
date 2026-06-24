# Comparison matrix — same prompt, every model, side by side

**Goal:** decide which model to actually use for a class of task, with
evidence instead of vibes or benchmark marketing.

## Pattern
Send one fixed prompt to each model, then score the outputs on the same
rubric. Keep the prompt identical so the only variable is the model.

## Template
```
Run this EXACT prompt through gemini-pro, gpt-5, and opus:
"""
<your task prompt — keep it fixed across all models>
"""

Then build a comparison matrix with one row per model and columns:
- Correctness (did it actually solve it?)
- Reasoning depth (did it show real work or assert?)
- What it missed (specific gaps)
- Cost/latency note (if known)
- One-line verdict

End with: which model wins for THIS kind of task, and why.
```

## Tips
- Run it 2–3 times if outputs are non-deterministic and note variance.
- For code, add "include a test that would fail if the answer is wrong."
- Save the matrix — it's your evidence base for model selection over time.
