#!/usr/bin/env bash
# Staged re-enactment of a Gauntlet session, used to render the README demo GIF.
# This is NOT a live model call: it prints a representative transcript with
# realistic pacing so the GIF is fast, clean, and deterministic. The findings
# below mirror the kind of output a real `challenge` + `clink` run produces.
set -euo pipefail

# colors
B=$'\033[1m'; D=$'\033[2m'; R=$'\033[31m'; G=$'\033[32m'
Y=$'\033[33m'; C=$'\033[36m'; M=$'\033[35m'; X=$'\033[0m'
p(){ printf '%b\n' "$1"; }
pause(){ sleep "${1:-0.6}"; }

clear 2>/dev/null || true
p "${D}# Two model families attack the same code. Disagreement is signal.${X}"
pause 0.8
p "${B}${C}> ${X}${B}Use challenge to break the auth refactor I just wrote, then clink${X}"
p "${B}  with gemini codereviewer to find what it missed. Rank the union.${X}"
pause 1.0

p ""
p "${M}● challenge${X} ${D}(claude)${X}  attacking auth_refactor.py ..."
pause 1.2
p "  ${R}HIGH${X}  Session token not rotated after privilege change"
pause 0.7
p "  ${Y}MED${X}   Timing-unsafe string compare on the session token"
pause 1.0

p ""
p "${M}● clink → gemini${X} ${D}(codereviewer, fresh context)${X}  independent pass ..."
pause 1.2
p "  ${R}HIGH${X}  Refresh token persisted in plaintext (no hashing)"
pause 0.7
p "  ${Y}MED${X}   Timing-unsafe string compare on the session token"
pause 0.7
p "  ${D}note: no /login rate limit, low severity, logged${X}"
pause 1.0

p ""
p "${B}${C}Union, ranked by severity${X}"
p "${D}──────────────────────────────────────────────────────────${X}"
pause 0.4
p "  1. ${R}HIGH${X}  Refresh token in plaintext        ${D}gemini${X}"
pause 0.5
p "  2. ${R}HIGH${X}  Session not rotated on priv change ${D}challenge${X}"
pause 0.5
p "  3. ${Y}MED${X}   Timing-unsafe token compare        ${G}${B}both models agreed ✓${X}"
pause 1.0
p ""
p "${G}${B}→${X} ${B}Fix #3 first:${X} two architectures flagged it independently."
pause 1.6
