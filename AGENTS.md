# Working principles

Build the simplest solution that meets current requirements. Keep changes focused and avoid speculative clients, features and abstractions.

## Scope

This is Gitpin's public client repository. Keep CLI/SDK implementations and shared client-side API and authentication logic here. The installable agent skill lives in `skills/gitpin/`. Keep the hosted backend, deployment and private infrastructure in their owning repository. Client builds and installation must work without access to private source.

The repository currently contains that skill, its install/auth/usage README and licensing. No CLI or SDK is implemented. Do not advertise unimplemented commands, authentication flows or package releases as usable.

## Credentials and behavior

Use the product API; never bypass its authorization, quotas, metering or repository lifecycle rules by calling the private hosting engine. Preserve server error codes, idempotency and uncertain-write recovery. Never automatically retry a mutation without the operation's documented safe retry contract.

Keep credentials out of Git, command arguments, remote URLs, prompts, logs and test fixtures. Use injected scoped keys for automated callers. Credential issuance must keep one-time secrets out of ordinary diagnostics and model transcripts.

## Stack and checks

Use Python managed with uv for Python client work. Format and lint with Ruff and type-check with Pyright. Configure those checks alongside the first Python implementation; there are no Python sources or checks configured yet. Run the applicable checks before opening a pull request and record the results.

Run public-repository CI on GitHub-hosted runners, never the private shared runner pool. Add no production credentials or deployment workflows. Do not enable Artifact Analysis or automatic container vulnerability scanning.

## Changes through pull requests only

Every change reaches `main` through a pull request. Never push directly to `main`. Verify public documentation and examples contain no private source or internal operational data.
