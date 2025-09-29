# FlexiText

[![Pub Version](https://img.shields.io/pub/v/flexi_text.svg)](https://pub.dev/packages/flexi_text)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A **responsive and flexible Text widget for Flutter** that automatically adjusts font size based on screen width. Perfect for **mobile, tablet, and desktop applications**.

---

## 🌟 Features

- **Responsive Font Size:** Automatically scales text according to screen width.
- **Smooth Interpolation:** Font size transitions smoothly between breakpoints.
- **Min/Max Font Size:** Prevent text from being too small or too large.
- **Accessibility Friendly:** Supports `textScaleFactor` and `semanticsLabel`.
- **Flexible Layout:** Supports `TextAlign`, `maxLines`, and `overflow`.
- **Theming Support:** Falls back to `Theme.of(context).textTheme` if no style is provided.
- **MIT Licensed:** Free to use and modify.

---

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  flexi_text: ^0.0.2
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

### Basic Usage

```dart
FlexiText(
  title: "Hello World",
  sizes: {300: 10, 600: 14, 1200: 24},
)
```

### Advanced Usage

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

2. The widget **interpolates font size** between breakpoints.
3. Text scales according to `MediaQuery.textScaleFactor`.
4. Min/max font size ensures readability across devices.

---

## 💡 Best Practices

- **Wrap FlexiText with Padding** only if needed at layout level.
- Use **clear breakpoints** for mobile, tablet, and desktop screens.
- **Combine with Theme** for consistent styling.

---

## 📖 Example App

```dart
import 'package:flutter/material.dart';
import 'package:flexi_text/flexi_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlexiText Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text("FlexiText Demo")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlexiText(
                title: "Mobile Text",
                sizes: {300: 10, 600: 14, 1200: 24},
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 16),
              FlexiText(
                title: "Tablet/Desktop Text",
                sizes: {300: 12, 600: 18, 1200: 28},
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## 📝 License

MIT License © 2025 **Min Thiha Aung**  

See [LICENSE](LICENSE) for details.

---

## 📌 Notes

All text and code are combined into a **single copy block** for GitHub and pub.dev.  
Users can copy everything at once without multiple copy buttons.  
This README is optimized for readability and UI appearance.
