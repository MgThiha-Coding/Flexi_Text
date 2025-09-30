import 'package:flutter/material.dart';

/// A responsive and flexible text widget that adapts its font size
/// to either a fixed size or screen width breakpoints.
///
/// You can provide:
/// - [size] for a single fixed font size
/// - [sizes] for responsive font sizes across breakpoints
///
/// Additional options include alignment, min/max font size clamping,
/// text style, and tap handling.
class FlexiText extends StatelessWidget {
  /// The text to display.
  final String title;

  /// Map of screen width breakpoints to font sizes.
  /// Example: `{300: 12, 600: 16, 1200: 24}`.
  final Map<double, double>? sizes;

  /// Single fixed font size.
  /// If provided, [sizes] is ignored.
  final double? size;

  /// Optional text style.
  final TextStyle? style;

  /// Minimum font size (to avoid being too small).
  final double? minFontSize;

  /// Maximum font size (to avoid being too large).
  final double? maxFontSize;

  /// Optional semantics label for accessibility.
  final String? semanticsLabel;

  /// Optional text alignment.
  final TextAlign? textAlign;

  /// Maximum number of lines.
  final int? maxLines;

  /// Overflow handling when the text is too long.
  final TextOverflow? overflow;

  /// Optional alignment wrapper.
  final Alignment? alignment;

  /// Optional tap handler.
  final VoidCallback? onTap;

  /// Creates a [FlexiText] widget.
  const FlexiText({
    super.key,
    required this.title,
    this.sizes,
    this.size,
    this.style,
    this.minFontSize,
    this.maxFontSize,
    this.semanticsLabel,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.alignment,
    this.onTap,
  });

  /// Internal: calculates the font size based on [size] or [sizes].
  double _getFontSize(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;

    // Use fixed size if provided
    if (size != null) return size! * textScale;

    // Default to 14 if no sizes
    if (sizes == null || sizes!.isEmpty) return 14 * textScale;

    final width = MediaQuery.of(context).size.width;
    final sortedSizes = sizes!.entries.toList()
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

    // Linear interpolation
    double fontSize = (upperWidth == lowerWidth)
        ? lowerSize
        : lowerSize +
            (upperSize - lowerSize) * (width - lowerWidth) / (upperWidth - lowerWidth);

    // Clamp min/max
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

    final aligned = alignment != null
        ? Align(alignment: alignment!, child: textWidget)
        : textWidget;

    return onTap != null
        ? GestureDetector(onTap: onTap, child: aligned)
        : aligned;
  }
}
