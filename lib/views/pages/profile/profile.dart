import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_images.dart';
import '../auth/login.dart';
import '../../../constants/app_sizes.dart';
import '../../widgets/gronik_layout.dart';
import 'account_info.dart';
import 'password.dart';
import 'payment.dart';
import 'address.dart';
import 'refer.dart';
import '../../../constants/app_colors.dart';
import '../../widgets/buttons.dart';
import '../../theme/text_theme.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GronikLayoutTwo(
        appBarTitle: 'Profile',
        content: Expanded(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /* <---- Image and info ----> */
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: Get.width * 0.3,
                          child: Hero(
                            tag: 'profile',
                            child: Image.asset(AppImages.PROFILE_USER),
                          ),
                        ),
                        AppSizes.hGap15,
                        Text(
                          'Lakhani Kamlesh',
                          style: AppText.heading1.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        AppSizes.hGap5,
                        Text(
                          'kamal.lakhani56@gmail.com',
                          style: TextStyle(
                            color: AppColors.NEUTRAL_50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  /* <---- Menu ----> */
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      children: [
                        /* <---- Account info ----> */
                        ListTile(
                          visualDensity: VisualDensity(horizontal: -4),
                          onTap: () {
                            Get.to(() => AccountInfoScreen());
                          },
                          leading: Container(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                              AppImages.ICON_PROFILE_USER,
                            ),
                          ),
                          title: Text('Account information'),
                        ),
                        Divider(),
                        /* <---- Password ----> */
                        ListTile(
                          visualDensity: VisualDensity(horizontal: -4),
                          onTap: () {
                            Get.to(() => PasswordChangeScreen());
                          },
                          leading: Container(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                              AppImages.ICON_PROFILE_LOCK,
                            ),
                          ),
                          title: Text('Password'),
                        ),
                        Divider(),
                        /* <---- Payment Method ----> */
                        ListTile(
                          visualDensity: VisualDensity(horizontal: -4),
                          onTap: () {
                            Get.to(() => PaymentListScreen());
                          },
                          leading: Container(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                              AppImages.ICON_PROFILE_CARD,
                            ),
                          ),
                          title: Text('Payment Method'),
                        ),
                        Divider(),
                        /* <---- Delivery Address ----> */
                        ListTile(
                          visualDensity: VisualDensity(horizontal: -4),
                          onTap: () {
                            Get.to(() => AddressList());
                          },
                          leading: Container(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                              AppImages.ICON_PROFILE_MARKER,
                            ),
                          ),
                          title: Text('Delivery Address'),
                        ),
                        Divider(),
                        /* <---- Refer ----> */
                        ListTile(
                          visualDensity: VisualDensity(horizontal: -4),
                          onTap: () {
                            Get.to(() => ReferScreen());
                          },
                          leading: Container(
                              width: 24,
                              height: 24,
                              child: Image.asset(
                                AppImages.ICON_PROFILE_AT,
                              )),
                          title: Text('Refer Friends'),
                        ),
                      ],
                    ),
                  ),
                  /* <---- LogOut ----> */
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: AppButton(
                      label: 'Logout',
                      onTap: () {
                        Get.offAll(() => LoginScreen());
                      },
                      color: Color(0xFFEB5757),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
