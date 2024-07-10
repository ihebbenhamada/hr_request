import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../config/colors/colors.dart';
import '../../../../../config/image_urls/image_urls.dart';

class VacationInfoContainer extends StatelessWidget {
  const VacationInfoContainer({
    super.key,
    required this.vacationPercentage,
    required this.takenDays,
    required this.leftDays,
  });

  final RxDouble vacationPercentage;
  final RxDouble takenDays;
  final RxDouble leftDays;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 202.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'vacations'.tr,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  '30_year'.tr,
                  style: TextStyle(
                    color: AppColors.blueDark,
                    fontSize: 14.sp,
                  ),
                ),
                10.h.verticalSpace,
                Text(
                  'remaining_vacation'.tr,
                  style: TextStyle(
                    color: AppColors.blueDark,
                    fontSize: 12.sp,
                  ),
                ),
                17.h.verticalSpace,
                Stack(
                  alignment: Get.locale?.languageCode == 'en'
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  children: [
                    Obx(
                      () => Container(
                        width: 118,
                        height: 25.h,
                        padding: EdgeInsets.only(
                          left: Get.locale?.languageCode == 'en' ? 10 : 0,
                          right: Get.locale?.languageCode == 'ar' ? 10 : 0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.h),
                          border: Border.all(color: AppColors.primary),
                          color: AppColors.blueLight2,
                        ),
                        child: Center(
                          child: Text(
                            '${'taken'.tr}: ${takenDays.value}',
                            style: TextStyle(
                              color: AppColors.blueDark,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 25.h,
                      height: 25.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.h),
                        border: Border.all(color: AppColors.primary),
                        color: AppColors.white,
                      ),
                      child: Center(
                        child: Image.asset(
                          AppImages.vacationItem,
                          height: 9.5.h,
                        ),
                      ),
                    ),
                  ],
                ),
                6.h.verticalSpace,
                Stack(
                  alignment: Get.locale?.languageCode == 'en'
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  children: [
                    Obx(
                      () => Container(
                        width: 118,
                        height: 25.h,
                        padding: EdgeInsets.only(
                          left: Get.locale?.languageCode == 'en' ? 10 : 0,
                          right: Get.locale?.languageCode == 'ar' ? 10 : 0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.h),
                          color: AppColors.primary,
                        ),
                        child: Center(
                          child: Text(
                            '${'left'.tr}: ${leftDays.value}',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 25.h,
                      height: 25.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.h),
                        border: Border.all(color: AppColors.primary),
                        color: AppColors.white,
                      ),
                      child: Center(
                        child: Image.asset(
                          AppImages.vacationPro,
                          height: 9.5.h,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            child: Obx(
              () => CircularPercentIndicator(
                radius: 48.0,
                lineWidth: 10.0,
                animation: true,
                percent: vacationPercentage.value,
                center: Text(
                  '${vacationPercentage.value * 100}%',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 27.sp,
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                progressColor: AppColors.primary,
                backgroundColor: AppColors.blueLight1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
