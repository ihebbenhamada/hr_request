import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:request_hr/config/colors/colors.dart';

import '../../../config/image_urls/image_urls.dart';

class LoanItem extends StatelessWidget {
  const LoanItem({
    super.key,
    required this.title,
    required this.cost,
    required this.icon,
    required this.date,
    required this.onClick,
    required this.editable,
    required this.type,
  });
  final String title;
  final double cost;
  final String icon;
  final String date;
  final bool editable;
  final int type;
  final void Function() onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: 120,
            height: 140.h,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: ShapeDecoration(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x29000000),
                  blurRadius: 3,
                  offset: Offset(0, 3),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                9.h.verticalSpace,
                Align(alignment: Alignment.center, child: getIcon()),
                4.h.verticalSpace,
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.blueDark,
                    fontSize: 16.sp,
                    height: 1.2,
                  ),
                ),
                2.h.verticalSpace,
                Text(
                  cost.toString(),
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 14.sp,
                  ),
                ),
                9.h.verticalSpace,
              ],
            ),
          ),
          Positioned(
            bottom: -12.h,
            right: 11,
            child: Container(
              height: 24.h,
              width: 80,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x29000000),
                    blurRadius: 3,
                    offset: Offset(0, 3),
                    spreadRadius: 0,
                  )
                ],
              ), // Customize the color
              child: Center(
                child: Text(
                  date,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 9.h,
            right: 9.h,
            child: editable
                ? Image.asset(
                    AppImages.edit,
                    height: 22.5.h,
                    width: 22.5.h,
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget getIcon() {
    return Container(
      height: 55.h,
      width: 55.h,
      decoration: ShapeDecoration(
        color: type == 0
            ? AppColors.primary
            : type == 1
                ? AppColors.gray1
                : AppColors.redLight,
        shape: const OvalBorder(),
      ),
      child: Center(
        child: Image.asset(
          icon,
          height: type == 0
              ? 14.5.h
              : type == 1
                  ? 31.5.h
                  : 19.h,
        ),
      ),
    );
  }
}
