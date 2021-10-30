import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_defaults.dart';
import '../../constants/app_images.dart';
import '../../constants/app_sizes.dart';
import '../theme/text_theme.dart';
import '../widgets/buttons.dart';

class SuccessReviewDialog extends StatelessWidget {
  const SuccessReviewDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: AppDefaults.defaulBorderRadius,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: Get.height * 0.06,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /* <---- Heading Image ----> */
            Container(
              width: Get.width * 0.5,
              child: Image.asset(AppImages.PAY_REVIEW_SUCCESS),
            ),
            AppSizes.hGap40,
            /* <---- Header ----> */
            Text(
              'Successfull',
              style: AppText.heading1.copyWith(color: AppColors.APP_BLACK),
            ),
            AppSizes.hGap10,
            Text(
              '''Your feedback is successfully placed.''',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.APP_BLACK),
            ),
            AppSizes.hGap20,
            /* <---- Confirm button ----> */
            AppButton(
              label: 'Continue',
              onTap: null,
            ),
            AppSizes.hGap20,
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Text(
                'Go back',
                style: AppText.paragraph1.copyWith(
                  color: AppColors.PRIMARY_COLOR,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
