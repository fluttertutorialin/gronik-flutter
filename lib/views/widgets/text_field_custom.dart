import 'package:flutter/material.dart';
import '../theme/text_theme.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';

class GronikTextField extends StatelessWidget {
  const GronikTextField({
    Key? key,
    required this.labelText,
    this.hintText,
    this.textInputType,
    this.isItPassWordBox = false,
    this.textEditingController,
    this.suffxIcon,
    this.prefixIcon,
    this.onTap,
    this.marginLabelDisable = false,
    this.maxLines,
    this.enabled = true,
  });

  final String labelText;
  final String? hintText;
  final TextInputType? textInputType;
  final bool isItPassWordBox;
  final TextEditingController? textEditingController;
  final Icon? prefixIcon;
  final Icon? suffxIcon;
  final void Function()? onTap;
  final bool marginLabelDisable;
  final int? maxLines;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: marginLabelDisable ? 0 : 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          marginLabelDisable
              ? SizedBox()
              : Text(
                  '$labelText',
                  style: AppText.b1.copyWith(color: AppColors.NEUTRAL_50),
                ),
          AppSizes.hGap15,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.BACKGROUND_COLOR,
            ),
            child: TextField(
              enabled: enabled,
              onTap: onTap,
              controller: textEditingController,
              obscureText: isItPassWordBox,
              keyboardType: textInputType,
              cursorColor: AppColors.PRIMARY_COLOR,
              maxLines: maxLines ?? 1,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                hintText: hintText,
                hintStyle: TextStyle(
                  color: AppColors.PLACHOLDER,
                ),
                prefixIcon: prefixIcon,
                suffixIcon: suffxIcon,
                focusColor: AppColors.PRIMARY_COLOR,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
