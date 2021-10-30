import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/dummyData.dart';
import '../../../modal/food.dart';
import 'progress_order.dart';
import 'review_order.dart';
import '../../../constants/app_colors.dart';
import '../../theme/text_theme.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Column(
        children: [
          /* <----- Appbar -----> */
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Order',
                  style: AppText.heading1.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          AppSizes.hGap20,

          /* <---- Main Container ----> */
          Expanded(
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: Color(0xFFF4F5F7),
                borderRadius: BorderRadius.circular(30),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          /* <---- Categories Column ----> */
                          Container(
                            height: Get.height * 0.05,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                CategoryButton(
                                  buttonLabel: 'All Orders',
                                  onTap: null,
                                  active: true,
                                ),
                                CategoryButton(
                                  buttonLabel: 'Pending',
                                  onTap: null,
                                ),
                                CategoryButton(
                                  buttonLabel: 'Processing',
                                  onTap: null,
                                ),
                                CategoryButton(
                                  buttonLabel: 'Delivered',
                                  onTap: null,
                                ),
                              ],
                            ),
                          ),
                          /* <---- End of Categories Column ----> */
                          AppSizes.hGap20,
                          /* <----  List of orders ----> */
                          Container(
                            height: Get.height * 0.68,
                            child: ListView.builder(
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return SingleProductOrderList(
                                  food: DummyData.foods[index],
                                  onTap: () {
                                    /* <-----------------------> 
                                        If the index is 1 then we will show 
                                        this as delivered,
                                        just for demonstration how the completed
                                        order and review page will look like;   
                                     <-----------------------> */
                                    index == 1
                                        ? Get.to(() => CompletedOrderReview(
                                              food: DummyData.foods[index],
                                            ))
                                        : Get.to(
                                            () => OrderDetails(
                                              food: DummyData.foods[index],
                                            ),
                                          );
                                  },
                                  completedOrder: index == 1,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.buttonLabel,
    required this.onTap,
    this.active = false,
  });

  final String buttonLabel;
  final void Function()? onTap;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: active ? AppColors.PRIMARY_COLOR : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: active ? AppColors.PRIMARY_COLOR : AppColors.NEUTRAL_50,
        ),
      ),
      child: Text(
        '$buttonLabel',
        style: AppText.paragraph1
            .copyWith(color: active ? Colors.white : Colors.black),
      ),
    );
  }
}

/* <---- How a Single product will look like in this list ----> */
class SingleProductOrderList extends StatelessWidget {
  const SingleProductOrderList({
    Key? key,
    required this.food,
    this.onTap,
    this.completedOrder = false,
  });

  final Food food;
  final void Function()? onTap;
  final bool completedOrder;

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
                  Text(
                    '${food.foodName}',
                    style: AppText.paragraph1.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  AppSizes.hGap10,
                  Text(
                    '\$${food.foodPrice}',
                    style: AppText.paragraph1.copyWith(
                        color: AppColors.PRIMARY_COLOR,
                        fontWeight: FontWeight.w600),
                  ),
                  AppSizes.hGap10,
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColors.BACKGROUND_COLOR,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      completedOrder ? 'Delivered' : 'Processing',
                      style: TextStyle(color: Colors.black),
                    ),
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
                  Text(
                    '23 Jan, 2020',
                    style: AppText.paragraph1.copyWith(
                      fontSize: 12,
                      color: Color(0xFFC2C4D2),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
