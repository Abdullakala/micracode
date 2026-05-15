---
name: docker-environment-setup
description: Workflow command scaffold for docker-environment-setup in micracode.
allowed_tools: ["Bash", "Read", "Write", "Grep", "Glob"]
---

# /docker-environment-setup

Use this workflow when working on **docker-environment-setup** in `micracode`.

## Goal

Establish or update the Docker-based development/runtime environment, including Dockerfile, docker-compose, and related configs.

## Common Files

- `Dockerfile`
- `.dockerignore`
- `docker-compose.yml`
- `.env.docker.example`
- `README.md`
- `docker/start.sh`

## Suggested Sequence

1. Understand the current state and failure mode before editing.
2. Make the smallest coherent change that satisfies the workflow goal.
3. Run the most relevant verification for touched files.
4. Summarize what changed and what still needs review.

## Typical Commit Signals

- Edit or add Dockerfile to define runtime image.
- Update or add .dockerignore to control Docker build context.
- Add or update docker-compose.yml for orchestration.
- Add or update environment example files (e.g., .env.docker.example).
- Update README.md with instructions.

## Notes

- Treat this as a scaffold, not a hard-coded script.
- Update the command if the workflow evolves materially.