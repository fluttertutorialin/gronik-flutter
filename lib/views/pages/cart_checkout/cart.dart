import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_images.dart';
import '../../../controller/cart/cart_controller.dart';
import '../../../controller/navigation/navigation_controller.dart';
import '../../../constants/app_sizes.dart';
import '../../widgets/gronik_layout.dart';
import '../../../constants/dummyData.dart';
import '../../../modal/food.dart';
import 'checkout.dart';
import '../../../constants/app_colors.dart';
import '../../theme/text_theme.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: GronikLayoutTwo(
        appBarTitle: 'Cart',
        backButtonFunction: () {
          Get.find<NavigationController>().getBackPrevScreen();
        },
        content: Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Column(
                    children: [
                      DummyData.cartItems.length == 0
                          ? Expanded(
                              child: EmptyCart(),
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemCount: DummyData.cartItems.length,
                                itemBuilder: (context, index) {
                                  return Dismissible(
                                    key: UniqueKey(),
                                    onDismissed: (direction) {
                                      DummyData.cartItems.removeAt(index);
                                      Get.find<CartController>()
                                          .cartItemsLength
                                          .value--;
                                    },
                                    background: DisMissBackground(),
                                    child: SingleProductHorizontal(
                                      food: DummyData.cartItems[index],
                                    ),
                                  );
                                },
                              ),
                            ),
                      AppSizes.hGap40,
                      AppSizes.hGap10,
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total: \$30',
                      style: AppText.heading2,
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.PRIMARY_COLOR,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Checkout',
                            style: AppText.paragraph1
                                .copyWith(color: Colors.white),
                          ),
                          AppSizes.wGap10,
                          Icon(
                            Icons.double_arrow_rounded,
                            color: Colors.white,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomAppBar: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: Get.width,
                height: Get.height * 0.2,
                decoration: BoxDecoration(
                  color: Color(0xFFE9F7EF),
                  borderRadius: BorderRadius.circular(32),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Total: \$30.00',
                          style: AppText.heading2,
                        ),
                        InkWell(
                          onTap: () {
                            // User clicked on checkout
                            Get.to(() => CheckoutScreen());
                          },
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.PRIMARY_COLOR,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Checkout',
                                  style: AppText.paragraph1
                                      .copyWith(color: Colors.white),
                                ),
                                AppSizes.wGap10,
                                Icon(
                                  Icons.double_arrow_rounded,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.EMPTY_CART),
          Text('Cart is empty'),
        ],
      ),
    );
  }
}

class DisMissBackground extends StatelessWidget {
  const DisMissBackground({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(10)),
        child: Image.asset(
          AppImages.ICON_TRASH,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}

class SingleProductHorizontal extends StatelessWidget {
  const SingleProductHorizontal({
    Key? key,
    required this.food,
  });

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFF4F5F7),
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Image.asset(
                '${food.foodImage}',
              ),
            ),
          ),
          /* <---- Food Details ----> */
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${food.foodName}',
                      style: AppText.paragraph1.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    AppSizes.hGap10,
                    Text(
                      '\$${food.foodWeight}',
                      style: AppText.paragraph1
                          .copyWith(color: AppColors.NEUTRAL_50),
                    ),
                  ],
                ),
                AppSizes.hGap10,
                Text(
                  '\$${food.foodPrice}',
                  style: AppText.paragraph1.copyWith(
                      color: AppColors.PRIMARY_COLOR,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          /* <---- Counter ----> */
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                AppSizes.hGap5,
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: AppColors.PRIMARY_COLOR,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    '01',
                    style: AppText.paragraph1
                        .copyWith(fontSize: 14, color: Colors.white),
                  ),
                ),
                AppSizes.hGap5,
                Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
