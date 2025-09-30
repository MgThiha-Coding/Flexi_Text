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

## [0.0.2] - 2025-10-05
### Added
- Updated README with improved examples and formatting.
- Added demonstration of **min/max font size** usage.
- Enhanced **semanticsLabel** support for accessibility.
- Provided advanced usage examples including `textAlign`, `maxLines`, and `overflow`.

---

## [0.0.3] - 2025-10-10
### Changed
- Minor optimizations in font size interpolation.
- Updated README for better readability on pub.dev.
- Example app code improvements and alignment adjustments.
- Fixed minor issues with style fallbacks.

---

## [0.0.4] - 2025-10-30
### Changed
- Removed optional `padding` from `FlexiText`.
- Updated README to provide a **single-copy button** version for easier user experience.
- Minor UI improvements and formatting updates.
- Improved package description and usage instructions for pub.dev.

---

## [0.0.5] - 2025-10-31
### Added
- Added **single fixed size** support via `size` property for simpler font scaling.
- Added **alignment** property to wrap text in `Align` without extra widgets.
- Added optional **onTap** callback for interactive text.
- Updated example app to demonstrate `size`, `alignment`, and `onTap` usage.
- README updated with new 0.0.5 examples.
