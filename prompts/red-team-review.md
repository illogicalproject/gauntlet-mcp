# Adversarial review — one model attacks another's work

**Goal:** stop a model from validating its own output. The author model
produces; a *different* model is told to break it.

## Pattern
1. Author model does the work (your CLI's native model, e.g. Claude).
2. `challenge` forces a critical stance on that work.
3. `clink` hands the same artifact to a different vendor's model for a
   second, independent attack in a fresh context.
4. You read only the surviving objections.

## Template
```
Here is the <code / design / plan> I just produced:
<paste or reference files>

Step 1 — Use challenge to argue the strongest case that this is WRONG,
incomplete, or unsafe. Do not soften. List concrete failure modes.

Step 2 — Use clink with gemini codereviewer to independently review the
same artifact for the issues challenge did NOT raise. Fresh eyes, no
access to step 1's reasoning.

Step 3 — Give me the union of real issues, ranked by severity, and mark
which ones both passes agreed on (high confidence) vs. only one raised.
```

## Reading the result
- **Both models flag it** → treat as real, fix first.
- **Only one flags it** → investigate; could be a true edge case or a
  model-specific false positive.
- **Neither flags it** → not proof it's correct, only that two
  architectures missed nothing obvious.
