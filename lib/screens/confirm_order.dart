import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superdigitalmall/screens/home_page.dart';

class OrderSuccess extends StatefulWidget {
  const OrderSuccess({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StateSuccess();
  }
}

class StateSuccess extends State<OrderSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Placed'),
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Thank you for shopping',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            const Text(
              'Your order has been placed successfully!',
              style: TextStyle(color: Colors.black),
            ),
            Container(
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.symmetric(vertical: 40),
              child: Image.network(
                  "https://cdn.dribbble.com/users/571236/screenshots/2888472/media/e332ab00c49fd90058411e119c1d3f8b.gif"),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
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
                  child: Text("Continue Shopping",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
              onPressed: () {
                Get.to(() => const HomePage());
              },
            ),
          ],
        )),
      ),
    );
  }
}
