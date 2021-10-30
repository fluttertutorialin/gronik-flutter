import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_sizes.dart';
import '../../widgets/gronik_layout.dart';
import '../../../constants/app_colors.dart';
import '../../theme/text_theme.dart';

class ScanCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GronikLayoutTwo(
        appBarTitle: 'Scan card',
        content: Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppSizes.hGap20,
                Text(
                  '1/2',
                  style:
                      AppText.heading1.copyWith(color: AppColors.NEUTRAL_800),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: Text(
                    'Place the front side of your card in a green square',
                    style: AppText.paragraph1
                        .copyWith(color: AppColors.PLACEHOLDER_2),
                    textAlign: TextAlign.center,
                  ),
                ),
                AppSizes.hGap15,
                /* <-----------------------> 
                    You can put the camera widget here, for this UI build we
                    will use a static image here.   
                 <-----------------------> */
                Expanded(
                  child: Container(
                    child: Image.asset(AppImages.PAY_SCAN_CARD),
                  ),
                )
              ],
            ),
          ),
        ),
        /* <---- Shutter Button ----> */
        bottomAppBar: Positioned(
          bottom: Get.height * 0.05,
          child: Container(
            width: Get.width,
            /* <---- The white circle around it ----> */
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    /* <---- The inside circle ----> */
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: AppColors.PRIMARY_COLOR, width: 4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
