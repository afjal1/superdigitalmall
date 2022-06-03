import 'package:flutter/material.dart';
import 'package:superdigitalmall/ApiHelper/model.dart';

class ProductSc extends StatelessWidget {
  final Products product;
  const ProductSc({Key? key, required this.product}) : super(key: key);

  Widget _buildProductDetailsDisplay(Products productss, BuildContext context) {
    const spacer = SizedBox(
      height: 15,
    );
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          spacer,
          Text(productss.title!,
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, height: 1.5)),
          spacer,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('₹ ${productss.price}',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          spacer,
          RichText(
            text: const TextSpan(text: 'Free Delivery', children: [
              TextSpan(
                  text: ' Friday',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ))
            ]),
          ),
          const SizedBox(height: 5),
          Text('Delivery to Afjal - New Delhi 110080',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor)),
          spacer,
          const Text(
            'Details :',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          spacer,
          Text(
            productss.description!,
            textAlign: TextAlign.justify,
            style: const TextStyle(
                fontWeight: FontWeight.w500, fontSize: 16, height: 1.5),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        actions: [
          const Icon(
            Icons.search,
            size: 35,
          ),
          const SizedBox(
            width: 10,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              const Icon(
                Icons.shopping_cart,
                size: 35,
              ),
              Positioned(
                right: -2,
                top: 0,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "1",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        backgroundColor: Colors.white,
        title: const Text(
          'Product Details',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Hero(
              tag: 'product_image_${product.id}',
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        image: NetworkImage(product.image!),
                        fit: BoxFit.contain)),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            _buildProductDetailsDisplay(product, context),
          ],
        ),
      ),
    );
  }
}
