import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../config/colors/colors.dart';
import '../../../../../config/image_urls/image_urls.dart';

class VacationInfoContainer extends StatelessWidget {
  const VacationInfoContainer({super.key});

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
                  'Vacations',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  '30 days on year',
                  style: TextStyle(
                    color: AppColors.blueDark,
                    fontSize: 14.sp,
                  ),
                ),
                10.h.verticalSpace,
                Text(
                  'Leave taken by the employee, the remaining leave, and the percentage',
                  style: TextStyle(
                    color: AppColors.blueDark,
                    fontSize: 12.sp,
                  ),
                ),
                17.h.verticalSpace,
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      width: 108,
                      height: 21.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.h),
                        border: Border.all(color: AppColors.primary),
                        color: AppColors.blueLight2,
                      ),
                      child: Center(
                        child: Text(
                          'Taken: 27',
                          style: TextStyle(
                            color: AppColors.blueDark,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 21.h,
                      height: 21.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.h),
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
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      width: 108,
                      height: 21.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.h),
                        color: AppColors.primary,
                      ),
                      child: Center(
                        child: Text(
                          'Left: 27',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 21.h,
                      height: 21.h,
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
            child: CircularPercentIndicator(
              radius: 48.0,
              lineWidth: 10.0,
              animation: true,
              percent: 0.25,
              center: Text(
                '25%',
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
        ],
      ),
    );
  }
}
