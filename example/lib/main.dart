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
              // Basic usage: responsive font scaling
              FlexiText(
                title: "Basic Responsive Text",
                sizes: {300: 12, 600: 16, 1200: 24},
              ),
              const SizedBox(height: 16),

              // With style
              FlexiText(
                title: "Colored & Bold Text",
                sizes: {300: 12, 600: 18, 1200: 28},
                style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Removed padding usage
              FlexiText(
                title: "Text without Padding",
                sizes: {300: 10, 600: 14, 1200: 22},
                style: const TextStyle(color: Colors.green),
              ),
              const SizedBox(height: 16),

              // With min/max font size
              FlexiText(
                title: "Clamped Font Size",
                sizes: {300: 5, 600: 40, 1200: 60},
                minFontSize: 12,
                maxFontSize: 36,
                style: const TextStyle(color: Colors.purple),
              ),
              const SizedBox(height: 16),

              // With alignment, maxLines, and overflow
              FlexiText(
                title:
                    "This is a very long text that will overflow if it is too long for the container",
                sizes: {300: 10, 600: 14, 1200: 20},
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.orange),
              ),
              const SizedBox(height: 16),

              // With semantics label for accessibility
              FlexiText(
                title: "Accessible Text",
                sizes: {300: 12, 600: 18, 1200: 24},
                semanticsLabel: "This text is labeled for accessibility",
                style: const TextStyle(color: Colors.teal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
