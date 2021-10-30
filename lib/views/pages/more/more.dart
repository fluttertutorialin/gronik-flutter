import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import 'notifications.dart';
import 'contact.dart';
import 'faq.dart';
import '../../theme/text_theme.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Column(
        children: [
          /* <----- Appbar -----> */
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'More',
                  style: AppText.heading1.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          AppSizes.hGap20,

          /* <---- Main Container ----> */
          Expanded(
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: Color(0xFFF4F5F7),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Column(
                children: [
                  /* <---- Settings and option ----> */
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Column(
                        children: [
                          /* <---- Notification ----> */
                          ListTile(
                              onTap: () {
                                Get.to(() => NotificationScreen());
                              },
                              leading: Icon(
                                Icons.notifications,
                                color: AppColors.NEUTRAL_50,
                              ),
                              title: Text('Notification'),
                              trailing: CupertinoSwitch(
                                activeColor: AppColors.PRIMARY_COLOR,
                                onChanged: (value) {},
                                value: true,
                              )),
                          Divider(),
                          /* <---- Contact us ----> */
                          ListTile(
                            onTap: () {
                              Get.to(() => ContactScreen());
                            },
                            leading: Icon(
                              Icons.message,
                              color: AppColors.NEUTRAL_50,
                            ),
                            title: Text('Contact Us'),
                          ),
                          Divider(),
                          /* <---- Privacy ----> */
                          ListTile(
                            onTap: () {},
                            leading: Icon(
                              Icons.lock,
                              color: AppColors.NEUTRAL_50,
                            ),
                            title: Text('Privacy'),
                          ),
                          Divider(),
                          /* <---- FAQs ----> */
                          ListTile(
                            onTap: () {
                              Get.to(() => FaqScreen());
                            },
                            leading: Icon(
                              Icons.help_outline,
                              color: AppColors.NEUTRAL_50,
                            ),
                            title: Text('FAQs'),
                          ),
                          Divider(),
                          /* <---- Rate Us ----> */
                          ListTile(
                            onTap: () {},
                            leading: Icon(
                              Icons.star,
                              color: AppColors.NEUTRAL_50,
                            ),
                            title: Text('Rate us'),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
