/* <---- Menu Item ----> */

import 'package:flutter/material.dart';
import 'package:gronik/views/theme/text_theme.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.icon,
    required this.itemName,
    this.active = false,
    required this.onTap,
  });

  final String icon;
  final String itemName;
  final bool active;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 24,
                width: 24,
                child: Image.asset(
                  '$icon',
                  color: active ? Colors.white : Colors.white.withOpacity(0.6),
                ),
              ),
              Text(
                '$itemName',
                style: AppText.paragraph1.copyWith(
                  fontSize: 12,
                  color: active ? Colors.white : Colors.white.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
