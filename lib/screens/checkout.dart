import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int? value, paymentValue;

  List addressList = [
    {
      "id": "233",
      "name": "Test",
      "type": "Home",
      "mobile": "123456789",
      "address": "Last",
      "landmark": "",
      "area_id": "138",
      "city_id": "44",
      "pincode": "12345",
      "state": "Gujarat",
      "country": "India",
      "latitude": "23.218674",
      "longitude": "69.7754183",
      "is_default": "0",
      "area": "KadNagar",
      "city": "Nashik"
    },
    {
      "id": "166",
      "name": "Ghhh",
      "type": "Home",
      "mobile": "88889855666",
      "address": "Dff",
      "landmark": "",
      "area_id": "136",
      "city_id": "40",
      "pincode": "370105",
      "state": "Gujarat",
      "country": "India",
      "latitude": "23.2178058",
      "longitude": "69.7769075",
      "is_default": "0",
      "area": "Redma",
      "city": "Dal"
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
                      color: Colors.white,
                    )),
              ),
            ),
            onPressed: () {},
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
                      color: Theme.of(context).secondaryHeaderColor,
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
        const Text('Shipping to'),
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
              style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
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
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Peferred Delivery Time')),
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
                        labelText: 'Date',
                        contentPadding: EdgeInsets.all(0),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                    dropdownColor:
                        Theme.of(context).primaryColor.withOpacity(0.9),
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
                        labelText: 'Time',
                        contentPadding: EdgeInsets.all(0),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                    dropdownColor:
                        Theme.of(context).primaryColor.withOpacity(0.9),
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
            child: Text('Payment Method')),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: paymentMethodList.length,
            itemBuilder: (context, index) {
              return paymentItem(index);
            }),
        const Divider(),
        Row(
          children: const [
            Text("Total 4 items in cart"),
            Spacer(),
            Text('\$400.00')
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
              // Image.network(paymentIconList[i]),
            ],
          )),
    );
  }
}