import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../dialogs/add_address_sheet.dart';
import '../../../constants/app_images.dart';
import '../../dialogs/add_card_sheet.dart';
import '../../../constants/app_sizes.dart';
import '../../widgets/gronik_layout.dart';
import '../../dialogs/success_order_dialog.dart';
import '../../../constants/app_colors.dart';
import '../../theme/text_theme.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GronikLayoutTwo(
        appBarTitle: 'Checkout',
        content: Expanded(
          child: Container(
            child: Column(
              children: [
                /* <---- Address ----> */
                Container(
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Column(
                    children: [
                      /* <---- Header ----> */
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Address',
                              style: AppText.heading2
                                  .copyWith(color: AppColors.NEUTRAL_800),
                            ),
                            InkWell(
                              onTap: () {
                                // This will show pop up of address
                                Get.bottomSheet(
                                  AddAddressSheet(),
                                  isScrollControlled: true,
                                );
                              },
                              child: Text(
                                'Add new',
                                style: AppText.paragraph1.copyWith(
                                    fontSize: 14,
                                    color: AppColors.PRIMARY_COLOR),
                              ),
                            ),
                          ],
                        ),
                      ),
                      /* <---- Divider ----> */
                      Container(
                        width: Get.width,
                        color: Color(0xFFF4F5F7),
                        height: 2,
                      ),

                      /* <---- Address ----> */
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_box_rounded,
                              color: AppColors.PRIMARY_COLOR,
                            ),
                            AppSizes.wGap10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Office',
                                  style: AppText.paragraph1
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text('''530  Juniper Drive, Saginaw, Michigan, 
48603'''),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_box_outline_blank_rounded,
                              color: AppColors.PRIMARY_COLOR,
                            ),
                            AppSizes.wGap10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Home',
                                  style: AppText.paragraph1
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    '''1002  Trouser Leg Road, Greenfield \nMassachusetts, 01301'''),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Column(
                    children: [
                      /* <---- Header ----> */
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Payment',
                              style: AppText.heading2
                                  .copyWith(color: AppColors.NEUTRAL_800),
                            ),
                            InkWell(
                              onTap: () {
                                Get.bottomSheet(
                                  AddACardSheet(),
                                  isScrollControlled: true,
                                );
                              },
                              child: Text(
                                'Add new',
                                style: AppText.paragraph1.copyWith(
                                    fontSize: 14,
                                    color: AppColors.PRIMARY_COLOR),
                              ),
                            ),
                          ],
                        ),
                      ),
                      /* <---- Divider ----> */
                      Container(
                        width: Get.width,
                        color: Color(0xFFF4F5F7),
                        height: 2,
                      ),

                      /* <---- Payment ----> */
                      // Master Card
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_box_rounded,
                              color: AppColors.PRIMARY_COLOR,
                            ),
                            AppSizes.wGap10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mastercard',
                                  style: AppText.paragraph1
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                AppSizes.hGap5,
                                Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      child: Image.asset(
                                        AppImages.PAY_MASTERCARD,
                                      ),
                                    ),
                                    AppSizes.wGap5,
                                    Text('**** **** 9026'),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      // Visa card
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_box_outline_blank_outlined,
                              color: AppColors.PRIMARY_COLOR,
                            ),
                            AppSizes.wGap10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Visa Card',
                                  style: AppText.paragraph1
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                AppSizes.hGap5,
                                Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      child: Image.asset(AppImages.PAY_VISA),
                                    ),
                                    AppSizes.wGap5,
                                    Text('**** **** 2005'),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      // Cash on Delivery
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_box_outline_blank_outlined,
                              color: AppColors.PRIMARY_COLOR,
                            ),
                            AppSizes.wGap10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cash on delivery',
                                  style: AppText.paragraph1
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                AppSizes.hGap5,
                                Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      child: Image.asset(AppImages.PAY_COD),
                                    ),
                                    AppSizes.wGap5,
                                    Text('\$4.70'),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomAppBar: Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total: \$30.00',
                        style: AppText.heading2,
                      ),
                      InkWell(
                        onTap: () {
                          // User clicked on checkout
                          // GronikDialogs.successOrders();
                          Get.dialog(SuccessOrderDialog());
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
                                'Continue',
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
