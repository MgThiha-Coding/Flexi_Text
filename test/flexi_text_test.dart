import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flexi_text/flexi_text.dart';

void main() {
  group('FlexiText Widget Tests', () {
    testWidgets('Displays the correct text', (WidgetTester tester) async {
      const testText = "Hello FlexiText";

      await tester.pumpWidget(
        MaterialApp(
          home: FlexiText(
            title: testText,
            sizes: {300.0: 12.0, 600.0: 18.0},
          ),
        ),
      );

      expect(find.text(testText), findsOneWidget);
    });

    testWidgets('Applies TextStyle correctly', (WidgetTester tester) async {
      const testText = "Styled Text";

      await tester.pumpWidget(
        MaterialApp(
          home: FlexiText(
            title: testText,
            sizes: {300.0: 12.0, 600.0: 18.0},
            style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.style?.color, Colors.red);
      expect(textWidget.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('Respects padding', (WidgetTester tester) async {
      const testText = "Padded Text";

      await tester.pumpWidget(
        MaterialApp(
          home: FlexiText(
            title: testText,
            sizes: {300.0: 12.0, 600.0: 18.0},
            padding: const EdgeInsets.all(16),
          ),
        ),
      );

      expect(find.byType(Padding), findsOneWidget);
      final paddingWidget = tester.widget<Padding>(find.byType(Padding));
      expect(paddingWidget.padding, const EdgeInsets.all(16));
    });

    testWidgets('Supports maxLines and overflow', (WidgetTester tester) async {
      const longText =
          "This is a very long text that should be truncated when maxLines is set.";

      await tester.pumpWidget(
        MaterialApp(
          home: FlexiText(
            title: longText,
            sizes: {300.0: 12.0, 600.0: 18.0},
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(longText));
      expect(textWidget.maxLines, 1);
      expect(textWidget.overflow, TextOverflow.ellipsis);
    });
  });
}
