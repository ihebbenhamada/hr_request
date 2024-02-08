import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/colors/colors.dart';

class DecisionDetailsContainer extends StatelessWidget {
  const DecisionDetailsContainer({
    super.key,
    required this.text,
    required this.icon,
    this.paddingTop,
    this.paddingBottom,
    this.paddingLeft,
    this.paddingRight,
  });
  final String text;
  final String icon;
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
            top: paddingTop ?? 14.h,
            bottom: paddingBottom ?? 14.h,
            left: paddingLeft ?? 20.h,
            right: paddingRight ?? 20.h,
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
          child: Text(
            text,
            style: TextStyle(
              height: 1.3,
              color: AppColors.blueDark,
              fontSize: 14.sp,
            ),
          ),
        ),
        Positioned(
          right: 28,
          top: -28,
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
