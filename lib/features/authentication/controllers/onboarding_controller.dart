
import 'package:computer_store/features/authentication/screens/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // variables

  // update current index when page scroll
  void updatePageIndicator(index) => currentPageIndex = index;

  void dotNavigationClick(index) {}

  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page); 
    }
  }

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }

}