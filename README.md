# FlexiText

[![Pub Version](https://img.shields.io/pub/v/flexi_text.svg)](https://pub.dev/packages/flexi_text)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A **responsive and flexible Text widget for Flutter** that automatically adjusts font size based on screen width. Ideal for mobile, tablet, and desktop applications.

---

## 🌟 Features

- **Responsive Font Size:** Automatically scales text according to screen width.
- **Smooth Interpolation:** Font size transitions smoothly between breakpoints.
- **Min/Max Font Size:** Prevent text from becoming too small or too large.
- **Optional Padding:** Easily add spacing around text without wrapping.
- **Accessibility Friendly:** Respects `textScaleFactor` and supports `semanticsLabel`.
- **Flexible Layout:** Supports `TextAlign`, `maxLines`, and `overflow`.
- **Theming Support:** Falls back to `Theme.of(context).textTheme` if no style is provided.
- **MIT Licensed:** Free to use and modify in any project.

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  flexi_text: ^0.0.1
```

Then run:

```bash
flutter pub get
```

---

## 🛠 Usage

Import the package:

```dart
import 'package:flexi_text/flexi_text.dart';
```

Basic usage:

```dart
FlexiText(
  title: "Hello World",
  sizes: {300: 10, 600: 14, 1200: 24},
)
```

Advanced usage with **min/max font size, padding, styling, alignment**:

```dart
FlexiText(
  title: "Responsive FlexiText",
  sizes: {
    300: 10,
    600: 14,
    800: 18,
    1200: 24,
  },
  minFontSize: 10,
  maxFontSize: 28,
  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  style: TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.bold,
  ),
  textAlign: TextAlign.center,
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
  semanticsLabel: "Important responsive text",
)
```

---

## 🧩 How It Works

1. Define a **map of screen width to font size**:

```dart
sizes: {300: 10, 600: 14, 1200: 24}
```

2. The widget **interpolates font size** between defined breakpoints.
3. Text scales automatically according to `MediaQuery.textScaleFactor`.
4. Optional min/max font size ensures readability across devices.

---

## 💡 Best Practices

- **Wrap FlexiText with Padding** only if needed. Avoid hardcoding padding unless necessary.
- **Use clear breakpoints** for mobile, tablet, and desktop screens.
- **Combine with Theme** for consistent styling across your app.

---

## 📖 Example App

```dart
import 'package:flutter/material.dart';
import 'package:flexi_text/flexi_text.dart';

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FlexiText Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlexiText(
              title: "Mobile Text",
              sizes: {300: 10, 600: 14, 1200: 24},
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 16),
            FlexiText(
              title: "Tablet/Desktop Text",
              sizes: {300: 12, 600: 18, 1200: 28},
              padding: EdgeInsets.all(8),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: DemoPage()));
}
```

---

## 📝 License

MIT License © 2025 **Min Thiha Aung**

See [LICENSE](LICENSE) for details.

---

## 📌 Pub.dev Page Appearance

All code blocks use **triple backticks**, so users can click the **copy button** on any code block to paste examples directly into their Flutter projects. This README is fully optimized for **GitHub and pub.dev**.
