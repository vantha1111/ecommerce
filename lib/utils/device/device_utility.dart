import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UDeviceUtils {
  static void setFullScreen (bool enable){
    SystemChrome.setEnabledSystemUIMode( enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  static double getBottonNavigationbarheight () {
    return kBottomNavigationBarHeight;
  }

  static double getAppBarHeight () {
    return kToolbarHeight;
  }

  static double getScreenHeight () {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double getScreenWidth ( BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getPixelRadio () {
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  static double getStateBarHeight () {
    return MediaQuery.of(Get.context!).padding.top;
  }

  static void launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

