import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shopung_ui/model/prodect.dart';
import 'package:shopung_ui/res/app_colors.dart';
import 'package:shopung_ui/res/app_font_size.dart';

class ProductView extends StatelessWidget {
  ProductView({super.key, });
  Product product = Get.arguments['product'];
  int currentImage = 0;
  int currentColor = 0;
  int currentNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kcontentColor,
      floatingActionButton: AddToCart(
        currentNumber: currentNumber,
        onAdd: () {
          currentNumber++;
        },
        onRemove: () {
          if (currentNumber != 1) {
            currentNumber--;
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProductAppBar(),
              ImageSlider(
                onPageChanged: (value) {
                  currentImage = value;
                },
                currentImage: currentImage,
                image: product.image,
              ),
              SizedBox(
                height: AppValueSize.s10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: currentImage == index
                        ? AppValueSize.s15
                        : AppValueSize.s8,
                    height: AppValueSize.s8,
                    margin: EdgeInsets.only(right: AppMarginSize.m2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppRadiusSize.r10),
                      border: Border.all(
                        color: AppColors.kblackColor,
                      ),
                      color: currentImage == index
                          ? AppColors.kblackColor
                          : Colors.transparent,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppValueSize.s20,
              ),
              Container(
                width: AppValueSize.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppRadiusSize.r20),
                    topRight: Radius.circular(AppRadiusSize.r20),
                  ),
                  color: AppColors.kwhiteColor,
                ),
                padding: EdgeInsets.only(
                    right: AppPaddingSize.p20,
                    left: AppPaddingSize.p20,
                    top: AppPaddingSize.p20,
                    bottom: AppPaddingSize.p100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductInfo(product: product),
                    SizedBox(
                      height: AppValueSize.s20,
                    ),
                    Text(
                      "Color",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: AppValueSize.s10,
                    ),
                    Row(
                      children: List.generate(
                        product.colors.length,
                        (cindex) => GestureDetector(
                          onTap: () {
                            currentColor = cindex;
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: AppValueSize.s30,
                            height: AppValueSize.s30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentColor == cindex
                                  ? AppColors.kwhiteColor
                                  : product.colors[cindex],
                              border: currentColor == cindex
                                  ? Border.all(
                                      color: product.colors[cindex],
                                    )
                                  : null,
                            ),
                            padding: currentColor == cindex
                                ? EdgeInsets.all(AppPaddingSize.p2)
                                : null,
                            margin: EdgeInsets.only(right: AppMarginSize.m14),
                            child: Container(
                              width: AppValueSize.s25,
                              height: AppValueSize.s25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: product.colors[cindex],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppValueSize.s20,
                    ),
                    ProductDescription(descriptionText: product.description),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddToCart extends StatelessWidget {
  final int currentNumber;
  final Function() onAdd;
  final Function() onRemove;
  const AddToCart({
    super.key,
    required this.currentNumber,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingSize.p10,
      ),
      child: Container(
        height: AppValueSize.s80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadiusSize.r50),
          color: AppColors.kblackColor,
        ),
        padding: EdgeInsets.symmetric(horizontal: AppPaddingSize.p10),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: AppValueSize.s40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.kdarkGrayColor,
                  width: AppValueSize.s2,
                ),
                borderRadius: BorderRadius.circular(AppRadiusSize.r20),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    iconSize: AppValueSize.s18,
                    icon: const Icon(
                      Ionicons.remove_outline,
                      color: AppColors.kwhiteColor,
                    ),
                  ),
                  SizedBox(
                    width: AppValueSize.s5,
                  ),
                  Text(
                    "$currentNumber",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.kwhiteColor,
                        ),
                  ),
                  SizedBox(
                    width: AppValueSize.s5,
                  ),
                  IconButton(
                    onPressed: () {},
                    iconSize: AppValueSize.s18,
                    icon: const Icon(
                      Ionicons.add_outline,
                      color: AppColors.kwhiteColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: AppValueSize.s60,
              decoration: BoxDecoration(
                color: AppColors.kprimaryColor,
                borderRadius: BorderRadius.circular(AppRadiusSize.r60),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: AppPaddingSize.p40),
              child: Text(
                "Add to Cart",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.kwhiteColor,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDescription extends StatelessWidget {
  final String descriptionText;
  const ProductDescription({super.key, required this.descriptionText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: AppValueSize.s110,
          height: AppValueSize.s38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadiusSize.r20),
            color: AppColors.kprimaryColor,
          ),
          alignment: Alignment.center,
          child: Text(
            "Description",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.kwhiteColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        SizedBox(
          height: AppValueSize.s20,
        ),
        Text(
          descriptionText,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColors.kdarkGrayColor,
              ),
        )
      ],
    );
  }
}

class ProductInfo extends StatelessWidget {
  final Product product;
  const ProductInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$${product.price}",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: AppValueSize.s10,
                ),
                Row(
                  children: [
                    Container(
                      width: AppValueSize.s50,
                      height: AppValueSize.s20,
                      decoration: BoxDecoration(
                        color: AppColors.kprimaryColor,
                        borderRadius: BorderRadius.circular(AppRadiusSize.r15),
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppPaddingSize.p5,
                        vertical: AppPaddingSize.p2,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Ionicons.star,
                            size: AppValueSize.s13,
                            color: AppColors.kwhiteColor,
                          ),
                          SizedBox(
                            width: AppValueSize.s3,
                          ),
                          Text(
                            product.rate.toString(),
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: AppColors.kwhiteColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: AppValueSize.s5,
                    ),
                    Text(
                      "(320 Reviews)",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.kdarkGrayColor,
                            fontSize: AppFontSize.ksmallerFontSize,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: "Seller: ",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
              ),
              TextSpan(
                  text: "Tarqul isalm",
                  style: Theme.of(context).textTheme.bodyMedium)
            ])),
          ],
        ),
      ],
    );
  }
}

class ImageSlider extends StatelessWidget {
  final Function(int) onPageChanged;
  final int currentImage;
  final String image;
  const ImageSlider(
      {super.key,
      required this.onPageChanged,
      required this.currentImage,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppValueSize.s250,
      child: PageView.builder(
        itemCount: 5,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          return Image.asset(image);
        },
      ),
    );
  }
}

class ProductAppBar extends StatelessWidget {
  const ProductAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppPaddingSize.p10),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: IconButton.styleFrom(
              backgroundColor: AppColors.kwhiteColor,
              padding: EdgeInsets.all(AppPaddingSize.p14),
            ),
            icon: const Icon(
              Ionicons.chevron_back,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: AppColors.kwhiteColor,
              padding: EdgeInsets.all(AppPaddingSize.p14),
            ),
            icon: const Icon(
              Ionicons.share_social_outline,
            ),
          ),
          SizedBox(width: AppValueSize.s5),
          IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                backgroundColor: AppColors.kwhiteColor,
                padding: EdgeInsets.all(AppPaddingSize.p14),
              ),
              icon: const Icon(
                Ionicons.heart_outline,
              ))
        ],
      ),
    );
  }
}
