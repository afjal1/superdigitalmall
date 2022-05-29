import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('s Cart'),
        ),
        // Consumer + a ChangeNotifier (cart) will ensure that
        // That this portion of the tree rebuilds when Cart.notifyListeners() is called.
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: const Text("item.name ?? ''"),
                    subtitle: const Text('cost:  free'),
                    trailing: const Text('tap to remove from cart'),
                    onTap: () {
                      // context.read is the easiest way to call
                      // methods on a provided model
                    },
                  );
                },
              ),
            ),
            const Divider(),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                // remember, context.select allows you to
                // listen to specific properties, and ignore the rest of a class
                'TOTAL: 200',
                style: Theme.of(context).textTheme.headline3,
              ),
            )
          ],
        ));
  }
}
