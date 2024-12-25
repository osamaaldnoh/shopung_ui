import 'package:get/get.dart';

import '../model/cart_item.dart';
import '../model/prodect.dart';

class CartController extends GetxController
{
  RxInt quantity = 1.obs;
  RxList<CartItem> cartItems = RxList([
  CartItem(quantity: 2, product: products[0]),
  CartItem(quantity: 1, product: products[1]),
]);

   onRefrsh({required RxList<CartItem> cartItem})
  {
    cartItems = cartItem;
    update(cartItem,true);
  }

  onRemove()
  {
    if(quantity.value != 0)
    {
    quantity--;
    }
  }
}