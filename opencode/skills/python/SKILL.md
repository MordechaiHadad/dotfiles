---
name: python
description: A skill about my own python conventions and best practices.
---

## Best Practices
- Use mypy and pydantic for type checking and data validation.

# Package Management
- For most projects, prefer using `uv` toolchain by Astral.sh, but do not assume, check for a pyproject.toml file, if it exists good use `uv` otherwise use `pip` and `venv` for virtual environments.

