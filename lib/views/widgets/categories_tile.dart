import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';
import '../theme/text_theme.dart';

class CategoriesTile extends StatelessWidget {
  const CategoriesTile({
    Key? key,
    required this.categoryName,
    required this.imageLocation,
    this.onTap,
  });

  final String categoryName;
  final String imageLocation;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            /* <---- Image ----> */
            Container(
              width: 100,
              height: 100,
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 21),
              decoration: BoxDecoration(
                color: AppColors.APP_GREEN,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(imageLocation),
            ),
            /* <---- Text ----> */
            AppSizes.hGap5,
            Text(
              '$categoryName',
              style: AppText.paragraph1.copyWith(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
