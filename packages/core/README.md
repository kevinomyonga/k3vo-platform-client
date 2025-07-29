# Core

This directory contains shared foundational logic used across the app:
- Networking
- Local database
- Analytics
- Models
- Utilities

## Design Principle
Core contains **infrastructure code** — services and libraries shared across modules.

## Guidelines
- No UI code here
- Minimize Flutter dependencies where possible (make it testable and clean)
