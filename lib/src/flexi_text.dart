import 'package:flutter/material.dart';

/// A responsive and flexible text widget that automatically adjusts
/// its font size based on the available screen width.
/// 
/// Designed for mobile, tablet, and desktop screens with smooth
/// interpolation between breakpoints.
///
/// Example usage:
/// ```dart
/// FlexiText(
///   title: "Responsive Text",
///   sizes: {300: 12, 600: 16, 1200: 24},
///   minFontSize: 10,
///   maxFontSize: 28,
///   padding: EdgeInsets.all(8),
///   style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
///   textAlign: TextAlign.center,
///   maxLines: 2,
/// )
/// ```
class FlexiText extends StatelessWidget {
  /// The text to display.
  final String title;

  /// Map of screen width breakpoints to font sizes.
  /// The key is the screen width (in logical pixels) and the value is the font size.
  final Map<double, double> sizes;

  /// Optional text style. If not provided, defaults to the theme's bodyMedium style.
  final TextStyle? style;

  /// Minimum font size to prevent text from being too small.
  final double? minFontSize;

  /// Maximum font size to prevent text from being too large.
  final double? maxFontSize;

  /// Optional padding around the text.
  final EdgeInsetsGeometry? padding;

  /// Optional semantics label for accessibility.
  final String? semanticsLabel;

  /// Optional text alignment.
  final TextAlign? textAlign;

  /// Optional maximum number of lines for the text.
  final int? maxLines;

  /// Optional overflow behavior.
  final TextOverflow? overflow;

  /// Creates a [FlexiText] widget.
  const FlexiText({
    super.key,
    required this.title,
    required this.sizes,
    this.style,
    this.minFontSize,
    this.maxFontSize,
    this.padding,
    this.semanticsLabel,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  /// Calculates the font size based on screen width using linear interpolation
  /// between the closest defined breakpoints in [sizes].
  double _getFontSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // ignore: deprecated_member_use
    final textScale = MediaQuery.of(context).textScaleFactor;

    if (sizes.isEmpty) return 14 * textScale;

    // Sort breakpoints in ascending order for interpolation
    final sortedSizes = sizes.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    double lowerWidth = sortedSizes.first.key;
    double upperWidth = sortedSizes.last.key;
    double lowerSize = sortedSizes.first.value;
    double upperSize = sortedSizes.last.value;

    for (final entry in sortedSizes) {
      if (width == entry.key) return entry.value * textScale;
      if (width > entry.key) {
        lowerWidth = entry.key;
        lowerSize = entry.value;
      } else {
        upperWidth = entry.key;
        upperSize = entry.value;
        break;
      }
    }

    // Linear interpolation between the two closest breakpoints
    double fontSize = (upperWidth == lowerWidth)
        ? lowerSize
        : lowerSize + (upperSize - lowerSize) * (width - lowerWidth) / (upperWidth - lowerWidth);

    // Clamp font size to min/max if provided
    if (minFontSize != null) fontSize = fontSize.clamp(minFontSize!, double.infinity);
    if (maxFontSize != null) fontSize = fontSize.clamp(0, maxFontSize!);

    return fontSize * textScale;
  }

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      title,
      style: style?.copyWith(fontSize: _getFontSize(context)) ??
          Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: _getFontSize(context)) ??
          TextStyle(fontSize: _getFontSize(context)),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      semanticsLabel: semanticsLabel ?? title,
    );

    // Wrap text in Padding if provided
    return padding != null
        ? Padding(padding: padding!, child: textWidget)
        : textWidget;
  }
}
