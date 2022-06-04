import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superdigitalmall/screens/home_page.dart';

class IntroSliderScreen extends StatefulWidget {
  @override
  IntroSliderScreenState createState() => IntroSliderScreenState();
}

class IntroSliderScreenState extends State<IntroSliderScreen> {
  final _controller = PageController();
  double? toppading;
  int currentpage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    toppading = kToolbarHeight;

    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            PageView(
              controller: _controller,
              children: <Widget>[
                pageData(
                    "assets/1.png",
                    "We can Send Everywhere! Time or Distance can't stop us.",
                    "Your favourite Product delivered fast at your door.",
                    0),
                pageData(
                    "assets/2.png",
                    "We can Send Everywhere! Time or Distance can't stop us.",
                    "Your favourite Product delivered fast at your door.",
                    1),
                pageData(
                    "assets/3.png",
                    "We can Send Everywhere! Time or Distance can't stop us.",
                    "Your favourite Product delivered fast at your door.",
                    2),
              ],
              onPageChanged: (int pageno) {
                setState(() {
                  currentpage = pageno;
                });
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.only(bottom: 30.0, left: 30, right: 30),
                child: GestureDetector(
                  onTap: () {
                    if (currentpage == 2) {
                      Get.off(() => const HomePage());
                    } else {
                      _controller.jumpToPage(currentpage + 1);
                    }
                  },
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 30,
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget pageData(String image, String title, String desc, int pageindex) {
    var width = MediaQuery.of(context).size.width;
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            image,
            width: width / 1.3,
          ),
          const SizedBox(height: 5),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  3,
                  (index) => pageindex == index
                      ? Container(
                          width: 20,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        )
                      : Material(
                          color: Colors.black.withOpacity(0.5),
                          type: MaterialType.circle,
                          child: Container(
                            width: 7,
                            height: 7,
                            margin: const EdgeInsets.only(left: 3, right: 3),
                          ),
                        ))),
          const SizedBox(height: 20),
          title.trim().isEmpty
              ? Container()
              : Text(title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5!.merge(
                      const TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontFamily: 'appfont'))),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 40, end: 40, top: 10, bottom: 20),
            child: Text(
              desc,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1!.merge(
                  const TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'appfont')),
            ),
          ),
        ]);
  }
}
