import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/store_controller.dart';
import '../screens/product_screen.dart';

final StoreController storeController = Get.put(StoreController());

class Product {
  final int id;
  final String title;
  final double price;
  final String image;

  const Product(
      {required this.id,
      required this.image,
      required this.price,
      required this.title});
}

class ProductBlock extends StatelessWidget {
  final Product product;

  const ProductBlock({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreController>(
        init: StoreController(),
        builder: (storeController) {
          return InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   PageRouteBuilder(
              //     pageBuilder: (c, a1, a2) => ProductSc(
              //       product: product,
              //     ),
              //     transitionsBuilder: (c, anim, a2, child) =>
              //         FadeTransition(opacity: anim, child: child),
              //     transitionDuration: const Duration(milliseconds: 20),
              //   ),
              // );

              Navigator.of(context).push(SecondPageRoute(product));
              // Get.to(() => ProductSc(
              //       product: product,
              //     ));
            },
            child: Card(
              color: Colors.white,
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'product_image_${product.id}',
                      child: Container(
                          height: 250,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                )
                              ],
                              image: DecorationImage(
                                  image: NetworkImage(product.image),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(25))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                            ),
                            Text(
                              "₹${product.price.toString()}",
                            ),
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            storeController.addToLiked(id: product.id);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                                !storeController.likedProducts
                                        .contains(product.id)
                                    ? Icons.favorite_border
                                    : Icons.favorite,
                                color: Colors.red),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class SecondPageRoute extends CupertinoPageRoute {
  final Product product;
  SecondPageRoute(this.product)
      : super(
          builder: (BuildContext context) => ProductSc(
            product: product,
          ),
        );

  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: ProductSc(
        product: product,
      ),
    );
  }
}
