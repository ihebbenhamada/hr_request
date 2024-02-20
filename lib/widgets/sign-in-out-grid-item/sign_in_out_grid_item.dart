import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

import '../avatar-circle/avatar_circle.dart';

class SignInOutGridItem extends StatelessWidget {
  const SignInOutGridItem({
    super.key,
    required this.employeeName,
    required this.workPlace,
    required this.date,
    required this.time,
    required this.onClick,
    this.type,
  });
  final String employeeName;
  final String workPlace;
  final String date;
  final bool? time;
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
            AvatarCircle(
              size: 66.h,
              image: AppImages.signOutDrawer,
              iconSize: 14.h,
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
              workPlace,
              style: TextStyle(
                color: AppColors.blueDark,
                fontSize: 14.sp,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
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
                      '$time / $date',
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
