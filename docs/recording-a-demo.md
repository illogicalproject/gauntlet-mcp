# Recording the demo GIF

The README shows a short loop of Gauntlet running a cross-model red-team in
a real CLI. Keep it under ~15 seconds and ~760px wide so it loads fast on
GitHub. Two easy paths:

## Option A: VHS (cleanest, scripted, reproducible)
[VHS](https://github.com/charmbracelet/vhs) renders a `.tape` script to a GIF,
so the demo is deterministic and re-recordable.

```bash
brew install vhs            # macOS
vhs docs/media/demo.tape    # outputs docs/media/demo.gif
```

A starter tape is provided at `docs/media/demo.tape`, edit the typed
commands to match your setup, then run the command above.

## Option B: asciinema + agg (record a real session)
```bash
brew install asciinema agg
asciinema rec demo.cast          # run your gauntlet prompt, then exit
agg demo.cast docs/media/demo.gif
```

## What to show (15 seconds, high signal)
1. A one-line prompt kicking off `challenge` + `clink with gemini`.
2. The two models surfacing *different* issues.
3. The final ranked list, with the "both models agreed" rows highlighted.

Pick the comparison-matrix or red-team-review prompt from `prompts/`, they
demo well because the disagreement between models is visible on screen.
