# Consensus, make models commit and defend a position

**Goal:** turn a vague "what should we do" into a defended debate, so you
see the actual trade-offs instead of three hedged paragraphs.

## Pattern
`consensus` lets you assign each model a stance (for / against / neutral)
and collects a defended position from each.

## Template
```
Use consensus to decide: <the decision, stated as a yes/no or A-vs-B>.

- gemini-pro: argue FOR
- gpt-5: argue AGAINST
- opus: neutral, weigh both and recommend

Each must give: position, top 3 supporting reasons, the single strongest
counter-argument to their own side, and confidence (low/med/high).
Then synthesize where they agree, where they split, and what evidence
would change the answer.
```

## When to use
- Sequencing / prioritization calls ("ship X or Y next")
- Architecture forks with no obvious winner
- "Is this risk acceptable" judgments

## Reading the result
The agreement is rarely the interesting part. Look at **where they split
and why**, that's the real decision surface. If all models converge with
high confidence, the call is probably easy and you were overthinking it.
