import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:request_hr/config/colors/colors.dart';

import '../../../config/image_urls/image_urls.dart';

class TicketItem extends StatelessWidget {
  const TicketItem({
    super.key,
    required this.title,
    required this.date,
    required this.onClick,
    required this.type,
  });
  final String title;
  final String date;
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
            width: 114,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                9.h.verticalSpace,
                getIcon(),
                8.h.verticalSpace,
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.blueDark,
                    fontSize: 11.sp,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10.h,
            right: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: type == 0
                    ? AppColors.primary
                    : type == 1
                        ? AppColors.gray1
                        : AppColors.redLight,
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
              child: Text(
                date,
                style: TextStyle(
                  fontSize: 9.sp,
                  color: type == 1 ? AppColors.blueDark : AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getIcon() {
    return Container(
      height: 44.h,
      width: 44.h,
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
          type == 0
              ? AppImages.doubleCheck
              : type == 1
                  ? AppImages.progress
                  : AppImages.x,
          height: type == 0
              ? 11.5.h
              : type == 1
                  ? 25.h
                  : 19.h,
        ),
      ),
    );
  }
}
