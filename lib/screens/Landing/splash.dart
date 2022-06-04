import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'intro_slider.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    Timer(const Duration(seconds: 2), () {
      Get.off(() => IntroSliderScreen());
    });
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Image.network(
            "https://i.pinimg.com/originals/e9/81/9d/e9819d0c7e4243366798c52e67e2b861.png",
            width: MediaQuery.of(context).size.width / 2,
          )),
    );
  }
}
