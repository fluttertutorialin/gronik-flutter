import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../../widgets/gronik_layout.dart';
import '../../theme/text_theme.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GronikLayoutTwo(
        appBarTitle: 'Notifications',
        /* <---- Content ----> */
        content: Expanded(
          child: Container(
            width: Get.width,
            margin: EdgeInsets.only(top: 16, right: 16, left: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /* <---- Today ----> */
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /* <---- HeadLine ----> */
                      Text(
                        'Today',
                        style: AppText.paragraph1
                            .copyWith(color: AppColors.NEUTRAL_50),
                      ),
                      AppSizes.hGap10,
                      // Single Notification
                      SingleNotificationTile(
                        description:
                            'You order #2034784 is arrived Railstation by Leo Hunter',
                        time: '02:05 PM',
                      ),
                      SingleNotificationTile(
                        description:
                            'You received a payment of \$55.00 from Keith Cox',
                        time: '10:05 AM',
                      ),
                    ],
                  ),
                  Divider(),

                  /* <---- Yesterday ----> */
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /* <---- HeadLine ----> */
                      Text(
                        'Yesterday',
                        style: AppText.paragraph1
                            .copyWith(color: AppColors.NEUTRAL_50),
                      ),
                      AppSizes.hGap10,
                      // Single Notification
                      SingleNotificationTile(
                        description:
                            'You order #2034784 is arrived Railstation by Leo Hunter',
                        time: '02:05 PM',
                      ),
                      SingleNotificationTile(
                        description:
                            'Completed - Starbucks - Linh Nguyen has delivered your order at Starbucks Hanoi. Thank you for using Coody service.',
                        time: '02:05 PM',
                      ),
                    ],
                  ),
                  Divider(),
                  /* <---- Other Date ----> */
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /* <---- HeadLine ----> */
                      Text(
                        '07 Nov, 2020',
                        style: AppText.paragraph1
                            .copyWith(color: AppColors.NEUTRAL_50),
                      ),
                      AppSizes.hGap10,
                      // Single Notification
                      SingleNotificationTile(
                        description:
                            'Domino\'s - Buy 1 get 1 free - Buy 1 get 1 free for small sizes until May 30, 2020 when you order via Gronik',
                        time: '02:05 PM',
                      ),
                      SingleNotificationTile(
                        description:
                            'You order #2034784 is arrived Railstation by Leo Hunter',
                        time: '02:05 PM',
                      ),
                    ],
                  ),
                  Divider(),
                  /* <---- Other Date ----> */
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /* <---- HeadLine ----> */
                      Text(
                        '06 Nov, 2020',
                        style: AppText.paragraph1
                            .copyWith(color: AppColors.NEUTRAL_50),
                      ),
                      AppSizes.hGap10,
                      // Single Notification
                      SingleNotificationTile(
                        description:
                            'Domino\'s - Buy 1 get 1 free - Buy 1 get 1 free for small sizes until May 30, 2020 when you order via Gronik',
                        time: '02:05 PM',
                      ),
                      SingleNotificationTile(
                        description:
                            'You order #2034784 is arrived Railstation by Leo Hunter',
                        time: '02:05 PM',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        /* <---- Bottom Bar ----> */
        bottomAppBar: SizedBox(),
      ),
    );
  }
}

class SingleNotificationTile extends StatelessWidget {
  const SingleNotificationTile({
    Key? key,
    required this.description,
    required this.time,
  });

  final String description, time;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$description',
          ),
          AppSizes.hGap5,
          Text(
            '$time',
            style: AppText.paragraph1
                .copyWith(color: AppColors.NEUTRAL_50, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
