import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_sizes.dart';
import '../../widgets/gronik_layout.dart';
import 'reset_password.dart';
import '../../../constants/app_colors.dart';
import '../../theme/text_theme.dart';

class VerificationScreen extends StatelessWidget {
  /* <---- User clicked continue ----> */
  _onContinue() {
    Get.to(() => ResetPassword());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GronikLayoutOne(
        /* <----------- Content ------------> */
        content: Expanded(
          child: Container(
            margin: EdgeInsets.all(16),
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: 32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(26),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppSizes.hGap40,
                Text(
                  'Verification',
                  style: AppText.heading1,
                ),
                AppSizes.hGap15,
                Text(
                  'We have sent code to your number',
                  style: AppText.paragraph1,
                  textAlign: TextAlign.center,
                ),
                AppSizes.hGap10,
                /* <---- Number ----> */
                Text(
                  '(+62) 821 321 542 942',
                  style: AppText.paragraph1
                      .copyWith(color: AppColors.PRIMARY_COLOR),
                ),
                AppSizes.hGap40,
                /* <---- Verification ----> */
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        /* <---- OTP ----> */
                        /* <---- You can use this plugin here ----> */
                        // PinCodeTextField(
                        //   appContext: context,
                        //   length: 4,
                        //   onChanged: (String value) {},
                        //   controller: null,
                        //   cursorColor: AppColors.primaryColor,
                        //   AppColors.backgroundColor: AppColors.bgGreen,
                        //   showCursor: false,
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(21),
                              decoration: BoxDecoration(
                                color: AppColors.BACKGROUND_COLOR,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '1',
                                style: AppText.heading2,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(21),
                              decoration: BoxDecoration(
                                color: AppColors.BACKGROUND_COLOR,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '2',
                                style: AppText.heading2,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(21),
                              decoration: BoxDecoration(
                                color: AppColors.BACKGROUND_COLOR,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '3',
                                style: AppText.heading2,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(21),
                              decoration: BoxDecoration(
                                color: AppColors.APP_GREEN,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    width: 1, color: AppColors.PRIMARY_COLOR),
                              ),
                              child: Text(
                                '4',
                                style: AppText.heading2,
                              ),
                            ),
                          ],
                        ),
                        /* <---- Didn't Recieve Code ----> */
                        AppSizes.hGap20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Didn’t receive code?'),
                            AppSizes.wGap10,
                            Text(
                              'Resend',
                              style: AppText.paragraph1.copyWith(
                                  color: AppColors.PRIMARY_COLOR, fontSize: 14),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                /* <----------- Small Notes ------------> */
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.APP_GREEN,
                        ),
                        child: Icon(
                          Icons.check_box,
                          color: AppColors.PRIMARY_COLOR,
                        ),
                      ),
                      AppSizes.wGap10,
                      Expanded(
                        child: Text(
                          'Verification codes are only sent to the registered phone number',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.NEUTRAL_50,
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
        /* <----------- BottomBar ------------> */
        bottomBar: Container(
          width: Get.width,
          padding: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: Column(
            children: [
              TextButton(
                onPressed: _onContinue,
                child: Container(
                  width: Get.width * 0.8,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: AppColors.PRIMARY_COLOR,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Continue',
                    style: AppText.paragraph1.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
