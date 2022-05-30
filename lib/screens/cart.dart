import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  double disPrice = 10, oriPrice = 1000, delCharge = 100, totalPrice = 890;
  List cartList = [
    {
      'img':
          "https://burst.shopifycdn.com/photos/green-t-shirt.jpg?width=746&format=pjpg&exif=1&iptc=1",
      'name': "Green T-Shirt",
      'descprice': "45",
      'price': "50",
      'qty': '1',
      'cartCount': 1
    },
    {
      'img':
          "https://burst.shopifycdn.com/photos/wood-leather-watches.jpg?width=746&format=pjpg&exif=1&iptc=1",
      'name': "Rolex @40 Watch",
      'descprice': "250",
      'price': "500",
      'qty': '1',
      'cartCount': 1
    },
    {
      'img':
          "https://burst.shopifycdn.com/photos/purple-gemstone-necklace.jpg?width=746&format=pjpg&exif=1&iptc=1",
      'name': "Necklace",
      'descprice': "25",
      'price': "50",
      'qty': "1",
      'cartCount': 1
    },
    {
      'img':
          "https://burst.shopifycdn.com/photos/stacked-bracelets-set.jpg?width=746&format=pjpg&exif=1&iptc=1",
      'name': "Bracelet",
      'descprice': "1000",
      'price': "1200",
      'qty': '1',
      'cartCount': 1
    },
    {
      'img':
          "https://burst.shopifycdn.com/photos/black-white-wrist-watches.jpg?width=746&format=pjpg&exif=1&iptc=1",
      'name': "Black Official Watch",
      'descprice': "1300",
      'price': "1400",
      'qty': '1',
      'cartCount': 1
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: cartList.isEmpty
            ? cartEmpty()
            : Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: cartList.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return listItem(index);
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
                        Text("₹" "$oriPrice")
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
                    padding:
                        const EdgeInsets.only(top: 5.0, left: 20, right: 20),
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
                          '₹' " $totalPrice",
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
                    onPressed: () {},
                  ),
                ],
              ));
  }

  cartEmpty() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [noCartText(context), noCartDec(context), shopNow()]),
      ),
    );
  }

  Widget listItem(int index) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        setState(() {
          cartList.removeAt(index);
        });
      },
      key: Key(cartList[index]["name"]),
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
                cartList[index]["img"],
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
                        cartList[index]["name"],
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
                                  if (cartList[index]["cartCount"] != 1) {
                                    setState(() {
                                      cartList[index]["cartCount"] =
                                          cartList[index]["cartCount"] - 1;
                                    });
                                  }
                                },
                              ),
                              Text("${cartList[index]["cartCount"]}"),
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
                                  setState(() {
                                    cartList[index]["cartCount"] =
                                        cartList[index]["cartCount"] + 1;
                                  });
                                },
                              )
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                "₹" + cartList[index]["descprice"] + "  ",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        color: Theme.of(context).primaryColor),
                              ),
                              Text(
                                "₹" + cartList[index]["price"],
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                        color: Colors.black,
                                        decoration: TextDecoration.lineThrough),
                              )
                            ],
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

  noCartText(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 20),
        child: Text("Your Cart Is Empty",
            style: Theme.of(context).textTheme.headline5!.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.normal)));
  }

  noCartDec(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
      child: Text("Looking like you haven't added anything to your cart yet",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              )),
    );
  }

  shopNow() {
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
}
