import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'success_card_dialog.dart';
import '../../constants/app_defaults.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';
import '../pages/cart_checkout/scan_card.dart';
import '../theme/text_theme.dart';
import '../widgets/buttons.dart';
import '../widgets/text_field_custom.dart';

class AddACardSheet extends StatelessWidget {
  const AddACardSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppDefaults.defaultBottomSheetRadius,
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
            'Add a card',
            style: AppText.heading2,
          ),
          Divider(),
          /* <---- Card Form ----> */
          GronikTextField(
            hintText: 'Your card number',
            labelText: '',
            textEditingController: null,
            prefixIcon: Icon(
              Icons.credit_card,
              color: AppColors.PRIMARY_COLOR,
            ),
            suffxIcon: Icon(
              Icons.check_box,
              color: AppColors.PRIMARY_COLOR,
            ),
            marginLabelDisable: true,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                Expanded(
                  child: GronikTextField(
                    hintText: 'MM/YY',
                    labelText: '',
                    textEditingController: null,
                    marginLabelDisable: true,
                  ),
                ),
                AppSizes.wGap10,
                Expanded(
                  child: GronikTextField(
                    hintText: 'CVC',
                    labelText: '',
                    textEditingController: null,
                    marginLabelDisable: true,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppButton(
                  label: 'Add New Card',
                  onTap: () {
                    /* <---- Success Pop up ----> */
                    Get.back(result: true);
                    Get.dialog(SuccessCardDialog());
                  },
                ),
              ),
              AppSizes.wGap10,
              Expanded(
                child: AppButtonOutline(
                  label: 'Scan Card',
                  onTap: () {
                    /* <---- Go to scan card screen ----> */
                    Get.back();
                    Get.to(() => ScanCardScreen());
                  },
                ),
              ),
            ],
          ),
          AppSizes.hGap20,
        ],
      ),
    );
  }
}
