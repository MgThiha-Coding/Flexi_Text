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

    testWidgets('Supports onTap', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: FlexiText(
            title: "Tap Me",
            size: 20,
            onTap: () {
              tapped = true;
            },
          ),
        ),
      );

      await tester.tap(find.text("Tap Me"));
      expect(tapped, true);
    });

    testWidgets('Supports alignment', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: FlexiText(
            title: "Aligned Text",
            size: 20,
            alignment: Alignment.centerRight,
          ),
        ),
      );

      final alignWidget = tester.widget<Align>(find.byType(Align));
      expect(alignWidget.alignment, Alignment.centerRight);
    });
  });
}
