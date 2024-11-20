import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_package/src/controller/product_controller.dart';
import 'package:ecommerce_package/src/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

import 'widgets/rating_widget.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({
    required this.product,
    required this.theme,
    super.key,
  });

  final ProductModel product;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final loading = Center(
      child: CircularProgressIndicator(color: theme.colorScheme.surface),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes')),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () async {
          final message =
              'Confira este produto: ${product.name}.\n\nPreço: ${product.price.toStringAsFixed(2)}.\n\nimage: ${product.images[0]}';
          Get.dialog(loading);
          await Share.share(message);
          Get.back();
        },
        backgroundColor: theme.colorScheme.outline,
        child: Icon(
          Icons.share,
          color: theme.scaffoldBackgroundColor,
        ),
      ),
      body: Hero(
        tag: 'product-detail-${product.name}',
        child: GetBuilder<ProductController>(
          init: ProductController(),
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => controller.previous(product.images),
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                      Expanded(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          transitionBuilder: (child, animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          child: Container(
                            key: ValueKey(controller.currentIndex),
                            child: Container(
                              alignment: Alignment.center,
                              height: 250,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl:
                                    product.images[controller.currentIndex],
                                placeholder: (_, __) => Shimmer.fromColors(
                                  baseColor: theme.colorScheme.surface,
                                  highlightColor: theme.scaffoldBackgroundColor,
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    color: theme.colorScheme.surface
                                        .withOpacity(0.8),
                                  ),
                                ),
                                errorWidget: (context, url, _) => const Icon(
                                  Icons.error,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => controller.next(product.images),
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  product.name,
                                  style: theme.textTheme.titleSmall,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 6,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'R\$ ${product.price.toStringAsFixed(2)}',
                            style: theme.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                '${product.rating}',
                                style: theme.textTheme.bodyMedium,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: StarRating(
                                  rating: product.rating,
                                  theme: theme,
                                ),
                              ),
                              Text(
                                '(${product.salesCount})',
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
