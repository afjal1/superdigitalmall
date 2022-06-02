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

class ProductCard extends StatefulWidget {
  final List<Product> product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: 0.8,
        physics: const BouncingScrollPhysics(),
        mainAxisSpacing: 15,
        crossAxisSpacing: 10,
        children: List.generate(
          widget.product.length,
          (index) {
            return Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.4,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => ProductSc(product: widget.product[index]));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Hero(
                              tag: 'product_image_${widget.product[index].id}',
                              child: Image.network(
                                widget.product[index].image,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 5,
                            top: 5,
                            child: InkWell(
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Icon(
                                  !storeController.likedProducts
                                          .contains(widget.product[index].id)
                                      ? Icons.favorite_border
                                      : Icons.favorite,
                                  size: 15,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  storeController.addToLiked(
                                      id: widget.product[index].id);
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      widget.product[index].title,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Row(
                      children: [
                        Text(
                          "₹" + widget.product[index].price.toString(),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Get.snackbar(
                                "Added to cart", "Product added to cart",
                                backgroundColor: Theme.of(context).primaryColor,
                                colorText: Colors.white,
                                snackPosition: SnackPosition.BOTTOM,
                                icon: const Icon(
                                  Icons.shopping_bag,
                                  color: Colors.white,
                                ),
                                duration: const Duration(seconds: 1),
                                margin: const EdgeInsets.all(16),
                                padding: const EdgeInsets.all(12));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 5, right: 5),
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.3),
                                borderRadius: BorderRadius.circular(6)),
                            child: Icon(
                              Icons.add,
                              size: 12,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ));
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
