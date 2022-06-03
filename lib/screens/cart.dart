import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superdigitalmall/ApiHelper/model.dart';
import 'package:superdigitalmall/Controllers/store_controller.dart';

import 'checkout.dart';

final StoreController store = Get.put(StoreController());

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  double disPrice = 10, oriPrice = 1000, delCharge = 100;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreController>(
        init: StoreController(),
        builder: (store) {
          List<Products> products = store.products
              .where((element) => store.cartProducts.contains(element.id))
              .toList();

          return Scaffold(
              body: products.isEmpty
                  ? cartEmpty(context, 'Your Cart is Empty',
                      "Looking like you haven't added anything to your cart yet")
                  : Column(
                      children: <Widget>[
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            itemCount: products.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return listItem(index, products[index]);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 5.0, left: 20, right: 20),
                          child: Row(
                            children: <Widget>[
                              const Text(
                                'Total Price',
                              ),
                              const Spacer(),
                              Text("₹" "${store.cartTotal}"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 5),
                          child: Row(
                            children: <Widget>[
                              const Text(
                                "Delivery Charge",
                              ),
                              const Spacer(),
                              Text("₹" " $delCharge")
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 5),
                          child: Row(
                            children: <Widget>[
                              const Text(
                                "Discount",
                              ),
                              const Spacer(),
                              Text('₹' " $disPrice")
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, left: 20, right: 20),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Grand Total',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Text(
                                '₹' " ${store.cartTotal + 100 - 10}",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            height: 48,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Text("CHECKOUT",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                          onPressed: () {
                            Get.to(() => const Checkout());
                          },
                        ),
                      ],
                    ));
        });
  }

  Widget listItem(int index, Products product) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        setState(() {
          store.cartProducts.remove(product.id!);
          store.getCartCount();
        });
      },
      key: UniqueKey(),
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey,
        ),
        alignment: AlignmentDirectional.centerEnd,
        child: const Padding(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      child: Card(
        elevation: 0.1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Image.network(
                product.image!,
                height: 80,
                width: 80,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        product.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  margin: const EdgeInsetsDirectional.only(
                                      end: 8, top: 8, bottom: 8),
                                  child: Icon(
                                    Icons.remove,
                                    size: 14,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.2),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5))),
                                ),
                                onTap: () {
                                  if (product.qty != 1) {
                                    product.qty = product.qty! - 1;
                                  } else {
                                    store.cartProducts.remove(product.id!);
                                  }
                                  setState(() {});
                                },
                              ),
                              Text(product.qty.toString() == 'null'
                                  ? 1.toString()
                                  : product.qty.toString()),
                              GestureDetector(
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  margin: const EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.add,
                                    size: 14,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.2),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5))),
                                ),
                                onTap: () {
                                  product.qty = product.qty! + 1;
                                  setState(() {});
                                },
                              )
                            ],
                          ),
                          const Spacer(),
                          Text(
                            '₹ ${product.price! * double.parse(product.qty!.toString())}',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

noCartText(BuildContext context, String val) {
  return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Text(val,
          style: Theme.of(context).textTheme.headline5!.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.normal)));
}

noCartDec(BuildContext context, String val) {
  return Container(
    padding: const EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
    child: Text(val,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
            )),
  );
}

shopNow(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 28.0),
    child: CupertinoButton(
      child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: 45,
          alignment: FractionalOffset.center,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text('Shop Now',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.normal))),
      onPressed: () {},
    ),
  );
}

cartEmpty(BuildContext context, String val, String val2) {
  return Center(
    child: SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        noCartText(context, val),
        noCartDec(context, val2),
        shopNow(context)
      ]),
    ),
  );
}
