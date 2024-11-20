import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({required this.theme, super.key});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const spacing = SizedBox(height: 16);

    Widget widgetWithShimmer({required Widget child}) {
      return Shimmer.fromColors(
        baseColor: theme.scaffoldBackgroundColor,
        highlightColor: theme.colorScheme.surface,
        child: child,
      );
    }

    final baseShimmerWidget = Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      height: 12,
      width: size.width * 0.86,
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            height: 220,
            width: size.width * 0.9,
            child: widgetWithShimmer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    height: 16,
                    width: size.width * 0.6,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: theme.scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    height: 80,
                    width: size.width * 0.8,
                  ),
                  baseShimmerWidget,
                  spacing,
                  baseShimmerWidget,
                  spacing,
                  baseShimmerWidget,
                ],
              ),
            ),
          ),
          spacing,
          Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            height: 160,
            width: size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widgetWithShimmer(
                  child: Container(
                    height: 16,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: theme.scaffoldBackgroundColor,
                    ),
                    margin: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 8,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      6,
                      (_) => widgetWithShimmer(
                        child: Container(
                          height: 100,
                          width: 70,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: theme.colorScheme.surface,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          spacing,
          Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            width: size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widgetWithShimmer(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      color: theme.scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    height: 20,
                    width: size.width * 0.6,
                  ),
                ),
                ...List.generate(
                  4,
                  (_) => Column(
                    children: [
                      widgetWithShimmer(
                        child: Container(
                          height: 36,
                          width: size.width * 0.8,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: theme.colorScheme.surface,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(
                          color: theme.scaffoldBackgroundColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
