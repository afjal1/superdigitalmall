import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superdigitalmall/widgets/product_card.dart';

import '../Controllers/store_controller.dart';
import 'cart.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

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
          ? cartEmpty(context, 'Your Wishlist is empty',
              "Looking like you haven't added anything to your wishlist yet")
          : ProductCard(
              product: storeController.products
                  .where((product) =>
                      storeController.favProducts.contains(product.id))
                  .toList(),
            );
    });
  }
}
