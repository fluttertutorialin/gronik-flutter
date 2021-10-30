import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_sizes.dart';
import '../../widgets/text_field_custom.dart';
import '../../widgets/gronik_layout.dart';
import '../home_products/entrypoint.dart';
import '../../../constants/app_colors.dart';
import '../../theme/text_theme.dart';

class ResetPassword extends StatelessWidget {
  /* <----------- User Pressed save changes ------------> */
  _onSave() {
    Get.to(() => AppEntryPoint());
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
                  'Reset Password',
                  style: AppText.heading1,
                ),
                AppSizes.hGap15,
                Text(
                  'At least 8 characters with uppercase and lowercase letters',
                  style: AppText.paragraph1,
                  textAlign: TextAlign.center,
                ),
                AppSizes.hGap40,
                /* <---- Form ----> */
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GronikTextField(
                          labelText: 'Old Password',
                          hintText: 'Password',
                          textInputType: TextInputType.emailAddress,
                          textEditingController: null,
                          suffxIcon: Icon(
                            Icons.remove_red_eye,
                            color: AppColors.NEUTRAL_50,
                          ),
                          isItPassWordBox: true,
                        ),
                        GronikTextField(
                          labelText: 'New Password',
                          hintText: 'Password',
                          textInputType: TextInputType.emailAddress,
                          textEditingController: null,
                          suffxIcon: Icon(
                            Icons.remove_red_eye,
                            color: AppColors.NEUTRAL_50,
                          ),
                          isItPassWordBox: true,
                        ),
                        GronikTextField(
                          labelText: 'Confirm Password',
                          hintText: 'Password',
                          textInputType: TextInputType.emailAddress,
                          textEditingController: null,
                          suffxIcon: Icon(
                            Icons.remove_red_eye,
                            color: AppColors.NEUTRAL_50,
                          ),
                          isItPassWordBox: true,
                        ),
                      ],
                    ),
                  ),
                ),
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
                onPressed: _onSave,
                child: Container(
                  width: Get.width * 0.8,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: AppColors.PRIMARY_COLOR,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Save Changes',
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
