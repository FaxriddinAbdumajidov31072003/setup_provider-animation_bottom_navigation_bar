


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainController extends GetxController{

  int currentIndex = 0;
   RxBool isScrolling = false.obs;
   Offset offset = const Offset(0, 0);

  changeIndex(int index)  {
    currentIndex = index;
    update();
  }

  changeOffset(Offset  newOffset){
    offset = newOffset;
    update();
  }


  changeScroll(bool isScrolling)  {
    this.isScrolling.value = isScrolling;
  }
}