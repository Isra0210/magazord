import 'package:flutter/foundation.dart';

const kName = 'name';
const kPrice = 'price';
const kThumbnail = 'thumbnail';
const kImages = 'images';
const kRating = 'rating';
const kSalesCount = 'salesCount';

class ProductModel {
  ProductModel({
    required this.name,
    required this.price,
    required this.images,
    required this.rating,
    required this.salesCount,
  });

  final String name;
  final double price;
  final List<String> images;
  final double rating;
  final int salesCount;

  ProductModel copyWith({
    String? name,
    double? price,
    List<String>? images,
    double? rating,
    int? salesCount,
  }) {
    return ProductModel(
      name: name ?? this.name,
      price: price ?? this.price,
      images: images ?? this.images,
      rating: rating ?? this.rating,
      salesCount: salesCount ?? this.salesCount,
    );
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map[kName],
      price: map[kPrice],
      images: List<String>.from((map[kImages])),
      rating: map[kRating],
      salesCount: map[kSalesCount],
    );
  }

  @override
  String toString() {
    return 'ProductModel(name: $name, price: $price, images: $images, rating: $rating, salesCount: $salesCount)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.price == price &&
        listEquals(other.images, images) &&
        other.rating == rating &&
        other.salesCount == salesCount;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        price.hashCode ^
        images.hashCode ^
        rating.hashCode ^
        salesCount.hashCode;
  }
}
