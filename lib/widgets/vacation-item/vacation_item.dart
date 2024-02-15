import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/colors/colors.dart';
import '../../config/image_urls/image_urls.dart';

class VacationItem extends StatelessWidget {
  const VacationItem({
    super.key,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.icon,
    required this.withAlert,
    required this.color,
    required this.iconHeight,
    required this.onClick,
  });

  final String title;
  final String startDate;
  final String endDate;
  final String icon;
  final Color color;
  final bool withAlert;
  final double iconHeight;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 130,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(13.h),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x29000000),
                  blurRadius: 3,
                  offset: Offset(0, 3),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 55.h,
                      width: 55.h,
                      decoration: ShapeDecoration(
                        color: color,
                        shape: const OvalBorder(),
                      ),
                      child: Center(
                        child: Image.asset(
                          icon,
                          height: iconHeight.h,
                        ),
                      ),
                    ),
                  ),
                  9.h.verticalSpace,
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.blueDark,
                      fontSize: 14.sp,
                    ),
                  ),
                  9.h.verticalSpace,
                  Text(
                    startDate,
                    style: TextStyle(
                      color: AppColors.blueDark,
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    endDate,
                    style: TextStyle(
                      color: AppColors.blueDark,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          withAlert
              ? Positioned(
                  left: 13,
                  top: -17.h,
                  child: Container(
                    height: 34.h,
                    width: 34.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(34.h),
                      border: Border.all(color: AppColors.gray2, width: 3),
                    ),
                    child: Center(
                      child: Image.asset(
                        AppImages.redAlert,
                        height: 16.h,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          Positioned(
            right: 8,
            top: 10.h,
            child: Image.asset(
              AppImages.edit,
              height: 19.h,
            ),
          ),
        ],
      ),
    );
  }
}
