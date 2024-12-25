import 'package:get/get.dart';
import 'package:shopung_ui/controller/cart_controller.dart';
import 'package:shopung_ui/controller/main_controller.dart';

import '../../controller/home_controller.dart';

class BuildBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut(() => MainController(),fenix: true);
    Get.lazyPut(() => HomeController(),fenix: true);
    Get.lazyPut(() => CartController(),fenix: true);
  }
  
}