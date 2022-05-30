import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String user = 'Afjal', email = 'abc@gmail.com';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _getHeader(),
            const Divider(),
            _myOrder(
              'My Orders',
              Icons.card_giftcard_outlined,
            ),
            _myOrder(
              'Profile Edit',
              Icons.person_outline,
            ),
            _myOrder(
              'My Address',
              Icons.location_on_outlined,
            ),
            _myOrder(
              'Settings',
              Icons.settings,
            ),
            _myOrder(
              'Change Password',
              Icons.password_outlined,
            ),
            _myOrder(
              'Coupons',
              Icons.card_giftcard,
            ),
            _myOrder(
              'Logout',
              Icons.exit_to_app,
            ),
          ],
        ),
      ),
    ));
  }

  Widget _getHeader() {
    return Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 10.0, top: 10),
        child: Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                    padding: const EdgeInsetsDirectional.only(start: 10),
                    child: Container(
                      margin: const EdgeInsetsDirectional.only(bottom: 17),
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1.0, color: Colors.white)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: Image.network(
                              'https://i.pinimg.com/736x/25/78/61/25786134576ce0344893b33a051160b1.jpg')),
                    )),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, $user',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    email != null
                        ? Text(
                            email,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Colors.black),
                          )
                        : Container(),
                  ],
                ),
              ],
            ),
          ],
        ));
  }

  _myOrder(String text, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)),
      child: ListTile(
        dense: true,
        title: Text(
          text,
          style: const TextStyle(fontSize: 15),
        ),
        leading: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              icon,
              color: Theme.of(context).primaryColor,
            )),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Theme.of(context).primaryColor,
        ),
        onTap: () {},
      ),
    );
  }

  _profile() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)),
      child: ListTile(
        dense: true,
        title: const Text(
          'Profile Edit',
          style: TextStyle(fontSize: 15),
        ),
        leading: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              Icons.person_outline,
              color: Theme.of(context).primaryColor,
            )),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Theme.of(context).primaryColor,
        ),
        onTap: () {},
      ),
    );
  }

  _changePwd() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)),
      child: ListTile(
        dense: true,
        title: const Text(
          'Change Password',
          style: TextStyle(fontSize: 15),
        ),
        leading: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              Icons.lock_outline,
              color: Theme.of(context).primaryColor,
            )),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Theme.of(context).primaryColor,
        ),
        onTap: () {},
      ),
    );
  }

  _setting() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)),
      child: ListTile(
        dense: true,
        title: const Text(
          'Setting',
          style: TextStyle(fontSize: 15),
        ),
        leading: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              Icons.settings_outlined,
              color: Theme.of(context).primaryColor,
            )),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Theme.of(context).primaryColor,
        ),
        onTap: () {},
      ),
    );
  }

  _coupens() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)),
      child: ListTile(
        dense: true,
        title: const Text(
          'Coupons',
          style: TextStyle(fontSize: 15),
        ),
        leading: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              Icons.payment_outlined,
              color: Theme.of(context).primaryColor,
            )),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Theme.of(context).primaryColor,
        ),
        onTap: () {},
      ),
    );
  }

  _logout() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)),
      child: ListTile(
        dense: true,
        title: const Text(
          'Logout',
          style: TextStyle(fontSize: 15),
        ),
        leading: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              Icons.logout,
              color: Theme.of(context).primaryColor,
            )),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Theme.of(context).primaryColor,
        ),
        onTap: () {},
      ),
    );
  }

  _manageAddress() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)),
      child: ListTile(
        dense: true,
        title: const Text(
          'Manage Address',
          style: TextStyle(fontSize: 15),
        ),
        leading: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              Icons.location_on_outlined,
              color: Theme.of(context).primaryColor,
            )),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Theme.of(context).primaryColor,
        ),
        onTap: () {},
      ),
    );
  }
}
