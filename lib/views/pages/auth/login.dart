import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_sizes.dart';
import '../../widgets/text_field_custom.dart';
import '../../widgets/gronik_layout.dart';
import 'sign_up.dart';
import 'password_recovery.dart';
import '../home_products/entrypoint.dart';
import '../../../constants/app_colors.dart';
import '../../theme/text_theme.dart';

class LoginScreen extends StatelessWidget {
  /* <---- User clicked sign in button ----> */
  _onSignIn() {
    Get.to(() => AppEntryPoint());
  }

  /* <---- User clicked Sign up button ----> */
  _onSignUp() {
    Get.to(() => SignUpScreen());
  }

  /* <---- User clicked forget password button ----> */
  _onForgotPass() {
    Get.to(() => PasswordRecovery());
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
                  'Sign in',
                  style: AppText.heading1,
                ),
                AppSizes.hGap15,
                Text(
                  'Sign in with your email and password to continue',
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
                          labelText: 'Email\/Phone Number',
                          hintText: 'Enter email or phone number',
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
                        AppSizes.hGap15,
                        /* <---- Remember me ----> */
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: AppColors.NEUTRAL_50,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                AppSizes.wGap5,
                                Text(
                                  'Remember me',
                                  style: AppText.paragraph1
                                      .copyWith(color: AppColors.NEUTRAL_50),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: _onForgotPass,
                              child: Text(
                                'Forgot password ?',
                                style: AppText.paragraph1.copyWith(
                                    color: AppColors.APP_RED, fontSize: 14),
                              ),
                            )
                          ],
                        )
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
        padding: EdgeInsets.symmetric(vertical: 20),
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
              onPressed: _onSignIn,
              child: Container(
                width: Get.width * 0.8,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: AppColors.PRIMARY_COLOR,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Sign in',
                  style: AppText.paragraph1.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            AppSizes.hGap10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don’t have any account?'),
                AppSizes.wGap10,
                InkWell(
                  onTap: _onSignUp,
                  child: Text(
                    'Sign up',
                    style: AppText.paragraph1
                        .copyWith(color: AppColors.PRIMARY_COLOR, fontSize: 14),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
