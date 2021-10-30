import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_sizes.dart';
import '../../widgets/gronik_layout.dart';
import '../../../modal/food.dart';
import 'order_location.dart';
import '../../../constants/app_colors.dart';
import '../../widgets/buttons.dart';
import '../../theme/text_theme.dart';

class OrderDetails extends StatelessWidget {
  final Food food;

  const OrderDetails({Key? key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GronikLayoutTwo(
        appBarTitle: 'Order Details',
        /* <---- Content ----> */
        content: Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /* <---- Order Status ----> */
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      children: [
                        OrderStatus(
                          time: '9:30 AM',
                          label: 'Order Placed',
                          description:
                              'Your order #212423 was placed for delivery.',
                          completed: true,
                        ),
                        OrderStatus(
                          time: '9:35 AM',
                          label: 'Pending',
                          description:
                              'Your order is pending for confirmation. Will confirmed within 5 minutes.',
                          completed: true,
                        ),
                        OrderStatus(
                          time: '9:45 AM',
                          label: 'Confirmed',
                          description:
                              'Your order is confirmed. Will deliver soon within 20 minutes.',
                          completed: true,
                        ),
                        OrderStatus(
                          time: '',
                          label: 'Processing',
                          description:
                              'Your product is processing to deliver you on time.',
                          completed: false,
                        ),
                        OrderStatus(
                          time: '',
                          label: 'Delivered',
                          description:
                              'Product deliver to you and marked as deliverd by customer.',
                          completed: false,
                          lastItem: true,
                        ),
                      ],
                    ),
                  ),
                  AppSizes.hGap10,
                  /* <---- Product Description ----> */
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: AppText.heading1
                              .copyWith(color: AppColors.NEUTRAL_800),
                        ),
                        Divider(),
                        // Food Details
                        Row(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        style: AppText.paragraph1.copyWith(
                                            color: AppColors.NEUTRAL_50),
                                      ),
                                    ],
                                  ),
                                  AppSizes.hGap10,
                                  Text(
                                    '\$${food.foodPrice} (Paid)',
                                    style: AppText.paragraph1.copyWith(
                                        color: AppColors.PRIMARY_COLOR,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AppSizes.hGap10,
                  Container(
                    height: Get.height * 0.11,
                    width: Get.width,
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: AppButton(
                      label: 'Location on Map',
                      onTap: () {
                        Get.to(() => OrderLocationScreen(
                              food: food,
                            ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        /* <---- Bottombar ----> */
        bottomAppBar: Positioned(
          bottom: 0,
          child: SizedBox(),
        ),
      ),
    );
  }
}

// How the order status will look like
class OrderStatus extends StatelessWidget {
  const OrderStatus({
    Key? key,
    required this.label,
    required this.description,
    required this.time,
    required this.completed,
    this.lastItem = false,
  });

  final String label;
  final String description;
  final String time;
  final bool completed;
  // So that we can disable the line
  final bool lastItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Time
          Container(
            width: Get.width * 0.18,
            margin: EdgeInsets.only(top: 6),
            child: Text(
              '$time',
              style: AppText.paragraph1.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          AppSizes.wGap15,
          // Icon
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: completed ? AppColors.PRIMARY_COLOR : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:
                        completed ? AppColors.PRIMARY_COLOR : Color(0xFFC2C4D2),
                    width: 1,
                  ),
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              AppSizes.hGap10,
              Container(
                height: lastItem ? 0 : Get.height * 0.09,
                width: 1,
                color: Color(0xFFC2C4D2),
              ),
            ],
          ),
          AppSizes.wGap15,
          // Order Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$label',
                  style: AppText.heading1,
                ),
                AppSizes.hGap10,
                Text(
                  '$description',
                  style: TextStyle(
                    color: Color(0xff72777B),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
