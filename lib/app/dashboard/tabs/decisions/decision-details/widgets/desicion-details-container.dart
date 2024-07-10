import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../config/colors/colors.dart';

class DecisionDetailsInput extends StatelessWidget {
  const DecisionDetailsInput({
    super.key,
    this.controller,
    required this.nbrLines,
    required this.icon,
    this.paddingTop,
    this.paddingBottom,
    this.paddingLeft,
    this.paddingRight,
    required this.hint,
    this.initialValue,
    this.enabled,
  });
  final TextEditingController? controller;
  final int nbrLines;
  final String icon;
  final String hint;
  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingLeft;
  final double? paddingRight;
  final String? initialValue;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 14.h,
            horizontal: 20.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22.h),
              bottomRight: Radius.circular(22.h),
              bottomLeft: Radius.circular(22.h),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x29000000),
                blurRadius: 3,
                offset: Offset(0, 3),
                spreadRadius: 0,
              )
            ],
          ),
          child: TextFormField(
            key: key,
            controller: controller,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.blueDark,
            ),
            keyboardType: TextInputType.multiline,
            maxLines: nbrLines,
            cursorColor: AppColors.gray1,
            initialValue: initialValue,
            decoration: InputDecoration(
              isDense: true,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(
                left: paddingLeft ?? 0,
                right: paddingRight ?? 0,
                top: paddingTop ?? 0,
                bottom: paddingBottom ?? 0,
              ),
              hintText: hint.tr,
              hintStyle: TextStyle(
                color: AppColors.gray,
                fontSize: 14.sp,
              ),
            ),
            autocorrect: false,
            enableSuggestions: false,
            enabled: enabled,
            enableInteractiveSelection: true,
          ),
        ),
        Positioned(
          right: Get.locale?.languageCode == 'en' ? 28 : null,
          left: Get.locale?.languageCode == 'ar' ? 28 : null,
          top: -32,
          child: Container(
            height: 55.h,
            width: 55.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(55.h),
              border: Border.all(color: AppColors.gray2, width: 5),
            ),
            child: Center(
              child: Image.asset(
                icon,
                height: 26.h,
              ),
            ),
          ),
        )
      ],
    );
  }
}
