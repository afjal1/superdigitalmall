import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Controllers/store_controller.dart';
import 'confirm_order.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final StoreController store = Get.put(StoreController());

  int? value, paymentValue;

  List addressList = [
    {
      "id": "1",
      "name": "Afjal",
      "type": "Home",
      "mobile": "0000000",
      "address": "G Block",
      "landmark": "",
      "area_id": "138",
      "city_id": "10",
      "pincode": "110080",
      "state": "New Delhi",
      "country": "India",
      "is_default": "0",
      "area": "New Delhi",
      "city": "Delhi"
    },
    {
      "id": "2",
      "name": "Afjal",
      "type": "Office",
      "mobile": "123455678",
      "address": "A Block",
      "landmark": "",
      "area_id": "136",
      "city_id": "22",
      "pincode": "110062",
      "state": "Delhi",
      "country": "India",
      "is_default": "1",
      "area": "New Delhi",
      "city": "Delhi"
    }
  ];

  List<String> paymentMethodList = [
    'Cash on delivery',
    'Flutterwave',
    'Midtrans',
    'Paypal',
    'Stripe',
    'Paytm',
  ];
  List<String> paymentIcons = [
    'https://cdn1.iconfinder.com/data/icons/marketplace-and-shipping/64/COD_cash_on_delivery_shipping_payment_delivery-512.png',
    'https://tukuz.com/wp-content/uploads/2020/10/flutterwave-logo-vector.png',
    'https://docs.midtrans.com/asset/image/main/midtrans-logo.png',
    'https://www.citypng.com/public/uploads/preview/transparent-hd-paypal-logo-21635273203amlzc6jbjx.png',
    'https://www.pngitem.com/pimgs/m/291-2918799_stripe-payment-icon-png-transparent-png.png',
    'https://pngset.com/images/paytm-logo-symbol-trademark-text-transparent-png-2153815.png',
  ];

  List<String> dateList = [];
  String curDate = "Categories", curTime = "9:00 am-2:00pm";
  List<String> timeList = ["9:00 am-2:00pm", "4:00 pm-8:00pm"];
  String startingDate = "2021-03-13";
  int allowDay = 7;
  @override
  void initState() {
    super.initState();
    setState(() {
      DateTime today = DateTime.parse(startingDate);
      for (int i = 0; i < allowDay; i++) {
        dateList.add(
            DateFormat('EEE, dd MMM').format(today.add(Duration(days: i))));
      }
      curDate = dateList[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [_addressModule(), _timeModule(), _paymentModule()],
                ),
              ),
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
                child: Text("PLACE ORDER",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ),
            ),
            onPressed: () {
              Get.to(() => const OrderSuccess());
            },
          ),
        ],
      ),
    );
  }

  Widget addressItem(int i) {
    return Card(
      elevation: 0.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
        child: RadioListTile(
            value: i,
            dense: true,
            groupValue: value,
            onChanged: (int? ind) => setState(() => value = ind),
            title: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        addressList[i]["type"],
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(addressList[i]["address"] +
                          ", " +
                          addressList[i]["area"] +
                          ", " +
                          addressList[i]["city"] +
                          ", " +
                          addressList[i]["state"] +
                          ", " +
                          addressList[i]["country"] +
                          ", " +
                          addressList[i]["pincode"]),
                      Text("Mob: " + addressList[i]["mobile"])
                    ],
                  ),
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.edit_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 15,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            )),
      ),
    );
  }

  _addressModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Shipping to',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: addressList.length,
            itemBuilder: (context, index) {
              return addressItem(index);
            }),
        Align(
          alignment: Alignment.bottomRight,
          child: InkWell(
            child: Text(
              'Add New Address',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            onTap: () {},
          ),
        ),
        const Divider(),
      ],
    );
  }

  _timeModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 20),
            child: Text(
              'Peferred Delivery Time :',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(5.0),
                margin: const EdgeInsets.only(right: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.0, color: Colors.black.withOpacity(0.5)),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0) //
                      ),
                ),
                child: Center(
                  child: DropdownButtonFormField<String>(
                    isDense: true,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Theme.of(context).primaryColor,
                    ),
                    decoration: const InputDecoration(
                        labelText: 'Date:',
                        labelStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                        contentPadding: EdgeInsets.all(0),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                    dropdownColor:
                        Theme.of(context).secondaryHeaderColor.withOpacity(0.9),
                    isExpanded: false,
                    value: curDate,
                    onChanged: (newValue) {
                      setState(() {
                        curDate = newValue!;
                      });
                    },
                    items: dateList.map((String st) {
                      return DropdownMenuItem<String>(
                        value: st,
                        child: Text(
                          st,
                          style: const TextStyle(fontSize: 14),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(5.0),
                margin: const EdgeInsets.only(right: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.0, color: Colors.black.withOpacity(0.5)),
                  borderRadius: const BorderRadius.all(Radius.circular(
                          10.0) //                 <--- border radius here
                      ),
                ),
                child: Center(
                  child: DropdownButtonFormField<String>(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Theme.of(context).primaryColor,
                    ),
                    decoration: const InputDecoration(
                        labelText: 'Time:',
                        labelStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                        contentPadding: EdgeInsets.all(0),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                    dropdownColor:
                        Theme.of(context).secondaryHeaderColor.withOpacity(0.9),
                    isExpanded: false,
                    isDense: true,
                    value: curTime,
                    onChanged: (newValue) {
                      setState(() {
                        curTime = newValue!;
                      });
                    },
                    items: timeList.map((String st) {
                      return DropdownMenuItem<String>(
                        value: st,
                        child: Text(
                          st,
                          style: const TextStyle(fontSize: 14),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }

  _paymentModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Payment Method',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: paymentMethodList.length,
            itemBuilder: (context, index) {
              return paymentItem(index);
            }),
        const Divider(),
        Row(
          children: [
            Text("Total ${store.cartCount} items in cart",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const Spacer(),
            Text('₹ ${store.cartTotal}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        )
      ],
    );
  }

  Widget paymentItem(int i) {
    return Card(
      elevation: 0.1,
      child: RadioListTile(
          value: i,
          dense: true,
          groupValue: paymentValue,
          onChanged: (int? ind) => setState(() => paymentValue = ind),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  paymentMethodList[i],
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.0, color: Colors.black.withOpacity(0.5)),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0) //
                      ),
                ),
                height: 40,
                width: 40,
                child: Image.network(
                  paymentIcons[i],
                  height: 30,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          )),
    );
  }
}
