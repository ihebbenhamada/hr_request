import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/colors/colors.dart';

class DecisionDetailsInput extends StatelessWidget {
  const DecisionDetailsInput({
    super.key,
    required this.controller,
    required this.nbrLines,
    required this.icon,
    this.paddingTop,
    this.paddingBottom,
    this.paddingLeft,
    this.paddingRight,
    this.hint,
  });
  final TextEditingController controller;
  final int nbrLines;
  final String icon;
  final String? hint;
  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingLeft;
  final double? paddingRight;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            top: 14.h,
            bottom: 14.h,
            left: 20.h,
            right: 20.h,
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
                hintText: hint,
                hintStyle: TextStyle(
                  color: AppColors.gray,
                  fontSize: 14.sp,
                )),
            autocorrect: false,
            enableSuggestions: false,
            enabled: true,
            enableInteractiveSelection: true,
          ),
        ),
        Positioned(
          right: 28,
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
