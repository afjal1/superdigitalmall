import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superdigitalmall/widgets/product_card.dart';

import '../Controllers/store_controller.dart';

class Wishlist extends StatefulWidget {
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreController>(builder: (storeController) {
      return storeController.products
              .where(
                  (product) => storeController.favProducts.contains(product.id))
              .toList()
              .isEmpty
          ? const Center(
              child: Text(
              'No products in wishlist',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ))
          : ProductCard(
              product: storeController.products
                  .where((product) =>
                      storeController.favProducts.contains(product.id))
                  .toList(),
            );
    });
  }
}
