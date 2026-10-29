---
name: typescript
description: A skill about my own typescript/javascript conventions and best practices.
---

## Best practices
- Use `eslint` and `prettier` for code linting and formatting.
- Use ArkType for runtime data validation
- Prefer using type keyword over interface for type definitions, unless you need to extend or implement an interface.

## Package Management
- For new projects, prefer using `bun` for package management and runtime, for existing projects look for a lock file and determine whenever to use bun or node + npm.
