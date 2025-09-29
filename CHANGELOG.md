# Changelog

All notable changes to this package will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), 
and this project adheres to [Semantic Versioning](https://semver.org/).

---

## [0.0.1] - 2025-09-30
### Added
- Initial release of `flexi_text`.
- Responsive and flexible Flutter Text widget with **dynamic font scaling**.
- Smooth interpolation between font sizes based on screen width.
- Support for **minFontSize** and **maxFontSize** to control scaling limits.
- Optional **padding** around text without needing additional widgets.
- Support for **textAlign**, **maxLines**, and **overflow** for flexible layouts.
- **Accessibility friendly**: respects `textScaleFactor` and `semanticsLabel`.
- Fallback to **Theme.of(context).textTheme** if no `TextStyle` is provided.
- Fully **MIT licensed** and ready for production usage.

---

### How to update this file

For each new version:

1. Add a new section with the version number and release date.
2. List changes under appropriate headings:
   - Added
   - Changed
   - Deprecated
   - Removed
   - Fixed
   - Security

Example:

```markdown
## [0.0.2] - 2025-10-05
### Added
- New feature XYZ
### Fixed
- Bug ABC
