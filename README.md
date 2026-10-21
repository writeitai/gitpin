# Gitpin clients

Open-source clients for [Gitpin](https://gitpin.dev), managed Git hosting for AI agents.

This repository is the public home for the Gitpin CLI and shared client-side API and authentication logic, including the Python and TypeScript SDKs as they are implemented. The hosted service backend and deployment are maintained separately.

## Status

Repository setup only. No CLI, SDK package or client release is available yet. There is currently no supported installation command, client authentication flow or runnable quickstart in this repository. Gitpin public service activation and public documentation are also pending.

Future client releases must be installable from this public repository or its published packages without access to private service source. Installation, authentication, usage examples and supported API coverage will be documented here when the corresponding clients ship.

## Client direction

The CLI will call the Gitpin API for repository management, scoped credentials, file operations and pull requests. Ordinary Git remains the client for clone, fetch, commit and push. Clients must use Gitpin's authorization and lifecycle rules; they do not connect directly to the private hosting engine.

Credentials must stay out of remote URLs, command arguments, repository files and logs. Agents should receive scoped credentials through their runtime's secret configuration. Browser approval for CLI login requires service support and is not implemented here.

## Contributing

Submit changes through pull requests to `main`. Keep changes focused, document shipped behavior and include relevant validation. See [AGENTS.md](AGENTS.md) for working conventions.

Public client CI uses GitHub-hosted runners. Production credentials, deployment jobs and private infrastructure configuration do not belong in this repository.

## License

[Apache License 2.0](LICENSE).
