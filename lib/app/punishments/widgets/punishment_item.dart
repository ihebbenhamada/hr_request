import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:request_hr/config/colors/colors.dart';

import '../../../config/image_urls/image_urls.dart';
import '../../../widgets/avatar-circle/avatar_circle.dart';

class PunishmentItem extends StatelessWidget {
  const PunishmentItem({
    super.key,
    required this.employeeName,
    required this.employeePunishment,
    required this.employeeImage,
    required this.date,
    required this.onClick,
    this.editable,
    this.type,
  });
  final String employeeName;
  final double employeePunishment;
  final String employeeImage;
  final String date;
  final bool? editable;
  final int? type;
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
            width: 153.w,
            height: 170.h,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AvatarCircle(
                      size: 66.h,
                      image: employeeImage,
                      iconSize: 14.h,
                    ),
                    (editable == true && type == null) ||
                            (editable == null && type != 2)
                        ? Image.asset(
                            AppImages.edit,
                            height: 22.5.h,
                            width: 22.5.h,
                          )
                        : const SizedBox()
                  ],
                ),
                4.h.verticalSpace,
                Text(
                  employeeName,
                  style: TextStyle(
                    color: AppColors.blueDark,
                    fontSize: 15.sp,
                    height: 1.2,
                  ),
                ),
                2.h.verticalSpace,
                Text(
                  employeePunishment.toString(),
                  style: TextStyle(
                    color: AppColors.redLight,
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
                color: type == 2
                    ? AppColors.redLight
                    : type == 0
                        ? AppColors.gray5
                        : AppColors.primary,
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
        ],
      ),
    );
  }
}
