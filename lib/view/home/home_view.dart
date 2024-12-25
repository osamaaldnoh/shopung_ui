import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shopung_ui/controller/home_controller.dart';
import 'package:shopung_ui/model/prodect.dart';
import 'package:shopung_ui/res/app_colors.dart';
import 'package:shopung_ui/res/app_font_size.dart';
import 'package:shopung_ui/res/utils/routs/route_name.dart';
import '../../model/category.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppPaddingSize.p10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBar(),
                SizedBox(
                  height: AppValueSize.s20,
                ),
                const SearchField(),
                SizedBox(
                  height: AppValueSize.s20,
                ),
                Obx(() => 
                HomeSlider(
                  currentSlide: _homeController.currentSlide.value,
                  onPageChanged: (value) {
                    _homeController.currentSlide.value = value;
                  },
                  ),
                ),
                SizedBox(
                  height: AppValueSize.s20,
                ),
                const Categores(),
                SizedBox(
                  height: AppValueSize.s25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Special For You",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Sea all"),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppValueSize.s10,
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                    bottom: AppPaddingSize.p20,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: AppValueSize.s20,
                      crossAxisSpacing: AppValueSize.s20,
                      childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.6)),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: products[index],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          RouteName.productView,
        arguments: {
          'product': product
        });
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (_) => ProductView(product: product)));
      },
      child: Stack(
        children: [
          Container(
            //  height: AppValueSize.s250,
            width: AppValueSize.infinity,
            decoration: BoxDecoration(
              color: AppColors.kcontentColor,
              borderRadius: BorderRadius.circular(AppRadiusSize.r20),
            ),
            child: Column(
              children: [
                Image.asset(
                  product.image,
                  width: AppValueSize.s120,
                  height: AppValueSize.s115,
                ),
                Text(
                  product.title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Row(
                      children: List.generate(
                        product.colors.length,
                        (cindex) => Container(
                          height: AppValueSize.s15,
                          width: AppValueSize.s15,
                          margin: EdgeInsets.only(right: AppMarginSize.m2),
                          decoration: BoxDecoration(
                            color: product.colors[cindex],
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: AppValueSize.s30,
                height: AppValueSize.s30,
                decoration: BoxDecoration(
                  color: AppColors.kprimaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(AppRadiusSize.r20),
                    bottomLeft: Radius.circular(AppRadiusSize.r10),
                  ),
                ),
                child: Icon(
                  Ionicons.heart_outline,
                  color: AppColors.kwhiteColor,
                  size: AppValueSize.s18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Categores extends StatelessWidget {
  const Categores({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppValueSize.s90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: AppValueSize.s60,
                width: AppValueSize.s60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(categories[index].image),
                  ),
                ),
              ),
              Text(
                categories[index].title,
                // style: Theme.of(context).textTheme.bodyMedium,
                // style: const TextStyle(
                //   fontWeight: FontWeight.bold,
                // ),
              ),
            ],
          );
        },
        separatorBuilder: (ctx, index) => SizedBox(width: AppValueSize.s20),
        itemCount: categories.length,
      ),
    );
  }
}

class HomeSlider extends StatelessWidget {
  final int currentSlide;
  final Function(int) onPageChanged;
  const HomeSlider({
    super.key,
    required this.currentSlide, required this.onPageChanged,
  });

  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: AppValueSize.s200,
          width: AppValueSize.infinity,
          child: PageView.builder(
            itemCount: 4,
            onPageChanged: onPageChanged,
            itemBuilder: (ctx, index) {
              return Container(
                height: AppValueSize.s200,
                width: AppValueSize.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadiusSize.r20),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/slider.jpg'),
                  ),
                ),
              );
            },
          ),
        ),
        Positioned.fill(
            bottom: AppMarginSize.m10,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: currentSlide == index
                        ? AppValueSize.s14
                        : AppValueSize.s8,
                    height: AppValueSize.s8,
                    margin: EdgeInsets.only(right: AppMarginSize.m3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppRadiusSize.r10),
                        color: currentSlide == index
                            ? AppColors.kprimaryColor
                            : Colors.transparent,
                        border: Border.all(
                          color: AppColors.kprimaryColor,
                        )),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppValueSize.s55,
      width: AppValueSize.infinity,
      decoration: BoxDecoration(
        color: AppColors.kcontentColor,
        borderRadius: BorderRadius.circular(AppRadiusSize.r30),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingSize.p25,
        vertical: AppPaddingSize.p5,
      ),
      child: Row(
        children: [
          const Icon(
            Ionicons.search,
            color: AppColors.kdarkGrayColor,
          ),
          SizedBox(
            width: AppValueSize.s10,
          ),
          const Flexible(
            flex: 4,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            height: AppValueSize.s25,
            width: AppValueSize.s1_5,
            color: AppColors.kdarkGrayColor,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Ionicons.options_outline,
                color: AppColors.kdarkGrayColor,
              ))
        ],
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            backgroundColor: AppColors.kcontentColor,
            padding: EdgeInsets.all(AppPaddingSize.p14),
            iconSize: AppIconSize.kThirtynFontSize,
          ),
          icon: const Icon(Ionicons.grid_outline),
        ),
        IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: AppColors.kcontentColor,
              padding: EdgeInsets.all(AppPaddingSize.p14),
              iconSize: AppIconSize.kThirtynFontSize,
            ),
            icon: const Icon(Ionicons.notifications_outline))
      ],
    );
  }
}
