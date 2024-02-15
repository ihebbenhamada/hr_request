import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/colors/colors.dart';
import '../../config/theme/theme_controller.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.text,
    required this.onClick,
    this.enabled = true,
    this.isPrimary = true,
    this.height,
    this.color,
  });

  final String text;
  final double? height;
  final void Function() onClick;
  final bool? enabled;
  final bool isPrimary;
  final Color? color;
  final ThemeController _themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Container(
        height: height ?? 58.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color ??
              (isPrimary
                  ? enabled!
                      ? AppColors.blueDark
                      : AppColors.primaryDisabled
                  : _themeController.isDarkMode.value
                      ? AppColors.dark1
                      : AppColors.white),
          borderRadius: BorderRadius.circular(29),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18.sp,
              color: isPrimary ? AppColors.white : AppColors.blueDark,
            ),
          ),
        ),
      ),
    );
  }
}
