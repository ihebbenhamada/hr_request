import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

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
  final String? time;
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
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 66.h,
                  height: 66.h,
                  decoration: const ShapeDecoration(
                    shape: OvalBorder(
                      side: BorderSide.none,
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Center(
                    child: Image.asset(
                      AppImages.signOutDrawer,
                      height: 28.h,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                Positioned(
                  left: Get.locale?.languageCode == 'en' ? 9.h : null,
                  right: Get.locale?.languageCode == 'ar' ? 9.h : null,
                  bottom: 0,
                  child: Image.asset(
                    AppImages.innTechLogo,
                    height: 14.h,
                    width: 14.h,
                  ),
                ),
                Image.asset(
                  AppImages.avatarCircle,
                  height: 66.h,
                  width: 66.h,
                  color: AppColors.primary,
                  matchTextDirection: true,
                ),
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
              workPlace,
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
                  width: 133,
                  decoration: BoxDecoration(
                    color: type == 0 ? AppColors.blueDark : AppColors.primary,
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
                      '$date / $time',
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
