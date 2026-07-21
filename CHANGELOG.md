# Changelog

All notable changes to this project will be documented in this file.

## 1.1.4

### Added
- Android root detection
    - Detect `su` binary
    - Detect root management applications
    - Detect dangerous system paths
    - Detect test-keys builds
    - Detect `which su`

- Android debugger detection

- iOS debugger detection

### Improved
- Refactored root detection implementation.
- Improved security report generation.
- Updated example application.