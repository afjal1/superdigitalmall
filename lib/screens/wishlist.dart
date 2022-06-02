import 'package:flutter/material.dart';
import 'package:superdigitalmall/widgets/product_card.dart';

class Wishlist extends StatefulWidget {
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return ProductCard(
      product: storeController.wproducts,
    );
  }
}
