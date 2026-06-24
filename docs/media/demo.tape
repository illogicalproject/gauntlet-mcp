# VHS tape for the Gauntlet demo. Render with: vhs docs/media/demo.tape
# Produces docs/media/demo.gif from the staged transcript in demo-run.sh.
# Docs: https://github.com/charmbracelet/vhs

Output docs/media/demo.gif

Set FontSize 18
Set Width 1100
Set Height 720
Set Padding 24
Set Theme "Catppuccin Mocha"
Set TypingSpeed 55ms
Set PlaybackSpeed 1.0

# Type the command, then let the staged session play out and record it.
Type "bash docs/media/demo-run.sh"
Sleep 400ms
Enter
Sleep 16s
