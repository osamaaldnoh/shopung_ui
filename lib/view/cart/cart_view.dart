import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shopung_ui/controller/cart_controller.dart';
import 'package:shopung_ui/model/cart_item.dart';
import 'package:shopung_ui/res/app_colors.dart';
import 'package:shopung_ui/res/app_font_size.dart';

class CartView extends StatelessWidget {
   CartView({super.key});
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kcontentColor,
      appBar: AppBar(
        backgroundColor: AppColors.kcontentColor,
        centerTitle: true,
        title: Text(
          "My Cart",
        ),
        leadingWidth: AppValueSize.s60,
        leading: Padding(
          padding: EdgeInsets.only(left: AppPaddingSize.p5),
          child: IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                backgroundColor: AppColors.kwhiteColor,
              ),
              icon: const Icon(Ionicons.chevron_back)),
        ),
      ),
      bottomSheet: CheckOutBox(items: cartController.cartItems),
      body: Obx(
          () =>ListView.separated(
        padding: EdgeInsets.all(AppValueSize.s20),
        itemBuilder: (context, index) =>  CartTitle(
          cartItem: cartController.cartItems.value[index],
          onAdd: ()
          {
            cartController.cartItems.value[index].quantity++;
            print(cartController.cartItems[index].quantity);
            cartController.onRefrsh(cartItem: cartController.cartItems);
          },
          onRemove: ()
          {
            if(cartController.cartItems[index].quantity != 0)
            {cartController.cartItems.value[index].quantity--;}
          },
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: AppValueSize.s20,
        ),
        itemCount: cartController.cartItems.length,
      ),),
    );
  }
}

class CheckOutBox extends StatelessWidget {
  const CheckOutBox({
    super.key,
    required this.items,
  });

  final List<CartItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppValueSize.s220,
      width: AppValueSize.infinity,
      padding: EdgeInsets.all(AppPaddingSize.p20),
      decoration: BoxDecoration(
        color: AppColors.kwhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppRadiusSize.r30),
          topRight: Radius.circular(AppRadiusSize.r30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadiusSize.r30),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: AppPaddingSize.p15,
                vertical: AppPaddingSize.p5,
              ),
              filled: true,
              fillColor: AppColors.kcontentColor,
              hintText: "Enter Discount Code",
              hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColors.kdarkGrayColor,
                // color: Colors.grey,
                fontWeight: FontWeight.w600,
                // fontWeight: FontWeight.w600,
                fontSize: AppFontSize.ksmallerFontSize,
              ),
              suffixIcon: TextButton(onPressed: (){},
               child: Text("Apply",
               style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                height: 0,
                color: AppColors.kprimaryColor,
                fontSize: AppFontSize.kmediumFontSize,
               ),
               ))
            ),
          ),
          SizedBox(height: AppValueSize.s20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Subtotal",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                height: 0,
                fontSize: AppFontSize.ksmallFontSize,
                color: AppColors.kdarkGrayColor,
              ),
              ),
               Text("\$${items.length > 1?items.map<double>(
                (element) => element.quantity*element.product.price)
                .reduce((value1, value2) => value1+value2)
                :items[0].product.price*items[0].quantity}",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                height: 0,
                fontSize: AppFontSize.ksmallFontSize,
                // color: AppColors.kdarkGrayColor,
              ),
              )
            ],
          ),
          SizedBox(height: AppValueSize.s10),
          const Divider(),
          SizedBox(height: AppValueSize.s10),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                height: 0,
                fontSize: AppFontSize.knormalFontSize,
              ),
              ),
               Text("\$${items.length > 1?items.map<double>(
                (element) => element.quantity*element.product.price)
                .reduce((value1, value2) => value1+value2)
                :items[0].product.price*items[0].quantity}",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                height: 0,
                fontSize: AppFontSize.knormalFontSize,
              ),
              )
            ],
          )
        
        ],
      ),
    );
  }
}

class CartTitle extends StatelessWidget {
  final CartItem cartItem;
  final Function() onRemove;
  final Function() onAdd;
  const CartTitle({
    super.key, required this.cartItem, required this.onRemove, required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: AppValueSize.infinity,
          decoration: BoxDecoration(
              color: AppColors.kwhiteColor,
              borderRadius: BorderRadius.circular(AppRadiusSize.r20)),
          padding: EdgeInsets.all(AppPaddingSize.p10),
          child: Row(
            children: [
              Container(
                width: AppValueSize.s85,
                height: AppValueSize.s85,
                decoration: BoxDecoration(
                  color: AppColors.kcontentColor,
                  borderRadius: BorderRadius.circular(AppRadiusSize.r20),
                ),
                padding: EdgeInsets.all(AppPaddingSize.p10),
                child: Image.asset(cartItem.product.image),
              ),
              SizedBox(
                width: AppValueSize.s10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   cartItem.product.title,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: AppValueSize.s5,
                  ),
                  Text(
                    cartItem.product.category,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.kGrayColorShade400,
                          fontSize: 14,
                        ),
                  ),
                  SizedBox(
                    height: AppValueSize.s10,
                  ),
                  Text(
                    "\$${cartItem.product.price}",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: AppValueSize.s5,
          right: AppValueSize.s5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Ionicons.trash_outline,
                  color: AppColors.kredColor,
                  size: AppValueSize.s20,
                ),
              ),
               Container(
          height: AppValueSize.s40,
          decoration: BoxDecoration(
            color: AppColors.kcontentColor,
            // border: Border.all(
            //   color: AppColors.kGrayColorShade400,
            //   width: AppValueSize.s2,
            // ),
            borderRadius: BorderRadius.circular(AppRadiusSize.r20),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: onRemove,
                iconSize: AppValueSize.s18,
                icon: const Icon(
                  Ionicons.remove_outline,
                  color: AppColors.kblackColor,
                ),
              ),
              SizedBox(
                width: AppValueSize.s5,
              ),
              Text(
               cartItem.quantity.toString(),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.kblackColor,
                    ),
              ),
              SizedBox(
                width: AppValueSize.s5,
              ),
              IconButton(
                onPressed: onAdd,
                iconSize: AppValueSize.s18,
                icon: const Icon(
                  Ionicons.add_outline,
                  color: AppColors.kblackColor,
                ),
              ),
            ],
          ),
        ),
      
            ],
          ),
        )
      ],
    );
  }
}
