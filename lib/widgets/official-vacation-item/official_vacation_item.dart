import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

import '../../config/colors/colors.dart';

class OfficialVacationItem extends StatelessWidget {
  const OfficialVacationItem({
    super.key,
    required this.title,
    required this.date,
  });

  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      margin: EdgeInsets.only(
        right: Get.locale?.languageCode == 'en' ? 15 : 0,
        left: Get.locale?.languageCode == 'ar' ? 15 : 0,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12.h),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          right: Get.locale?.languageCode == 'en' ? 4 : 12,
          left: Get.locale?.languageCode == 'en' ? 12 : 4,
          top: 6.h,
          bottom: 6.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title.tr,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16.sp,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  date.tr,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16.sp,
                  ),
                ),
                Container(
                  height: 28.h,
                  width: 28.h,
                  decoration: const ShapeDecoration(
                    shape: OvalBorder(),
                    color: AppColors.white,
                  ),
                  child: Center(
                    child: Image.asset(
                      AppImages.officialVacations,
                      height: 18.h,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
