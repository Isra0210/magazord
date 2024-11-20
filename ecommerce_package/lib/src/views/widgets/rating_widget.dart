import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  const StarRating({required this.theme, required this.rating, super.key});

  final double rating;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) {
          final fullStars = rating.floor();
          final isFull = index < fullStars;
          final isPartial = index == fullStars;

          return Stack(
            children: [
              Icon(Icons.star, size: 24, color: theme.colorScheme.surface),
              if (isFull || isPartial)
                ClipRect(
                  clipper: _StarClipper(
                    percent: isFull ? 1 : (rating - fullStars),
                  ),
                  child: const Icon(Icons.star, size: 24, color: Colors.amber),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _StarClipper extends CustomClipper<Rect> {
  final double percent;

  _StarClipper({required this.percent});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, size.width * percent, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}
