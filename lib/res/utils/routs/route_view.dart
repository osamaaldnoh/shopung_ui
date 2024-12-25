import 'package:get/get.dart';
import 'package:shopung_ui/res/utils/routs/route_name.dart';
import 'package:shopung_ui/view/cart/cart_view.dart';
import 'package:shopung_ui/view/home/home_view.dart';
import 'package:shopung_ui/view/main/main_view.dart';
import 'package:shopung_ui/view/product/product_view.dart';

class RouteView
{
  List<GetPage> getRoute()
  {
    return 
    [
      GetPage(name: RouteName.mainView, page: () => MainView(),),
      GetPage(name: RouteName.homeView, page: () => HomeView(),),
      GetPage(name: RouteName.productView, page: () => ProductView(),),
      GetPage(name: RouteName.cartView, page: () => CartView(),),
    ];
  }
}