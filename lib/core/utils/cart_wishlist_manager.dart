import 'package:flutter/material.dart';

class ProductItem {
  final String title;
  final String imagePath;
  final double price;
  final double? originalPrice;
  final String? discount;
  int quantity;

  ProductItem({
    required this.title,
    required this.imagePath,
    required this.price,
    this.originalPrice,
    this.discount,
    this.quantity = 1,
  });
}

class CartWishlistManager {
  static final ValueNotifier<List<ProductItem>> wishlistNotifier =
      ValueNotifier<List<ProductItem>>([]);

  static final ValueNotifier<List<ProductItem>> cartNotifier =
      ValueNotifier<List<ProductItem>>([]);

  static bool isWishlisted(String title) {
    return wishlistNotifier.value.any((item) => item.title == title);
  }

  static void toggleWishlist(ProductItem item) {
    final list = List<ProductItem>.from(wishlistNotifier.value);
    final index = list.indexWhere((i) => i.title == item.title);
    if (index >= 0) {
      list.removeAt(index);
    } else {
      list.add(item);
    }
    wishlistNotifier.value = list;
  }

  static void addToCart(ProductItem item) {
    final list = List<ProductItem>.from(cartNotifier.value);
    final index = list.indexWhere((i) => i.title == item.title);
    if (index >= 0) {
      list[index].quantity += 1;
    } else {
      list.add(ProductItem(
        title: item.title,
        imagePath: item.imagePath,
        price: item.price,
        originalPrice: item.originalPrice,
        discount: item.discount,
        quantity: 1,
      ));
    }
    cartNotifier.value = list;
  }

  static void removeFromCart(String title) {
    final list = List<ProductItem>.from(cartNotifier.value);
    list.removeWhere((i) => i.title == title);
    cartNotifier.value = list;
  }

  static void updateQuantity(String title, int quantity) {
    final list = List<ProductItem>.from(cartNotifier.value);
    final index = list.indexWhere((i) => i.title == title);
    if (index >= 0) {
      if (quantity <= 0) {
        list.removeAt(index);
      } else {
        list[index].quantity = quantity;
      }
      cartNotifier.value = list;
    }
  }

  static double get cartTotal {
    return cartNotifier.value
        .fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}
