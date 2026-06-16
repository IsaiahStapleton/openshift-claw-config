# openshift-claw-config

A [claw-collections](https://github.com/redhat-et/claw-collections) bundle for the OpenShift Claw instance "Podling".

## Layout

```
collection/
  openclaw.json          config seed: agent identity, curated skills.allowBundled
  exec-approvals.json    execution approval policy
  workspace-main/        primary agent workspace files
    AGENTS.md            agent behavior rules and constraints
    SOUL.md              personality and communication style
    IDENTITY.md          name and role
    USER.md              user profile and preferences
    TOOLS.md             environment-specific tool notes
    HEARTBEAT.md         periodic heartbeat checklist
    memory/              daily memory files (created at runtime)
  skills/                shared skills
  cron/jobs.json         scheduled jobs
```

## Deploy

Wire this collection into your Claw CR:

```yaml
spec:
  agentFiles:
    git:
      url: https://github.com/IsaiahStapleton/openshift-claw-config.git
      ref: main
      path: collection
```

The operator seeds the bundle onto the Claw's PVC at first boot (IfMissing policy). After that, live edits persist on the PVC across restarts.
