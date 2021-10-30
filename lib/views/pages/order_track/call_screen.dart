import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_sizes.dart';
import '../../theme/text_theme.dart';
import '../../../constants/app_colors.dart';

class CallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /* <---- Calling status ----> */
              Text(
                'Calling...',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
              /* <---- Image of rider ----> */
              Container(
                width: Get.width * 0.5,
                child: Image.asset(
                  AppImages.PROFILE_RIDER,
                  fit: BoxFit.fitWidth,
                ),
              ),
              /* <---- Rider Name ----> */
              Column(
                children: [
                  Text(
                    'Lakhani Kamlesh',
                    style: AppText.heading1,
                  ),
                  AppSizes.hGap20,
                  /* <---- Call Duration ----> */
                  Text(
                    '12:05',
                  ),
                ],
              ),

              /* <---- Action Buttons ----> */
              Container(
                width: Get.width * 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /* <---- Mute Button ----> */
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.NEUTRAL_50,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.mic_off,
                          size: 30,
                        ),
                      ),
                    ),
                    /* <---- Call End Button ----> */
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.redAccent,
                          ),
                          shape: BoxShape.circle,
                          color: Colors.redAccent,
                        ),
                        child: Icon(
                          Icons.call_end,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    /* <---- Speaker Button ----> */
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.APP_BLACK,
                          ),
                          shape: BoxShape.circle,
                          color: AppColors.APP_BLACK,
                        ),
                        child: Icon(
                          Icons.volume_up,
                          size: 30,
                          color: Colors.white,
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
    );
  }
}
