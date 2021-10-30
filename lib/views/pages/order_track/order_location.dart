import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'call_screen.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_sizes.dart';
import '../../../modal/food.dart';
import '../../../constants/app_colors.dart';
import '../../theme/text_theme.dart';

class OrderLocationScreen extends StatelessWidget {
  final Food food;

  const OrderLocationScreen({Key? key, required this.food});

  // User pressed call button
  void _callButton() {
    Get.to(() => CallScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: EdgeInsets.only(left: 30),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 22,
            ),
          ),
        ),
        title: Text(
          'Location Map',
          style: AppText.heading1
              .copyWith(color: AppColors.NEUTRAL_800, fontSize: 26),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Put your Map widget here
          Container(
            width: Get.width,
            height: Get.height,
            child: Image.asset(
              AppImages.DUMMY_MAP_IMAGE,
              fit: BoxFit.cover,
            ),
          ),
          /* <---- Product Description ----> */
          Positioned(
            bottom: 0,
            child: Container(
              height: Get.height * 0.4,
              width: Get.width,
              child: Stack(
                children: [
                  /* <---- Rider Details ----> */
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: Get.height * 0.2,
                      width: Get.width * 0.92,
                      margin: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.APP_BLACK,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32),
                        ),
                      ),
                      child: Column(
                        children: [
                          AppSizes.hGap40,
                          AppSizes.hGap20,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage:
                                    AssetImage(AppImages.PROFILE_RIDER),
                              ),
                              // Rider Details
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Lakhani Kamlesh',
                                    style: AppText.heading2.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                  AppSizes.hGap5,
                                  Text(
                                    'Food Courier',
                                    style: AppText.paragraph1.copyWith(
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                  ),
                                  AppSizes.hGap5,
                                  // Stars
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color(0xFFF2994A),
                                        size: 18,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color(0xFFF2994A),
                                        size: 18,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color(0xFFF2994A),
                                        size: 18,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color(0xFFF2994A),
                                        size: 18,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color(0xFFF2994A),
                                        size: 18,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              // Call Button
                              InkWell(
                                onTap: _callButton,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.PRIMARY_COLOR),
                                  child: Icon(
                                    Icons.call,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      height: Get.height * 0.23,
                      width: Get.width * 0.92,
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shipping Details',
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                  ),
                ],
              ),
            ),
          ),

          /* <---- Marker ----> */
          Positioned(
            bottom: Get.height * 0.4,
            right: 16,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17),
              ),
              child: Image.asset(
                AppImages.ICON_TARGET,
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
