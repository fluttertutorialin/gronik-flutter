import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_sizes.dart';
import '../../widgets/buttons.dart';
import '../../widgets/gronik_layout.dart';
import '../../../constants/app_colors.dart';
import '../../theme/text_theme.dart';

class ReferScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GronikLayoutTwo(
        appBarTitle: 'Refer Friend',

        content: Expanded(
          child: Container(
            width: Get.width,
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              children: [
                AppSizes.hGap20,

                Text(
                  'Refer now',
                  style: AppText.heading1,
                ),
                AppSizes.hGap20,

                Text(
                  'Refer your friends for purchase the grocery product for daily life.',
                  style:
                      AppText.paragraph1.copyWith(color: AppColors.APP_BLACK),
                  textAlign: TextAlign.center,
                ),

                AppSizes.hGap30,
                Stack(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Mail Address'),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        margin: EdgeInsets.only(top: 0),
                        child: AppButton(
                          label: 'Send',
                          onTap: null,
                          height: 60,
                        ),
                      ),
                    ),
                  ],
                ),
                AppSizes.hGap20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Get.width * 0.2,
                      color: AppColors.NEUTRAL_50,
                      height: 1,
                    ),
                    Text(
                      'Or Share via',
                      style: AppText.paragraph1.copyWith(
                        color: AppColors.NEUTRAL_50,
                      ),
                    ),
                    Container(
                      width: Get.width * 0.2,
                      color: AppColors.NEUTRAL_50,
                      height: 1,
                    ),
                  ],
                ),
                AppSizes.hGap15,

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.BACKGROUND_COLOR,
                            border: Border.all(
                              color: Color(0xFFC2C4D2).withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: Get.width * 0.06,
                            child: Image.asset(
                              AppImages.ICON_GOOGLE,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                      /* <---- Facebook ----> */
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.BACKGROUND_COLOR,
                            border: Border.all(
                              color: Color(0xFFC2C4D2).withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: Get.width * 0.06,
                            child: Image.asset(
                              AppImages.ICON_FACEBOOK,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        /* <---- Bottom Bar ----> */
        bottomAppBar: SizedBox(),
      ),
    );
  }
}
