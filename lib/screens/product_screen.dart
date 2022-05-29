import 'package:flutter/material.dart';

import '../widgets/product_card.dart';

class ProductSc extends StatelessWidget {
  final Product product;
  const ProductSc({Key? key, required this.product}) : super(key: key);

  Widget _buildProductDetailsDisplay(Product productss) {
    const spacer = SizedBox(
      height: 15,
    );
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('SKU: 311337'),
          spacer,
          Text(productss.title,
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, height: 1.5)),
          spacer,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // _buildVariantButtonsDisplay(),
              Text('\$ ${productss.price}',
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
          const Text('Delivery to Akram - Dallas 75204'),
          spacer,
          const Text(
            'Details',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          spacer,
          const Text(
            'Our Maddox collection mixes and matches finishes and features,'
            ' creating the perfect combination for your home. Steel shades in'
            ' a variety of shapes, sizes and modern hues pair matte exteriors '
            'and glossy white interiors that reflect light beautifully, accented'
            ' by decorative socket caps and ceiling plates in a range of finishes.'
            ' Strikingly simple with clean geometry, this large dome pendant light '
            'contrasts a softly rounded matte mustard yellow shade with its bright'
            ' inner surface. Hang the adjustable-height pendant over a kitchen island,'
            ' reading nook or dining table for a bold, graphic look and useful',
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontWeight: FontWeight.w300, fontSize: 13, height: 1.5),
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
                        image: NetworkImage(product.image),
                        fit: BoxFit.contain)),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            _buildProductDetailsDisplay(product),
          ],
        ),
      ),
    );
  }
}
