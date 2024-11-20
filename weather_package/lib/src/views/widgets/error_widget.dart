import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextErrorWidget extends StatefulWidget {
  const TextErrorWidget({required this.error, required this.theme, super.key});

  final String error;
  final ThemeData theme;

  @override
  State<TextErrorWidget> createState() => _TextErrorWidgetState();
}

class _TextErrorWidgetState extends State<TextErrorWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            decoration: BoxDecoration(
              color: widget.theme.colorScheme.error,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8),
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(
                    CupertinoIcons.xmark_circle_fill,
                    color: widget.theme.colorScheme.surface,
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.error,
                    style: widget.theme.textTheme.bodyMedium!.copyWith(
                      color: widget.theme.colorScheme.surface,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
