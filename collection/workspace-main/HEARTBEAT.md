# Heartbeat Checklist

Keep this small to limit token burn. Reply `HEARTBEAT_OK` when nothing
needs attention.

## Memory

Memory promotion is handled automatically by the native dreaming pass: it
promotes durable facts from daily notes into `MEMORY.md`, and `memory-wiki`
compiles the knowledge wiki. You do not need to do manual promotion or
reconciliation here.

If something important from recent conversation is not yet written down,
save it to today's daily note (`memory/YYYY-MM-DD.md`).

## Cluster health (quick)

- Are both pods (podling + proxy) Running and 1/1 ready?
- Any Warning events in the last 24h?

Mention anything wrong; otherwise stay quiet.

## Response

- `HEARTBEAT_OK` when nothing needs attention
- Mention only noteworthy items (cluster issues, anything urgent)
