library ecommerce_package;

import 'package:flutter/material.dart';

import 'src/views/product_list_view.dart';

class EcommercePackage extends StatelessWidget {
  const EcommercePackage({required this.theme, super.key});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return ProductListView(theme: theme);
  }
}
