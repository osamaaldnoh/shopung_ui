import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/cart/cart_view.dart';
import '../view/home/home_view.dart';

class MainController extends GetxController
{
  RxInt currentTab = 2.obs;

    List views = 
  [
    const Scaffold(),
    const Scaffold(),
    HomeView(),
     CartView(),
    const Scaffold(),
  ];
  
}