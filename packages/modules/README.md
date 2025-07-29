# Modules

Feature-based screens and logic used in K3VO.

Each subfolder here should represent a distinct user-facing module, e.g.:
- `authentication/`
- `profile/`
- `home/`
- `settings/`

Each module should:
- Be independently testable
- Avoid direct dependencies on other modules (go through `core`)
- Own its UI, state, and navigation logic
