import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_images.dart';
import '../../constants/app_sizes.dart';
import 'success_review_dialog.dart';
import '../theme/text_theme.dart';
import '../widgets/buttons.dart';
import '../widgets/text_field_custom.dart';

class AddReviewSheet extends StatelessWidget {
  const AddReviewSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
          Container(
            height: 5,
            width: Get.width * 0.15,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          AppSizes.hGap20,
          Text(
            'Rate And Review',
            style: AppText.heading2,
          ),
          Divider(),
          /* <---- Stars ----> */
          _ReviewStars(),
          /* <---- Image ----> */
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Images',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        height: 100,
                        width: 100,
                        child: Image.asset(AppImages.FRUIT_APPLE),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: AppColors.NEUTRAL_50.withOpacity(0.4),
                        ),
                        child: Icon(
                          Icons.image,
                          size: 30,
                          color: AppColors.NEUTRAL_50,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /* <---- FeedBack ----> */
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Feedback',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              GronikTextField(
                hintText: 'eg: I liked the experience',
                marginLabelDisable: true,
                labelText: '',
                textEditingController: null,
                maxLines: 3,
              ),
            ],
          ),
          AppSizes.hGap20,
          AppButton(
            width: Get.width * 0.8,
            label: 'Submit feedback',
            onTap: () {
              /* <---- Success Pop up ----> */
              Get.back();
              Get.dialog(SuccessReviewDialog());
            },
          ),
          AppSizes.hGap20,
        ],
      ),
    );
  }
}

class _ReviewStars extends StatelessWidget {
  const _ReviewStars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: Color(0xFFF2994A),
          size: 35,
        ),
        Icon(
          Icons.star,
          color: Color(0xFFF2994A),
          size: 35,
        ),
        Icon(
          Icons.star,
          color: Color(0xFFF2994A),
          size: 35,
        ),
        Icon(
          Icons.star,
          color: Color(0xFFF2994A),
          size: 35,
        ),
        Icon(
          Icons.star,
          color: AppColors.NEUTRAL_50,
          size: 35,
        ),
      ],
    );
  }
}
