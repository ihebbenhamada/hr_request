import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

import '../avatar-circle/avatar_circle.dart';

class DecisionGridItem extends StatelessWidget {
  const DecisionGridItem({
    super.key,
    required this.employeeName,
    required this.employeePosition,
    required this.employeeImage,
    required this.date,
    required this.onClick,
    this.editable,
    this.type,
  });
  final String employeeName;
  final String employeePosition;
  final String employeeImage;
  final String date;
  final bool? editable;
  final int? type;
  final void Function() onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 175.w,
        height: 192.h,
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
                  image: employeeImage.contains("http")
                      ? employeeImage
                      : AppImages.profile,
                  iconSize: 14.h,
                  isNetworkImage: employeeImage.contains("http"),
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
                fontSize: 16.sp,
                height: 1.2,
              ),
            ),
            2.h.verticalSpace,
            Text(
              employeePosition,
              style: TextStyle(
                color: AppColors.blueDark,
                fontSize: 14.sp,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Get.locale?.languageCode == 'en'
                    ? Alignment.bottomRight
                    : Alignment.bottomLeft,
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
            ),
            9.h.verticalSpace,
          ],
        ),
      ),
    );
  }
}
