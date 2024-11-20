import 'package:flutter/material.dart';

class TextWithHighlightWidget extends StatelessWidget {
  const TextWithHighlightWidget({
    super.key,
    required this.highlight,
    required this.label,
    required this.theme,
    this.showDivider = false,
  });

  final String highlight;
  final String label;
  final ThemeData theme;
  final bool showDivider;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(highlight, style: theme.textTheme.bodyMedium),
        if (showDivider)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text('-'),
          ),
        Text(label, style: theme.textTheme.bodyLarge),
      ],
    );
  }
}
