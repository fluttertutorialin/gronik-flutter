import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_sizes.dart';
import '../../widgets/gronik_layout.dart';
import '../../../constants/dummyData.dart';
import '../../../modal/food.dart';
import '../home_products/product_details.dart';
import '../../../constants/app_colors.dart';
import '../../theme/text_theme.dart';

class DiscountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GronikLayoutTwo(
        appBarTitle: '30% Discount',
        /* <---- Content ----> */
        content: Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 16, left: 16, right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                /* <---- Content ----> */
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /* <---- Filter By ----> */
                      Row(
                        children: [
                          Text(
                            'Filter by',
                            style: AppText.paragraph1.copyWith(
                              color: AppColors.NEUTRAL_50,
                            ),
                          ),
                          AppSizes.wGap10,
                          DropdownButton<String>(
                            underline: SizedBox(),
                            value: 'low',
                            items: [
                              DropdownMenuItem(
                                value: 'low',
                                child: Text('Lowest Price'),
                              ),
                              DropdownMenuItem(
                                value: 'high',
                                child: Text('Highest Price'),
                              )
                            ],
                            onChanged: (value) {},
                          )
                        ],
                      ),
                      /* <---- Total Results ----> */
                      Text(
                        '345 Results',
                        style: AppText.paragraph1.copyWith(
                          color: AppColors.NEUTRAL_50,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return SingleProductDiscount(
                        food: DummyData.foods[index],
                        onTap: () {
                          Get.to(() => ProductDetails(
                                food: DummyData.foods[index],
                                discountON: true,
                              ));
                        },
                      );
                    },
                    itemCount: DummyData.foods.length,
                  ),
                ),
              ],
            ),
          ),
        ),
        /* <---- Bottom Bar ----> */
        bottomAppBar: Container(),
      ),
    );
  }
}

/* <---- How a Single product will look like in discount page ----> */
class SingleProductDiscount extends StatelessWidget {
  const SingleProductDiscount({
    Key? key,
    required this.food,
    this.onTap,
  });

  final Food food;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
                    ],
                  ),
                  AppSizes.hGap10,
                  Row(
                    children: [
                      /* <---- Discount ----> */
                      Container(
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Color(0xFFEB5757),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          '30%',
                          style:
                              AppText.paragraph1.copyWith(color: Colors.white),
                        ),
                      ),
                      AppSizes.wGap10,
                      /* <---- Actual Price ----> */
                      Text(
                        '\$${food.foodPrice}',
                        style: AppText.paragraph1.copyWith(
                            color: AppColors.PRIMARY_COLOR,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            /* <---- Counter ----> */
          ],
        ),
      ),
    );
  }
}
