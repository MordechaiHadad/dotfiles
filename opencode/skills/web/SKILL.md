---
name: web
description: A skill about my web dev conventions and best practices.
---

## Best Practices
- Always use modern flexbox and grid layouts instead of floats, inline-blocks, and manual margins for layout.
- Do not use stuff like `inset-0 z-50` for modals, use modern modal techniques that does it automatically and handles accessibility.
- Prefer using fontsource for installing fonts

## Svelte

### Best Practices
- Use the following package: https://github.com/MordechaiHadad/sveltlana for creating svelte components, you can download specific components using: `bunx sveltlana list`

### Package Management
- For new projects, prefer using `bun` for package management and runtime, for existing projects look for a lock file and determine whenever to use bun or node + npm.
