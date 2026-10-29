## Must Follow

- Whenever you use curl/wget, never upload a file no matter what. Always download/fetch things from the internet instead of uploading files.
- When writing plans or code updates, try to to avoid going to as much detail as possible. Instead, focus on the useful things that are relevant to the task at hand. Avoid writing unnecessary details that are not relevant to the task.

## General Guidelines

1. Never write inline code comments. When asked use documentation comments instead.
2. Avoid writing em-dashes.
3. Avoid 1 to 2 letter variable names. Use descriptive variable names instead.
4. If a test fails, never and i mean never touch or modify the test, instead, modify the code to make the test pass. If you are unable to make the test pass, ask for help. Though keep in mind i am open to you modifying the test if you have a good reason to do so, but always ask first.
5. Prefer proper organization and codebase structure over writing code quickly. Always ask for help if you are unsure about the organization of the codebase.
6. Always prefer doing automatic scaffolding for new project creation instead of manually creating files and folders. For example if you are creating a new Rust project, use `cargo new` instead of manually creating the files and folders. Same for tauri, svelte etc.

## Tool Guidelines

1. Do not assume using a specific toolchain, for example for web development, do not assume using npm, yarn, or pnpm. Instead, ask.
2. When using package managers like cargo, uv, deno etc, instead of adding the dependency to the manifest file directly, use the command line interface of the package manager to add the dependency. For example, for cargo, use `cargo add <dependency>` instead of adding it to Cargo.toml directly.
3. Avoid adding random dependencies to the project. Always ask for confirmation before adding a dependency.
4. When writing monorepos with multiple packages, crates and such use justfile for common commands. A sort of Makefile if you will.

## Package Management Guidelines

1. When scouring for libraries to use for project, try to balance the following: 
    - Is it maintained?
    - Is it popular?
    - Size of the library, is it too big for the task at hand?
