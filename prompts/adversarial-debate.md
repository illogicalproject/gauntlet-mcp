# Cross-model debate, iterate to a stronger answer

**Goal:** use disagreement between models as a refinement engine. Propose,
critique, synthesize, repeat until objections stop being novel.

## Pattern
Different vendors play different roles so the critique comes from a
genuinely different architecture, not the same model grading itself.

## Template
```
Round 1
- clink with gemini: PROPOSE a solution to <problem>. Be specific.
- clink with gpt-5: CRITIQUE Gemini's proposal. Strongest objections only.
- (your CLI / claude): SYNTHESIZE a v2 that survives the critique.

Round 2
- Feed v2 back to gpt-5 and gemini: any NEW objection that v2 doesn't
  already handle? If yes, name it. If no, say "no new objections."

Stop when both return "no new objections" or you've done 3 rounds.
Give me the final answer plus the list of objections it had to survive.
```

## Why it works
A solution that survives attacks from two different model families is
sturdier than one any single model is happy with. The "objections it had
to survive" list is also great documentation for *why* the final design
looks the way it does.

## Watch for
- **Sycophancy collapse:** if models just start agreeing, push harder with
  `challenge` or restate that their job is to find what's still wrong.
- **Infinite nitpicking:** cap at 3 rounds. Diminishing returns are real.
