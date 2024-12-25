import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shopung_ui/controller/main_controller.dart';
import 'package:shopung_ui/res/app_colors.dart';
import 'package:shopung_ui/res/app_font_size.dart';
import 'package:shopung_ui/view/cart/cart_view.dart';
import 'package:shopung_ui/view/home/home_view.dart';

class MainView extends StatelessWidget {
   MainView({super.key});
   MainController mainController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: 
      ()
      {
        mainController.currentTab.value=2;
      },
      shape: const CircleBorder(),
      backgroundColor: AppColors.kprimaryColor,
      child:const Icon(Iconsax.home,
      color: AppColors.kwhiteColor,
      ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        height: AppValueSize.s70,
        color: AppColors.kwhiteColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: AppMarginSize.m5,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child:Obx(() =>  Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                mainController.currentTab.value = 0;
              },
              icon: Icon(
                Ionicons.grid_outline,
                color: mainController.currentTab.value==0?AppColors.kprimaryColor
                :AppColors.kGrayColorShade400,
              ),
            ),
            IconButton(
              onPressed: () {
                mainController.currentTab.value = 1;
              },
              icon: Icon(
                Ionicons.heart_outline,
                color: mainController.currentTab.value==1?AppColors.kprimaryColor
                :AppColors.kGrayColorShade400,
              ),
            ),
            IconButton(
              onPressed: () {
                mainController.currentTab.value = 3;
              },
              icon: Icon(
                Ionicons.cart_outline,
                color: mainController.currentTab.value==3?AppColors.kprimaryColor
                :AppColors.kGrayColorShade400,
              ),
            ),
            IconButton(
              onPressed: () {
                mainController.currentTab.value = 4;
              },
              icon: Icon(
                Ionicons.person_outline,
                color: mainController.currentTab.value==4?AppColors.kprimaryColor
                :AppColors.kGrayColorShade400,
              ),
            ),
          ],
        ),
        ),
      ),
      body: Obx(() => mainController.views[mainController.currentTab.value]),
    );
  }
}
