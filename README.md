# Gitpin clients

Open-source clients for [Gitpin](https://gitpin.dev), managed Git hosting for AI agents.

This repository is the public home for Gitpin client artifacts. The hosted service backend and deployment are maintained separately. Installation does not require that private source.

Public documentation starts at [llms.txt](https://gitpin.dev/llms.txt) and [the docs index](https://gitpin.dev/docs). Public onboarding, the public Git and API gateway, customer charging and the public MCP endpoint are not open. No CLI or SDK package is released.

## Install

Install the agent skill with the current [skills CLI](https://github.com/vercel-labs/skills):

```sh
npx skills add https://github.com/writeitai/gitpin --skill gitpin -a codex -y
```

`--skill gitpin` selects this repository's only skill. `-a codex` installs it for Codex; pass another agent name the CLI supports, or repeat `-a`, when needed. The skill source is [`skills/gitpin/SKILL.md`](skills/gitpin/SKILL.md).

## Authentication

The owner installs a scoped key in trusted runtime configuration. The skill expects:

- `GITPIN_API_ORIGIN` — the deployment origin, with no credentials or path
- `GITPIN_KEY` — the scoped secret
- `GITPIN_ORGANIZATION_ID` and `GITPIN_REPOSITORY_ID` — public UUIDs

Git uses username `gitpin` and that secret as the HTTP Basic password. REST and MCP use `Authorization: Bearer`. Do not put the secret in a URL, command argument, Git config, chat, log or repository file, and do not paste it into an agent transcript. Issuing the first key is a human owner step; agents do not sign up or call owner browser routes. See [keys and scopes](https://gitpin.dev/docs/keys) and [owner setup](https://gitpin.dev/docs/owner-setup).

## Usage

Follow the installed skill. Ordinary Git remains the client for clone, fetch, commit and push. Use the HTTP API for pull requests, content, credentials and history replacement, and the private MCP adapter only where the owner says it is deployed. The contract is [OpenAPI](https://gitpin.dev/docs/openapi.json).

A representative change is: confirm the repository `state` is `ready`, clone with the credential helper from the skill, push a working branch, open a pull request, read the diff, and merge only with a key that has `merge`. Protected `main` rejects ordinary writes. Retry only under the skill's idempotency rules. Public charging is not activated.

There is no CLI or SDK command in this repository. Browser login for a future CLI is not implemented.

## Contributing

Submit changes through pull requests to `main`. Keep changes focused, document shipped behavior and include relevant validation. See [AGENTS.md](AGENTS.md) for working conventions.

Public client CI uses GitHub-hosted runners. `./scripts/check-skill.sh` checks the skill frontmatter and installs it with `skills` CLI 1.7.4. Production credentials, deployment jobs and private infrastructure configuration do not belong in this repository.

## License

[Apache License 2.0](LICENSE).
