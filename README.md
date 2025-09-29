# FlexiText

[![Pub Version](https://img.shields.io/pub/v/flexi_text.svg)](https://pub.dev/packages/flexi_text)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A **responsive and flexible Text widget for Flutter** that automatically adjusts font size based on screen width. Ideal for mobile, tablet, and desktop applications.

---

## 🌟 Features

- **Responsive Font Size:** Automatically scales text according to screen width.
- **Smooth Interpolation:** Font size transitions smoothly between breakpoints.
- **Min/Max Font Size:** Prevent text from becoming too small or too large.
- **Accessibility Friendly:** Respects `textScaleFactor` and supports `semanticsLabel`.
- **Flexible Layout:** Supports `TextAlign`, `maxLines`, and `overflow`.
- **Theming Support:** Falls back to `Theme.of(context).textTheme` if no style is provided.
- **MIT Licensed:** Free to use and modify in any project.

---

## 📦 Installation

Add this to your `pubspec.yaml`:

dependencies:
  flexi_text: ^0.0.1

Then run:

flutter pub get

---

## 🛠 Usage

Import the package:

import 'package:flexi_text/flexi_text.dart';

Basic usage:

FlexiText(
  title: "Hello World",
  sizes: {300: 10, 600: 14, 1200: 24},
)

Advanced usage with **min/max font size, styling, alignment**:

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

---

## 🧩 How It Works

1. Define a **map of screen width to font size**:

sizes: {300: 10, 600: 14, 1200: 24}

2. The widget **interpolates font size** between defined breakpoints.
3. Text scales automatically according to `MediaQuery.textScaleFactor`.
4. Optional min/max font size ensures readability across devices.

---

## 💡 Best Practices

- **Wrap FlexiText with Padding** only if needed at the layout level. Avoid hardcoding padding inside the widget.
- **Use clear breakpoints** for mobile, tablet, and desktop screens.
- **Combine with Theme** for consistent styling across your app.

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

---

## 📝 License

MIT License © 2025 **Min Thiha Aung**

See LICENSE for details.

---

## 📌 Pub.dev Page Appearance

All code and text are combined here in a single block so users can copy everything at once without multiple copy buttons. This README is fully optimized for **GitHub and pub.dev**.
