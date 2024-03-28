import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../config/colors/colors.dart';
import '../../../../../config/image_urls/image_urls.dart';

class VacationOfficialInfoContainer extends StatelessWidget {
  const VacationOfficialInfoContainer({
    super.key,
    required this.nextVacation,
  });
  final RxString nextVacation;

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
                  'Official vacations',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  '20 days on year',
                  style: TextStyle(
                    color: AppColors.blueDark,
                    fontSize: 14.sp,
                  ),
                ),
                10.h.verticalSpace,
                Text(
                  'The official leaves that the employee will take without deducting them from his annual leave',
                  style: TextStyle(
                    color: AppColors.blueDark,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Image.asset(
                AppImages.officialVacations,
                height: 60.3.h,
              ),
              6.h.verticalSpace,
              Text(
                'Next Vacation',
                style: TextStyle(
                  color: AppColors.blueDark,
                  fontSize: 14.sp,
                ),
              ),
              Obx(
                () => Text(
                  nextVacation.value,
                  style: TextStyle(
                    color: AppColors.blueDark,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
