import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_package/src/controller/product_controller.dart';
import 'package:ecommerce_package/src/views/product_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({required this.theme, super.key});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ecommerce')),
      body: GetBuilder(
        init: ProductController(),
        builder: (controller) {
          return GridView.builder(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 90),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 4 / 6,
            ),
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              final product = controller.products[index];
              return InkWell(
                onTap: () {
                  Get.to(
                    () => ProductDetailView(product: product, theme: theme),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 800),
                    fullscreenDialog: true,
                  );
                },
                child: Hero(
                  tag: 'product-detail-${product.name}',
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0.1,
                          spreadRadius: 0.1,
                          offset: const Offset(1, 1),
                          color: theme.brightness == Brightness.light
                              ? Colors.black12
                              : Colors.white12,
                        )
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    // alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: CachedNetworkImage(
                              width: 200,
                              fit: BoxFit.cover,
                              imageUrl: product.images.first,
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      product.name,
                                      style: theme.textTheme.bodyMedium,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'R\$ ${product.price.toStringAsFixed(2)}',
                                style: theme.textTheme.labelLarge,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
