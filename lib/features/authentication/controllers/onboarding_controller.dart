import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
 final pageController = PageController();
 Rx<int> currentPageIndex = 0.obs;

/// Update Current Index when page Scroll
void updatePageIndicator(index)=> currentPageIndex.value = index;

/// Jump to the specific do selected page
void dotNavigationOnClick(index) {
  currentPageIndex.value = index;
  pageController.jumpTo(index);
}

/// Update Current Index & jump to next page
void goToNextPage() {
  if(currentPageIndex.value == 2){
    // Navigate to LogIn Screen
  }else{
  currentPageIndex.value += 1;
    pageController.jumpToPage(currentPageIndex.value);
  }
}

/// Update Current Index & jump to the last page
void skipPage() {
  currentPageIndex.value = 2;
  pageController.jumpToPage(2);
}

}