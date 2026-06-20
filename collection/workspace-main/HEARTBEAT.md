# Nightly Maintenance

Runs once daily (late evening ET). Covers memory promotion, reconciliation,
cluster health, and git push verification in a single pass.

## Memory Promotion

Scan today's daily notes across all agents (`memory/daily-notes/*/YYYY-MM-DD.md`)
for entries that have not been promoted to persistent memory. If any stable,
useful facts are missing from the relevant file, promote them now:

| Daily note content | Promote to |
|---|---|
| Project decisions, status changes | `memory/projects/<project>.md` |
| Architecture decisions, tradeoffs | `memory/decisions/` (propose via `memory/proposals/pending/`) |
| Debugging findings, root causes | `memory/runbooks/*.md` or `memory/notes/debugging-notes.md` |
| Isaiah preferences, workflow patterns | `memory/isaiah/preferences.md` (propose via `memory/proposals/pending/`) |
| Work context changes (new projects, priorities) | `memory/isaiah/work-context.md` or `current-focus.md` |
| New open questions | `memory/notes/open-questions.md` |
| Answered questions | Check the answer off in `memory/notes/open-questions.md` |
| Infrastructure facts (new services, endpoints) | Relevant project file |
| Operator/CR changes | `memory/projects/claw-operator.md` |

**Rules:**
- Only promote **stable facts**, not speculation or in-progress debugging
- Direct-write for routine updates (daily notes, runbooks, project files, open questions)
- Propose via `memory/proposals/pending/` for durable cross-agent facts or Isaiah personal context

## Memory Reconciliation

Review the prior 2-3 daily notes and reconcile `MEMORY.md`:

- Update Active Projects quick links if projects were added/archived
- Ensure no duplication between MEMORY.md and the detailed files it indexes
- Remove stale entries that no longer reflect reality
- Check `review_after` dates on memory files; surface anything overdue to Isaiah

## Cluster Health Check

Quick K8s API check:
- Are both pods (podling + proxy) Running?
- Are both deployments 1/1 ready?
- Any Warning events in the last 24 hours?

If anything looks wrong, mention it. Otherwise stay quiet.

## Git Push Check

- Check if there are uncommitted changes older than 24 hours
- If the last push failed (check git status for divergence), mention it

If everything is clean, stay quiet.

## Response

- `HEARTBEAT_OK` when nothing needs attention
- Mention noteworthy items only (significant project status shifts, overdue reviews, cluster issues, push failures)
