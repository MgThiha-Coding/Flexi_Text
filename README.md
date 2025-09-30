# FlexiText

[![Pub Version](https://img.shields.io/pub/v/flexi_text.svg)](https://pub.dev/packages/flexi_text)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A **responsive and flexible Text widget for Flutter** that automatically adjusts font size based on screen width. Perfect for **mobile, tablet, and desktop applications**. Supports **single fixed size**, **alignment**, and **onTap** callback.

---

## 🌟 Features

- **Responsive Font Size:** Automatically scales text according to screen width.
- **Single Fixed Size:** Set a fixed `size` for simple font scaling.
- **Smooth Interpolation:** Font size transitions smoothly between breakpoints.
- **Min/Max Font Size:** Prevent text from being too small or too large.
- **Alignment:** Wraps text in `Align` without extra widgets.
- **onTap Callback:** Make text interactive with an optional tap handler.
- **Accessibility Friendly:** Supports `textScaleFactor` and `semanticsLabel`.
- **Flexible Layout:** Supports `TextAlign`, `maxLines`, and `overflow`.
- **Theming Support:** Falls back to `Theme.of(context).textTheme` if no style is provided.
- **MIT Licensed:** Free to use and modify.

---

## 📦 Installation

Add to your `pubspec.yaml`:

dependencies:
  flexi_text: ^0.0.5

Then run:

flutter pub get

---

## 🛠 Usage

Import the package:

import 'package:flexi_text/flexi_text.dart';

### Basic Usage

FlexiText(
  title: "Hello World",
  sizes: {300.0: 10.0, 600.0: 14.0, 1200.0: 24.0},
)

### Single Fixed Size

FlexiText(
  title: "Fixed Size Text",
  size: 20.0,
)

### Alignment and onTap

FlexiText(
  title: "Centered & Clickable Text",
  size: 18.0,
  alignment: Alignment.center,
  onTap: () {
    debugPrint("Text tapped!");
  },
)

### Advanced Responsive Usage

FlexiText(
  title: "Responsive FlexiText",
  sizes: {
    300.0: 10.0,
    600.0: 14.0,
    800.0: 18.0,
    1200.0: 24.0,
  },
  minFontSize: 10.0,
  maxFontSize: 28.0,
  style: TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.bold,
  ),
  textAlign: TextAlign.center,
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
  semanticsLabel: "Important responsive text",
)

---

## 🧩 How It Works

1. Define a **map of screen width to font size**: sizes: {300.0: 10.0, 600.0: 14.0, 1200.0: 24.0}
2. The widget **interpolates font size** between breakpoints.
3. For single fixed size, just set `size: 20.0`.
4. Text scales according to `MediaQuery.textScaleFactor`.
5. Alignment and `onTap` work without extra widgets.

---

## 💡 Best Practices

- **Wrap FlexiText with Padding** only if needed at layout level.
- Use **clear breakpoints** for mobile, tablet, and desktop screens.
- **Combine with Theme** for consistent styling.

---

## 📖 Example App

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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FlexiText(
                title: "Mobile Text",
                sizes: {300.0: 10.0, 600.0: 14.0, 1200.0: 24.0},
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 16),
              FlexiText(
                title: "Tablet/Desktop Text",
                sizes: {300.0: 12.0, 600.0: 18.0, 1200.0: 28.0},
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              FlexiText(
                title: "Fixed Size Text",
                size: 20.0,
                style: const TextStyle(color: Colors.green),
              ),
              const SizedBox(height: 16),
              FlexiText(
                title: "Centered & Clickable Text",
                size: 18.0,
                alignment: Alignment.center,
                onTap: () {
                  debugPrint("Text tapped!");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

---

## 📝 License

MIT License © 2025 **Min Thiha Aung**  

See LICENSE for details.

---

## 📌 Notes

All text and code are combined into a **single copy block** for GitHub and pub.dev. Users can copy everything at once without multiple copy buttons. This README is optimized for readability and UI appearance.
