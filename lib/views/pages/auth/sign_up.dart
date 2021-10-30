import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../../widgets/text_field_custom.dart';
import '../../widgets/gronik_layout.dart';
import 'login.dart';
import '../../theme/text_theme.dart';

class SignUpScreen extends StatelessWidget {
  /* <---- Sign up ----> */
  _signUp() {
    Get.to(() => LoginScreen());
  }

  /* <---- Sign in ----> */
  _signIn() {
    Get.to(() => LoginScreen());
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
                  'Sign up',
                  style: AppText.heading1,
                ),
                AppSizes.hGap15,
                Text(
                  'Sign up with your email and password to continue',
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
                          labelText: 'Name',
                          hintText: 'Enter your full name',
                          textEditingController: null,
                        ),
                        AppSizes.hGap20,
                        GronikTextField(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          textInputType: TextInputType.emailAddress,
                          textEditingController: null,
                        ),
                        AppSizes.hGap20,
                        GronikTextField(
                          labelText: 'Password',
                          hintText: 'Enter a password',
                          isItPassWordBox: true,
                          textEditingController: null,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        /* <----------- Bottom Bar ------------> */
        bottomBar: SizedBox(),
      ),
      bottomNavigationBar: Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: _signUp,
              child: Container(
                width: Get.width * 0.8,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: AppColors.PRIMARY_COLOR,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Sign Up',
                  style: AppText.paragraph1.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            AppSizes.hGap10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?'),
                AppSizes.wGap10,
                InkWell(
                  onTap: _signIn,
                  child: Text(
                    'Sign in',
                    style: AppText.paragraph1
                        .copyWith(color: AppColors.PRIMARY_COLOR, fontSize: 14),
                  ),
                )
              ],
            ),
            AppSizes.hGap20,
          ],
        ),
      ),
    );
  }
}
