/* <----------- Buttons ------------> */
import 'package:flutter/material.dart';
import 'package:gronik/constants/app_colors.dart';
import 'package:gronik/views/theme/text_theme.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.width,
    this.height,
    this.color = AppColors.PRIMARY_COLOR,
  });
  final String label;
  final void Function()? onTap;
  final double? width;
  final double? height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: color,
            width: 2,
          ),
        ),
        child: Text(
          '$label',
          style: AppText.paragraph1.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

// Outline button
class AppButtonOutline extends StatelessWidget {
  const AppButtonOutline({
    Key? key,
    required this.label,
    required this.onTap,
    this.width,
    this.height,
  });

  final String label;
  final void Function() onTap;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.PRIMARY_COLOR,
              width: 2,
            )),
        child: Text(
          '$label',
          style: AppText.paragraph1.copyWith(color: AppColors.PRIMARY_COLOR),
        ),
      ),
    );
  }
}
