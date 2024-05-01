import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../config/colors/colors.dart';

class CategoriesFilter extends StatelessWidget {
  const CategoriesFilter({
    super.key,
    required this.onSelectFilter,
    required this.selectedFilter,
  });

  final void Function(int index) onSelectFilter;
  final RxInt selectedFilter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(22.h),
        boxShadow: const [
          BoxShadow(
            color: Color(0x29000000),
            blurRadius: 3,
            offset: Offset(0, 3),
            spreadRadius: 0,
          )
        ],
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => onSelectFilter(0),
              child: Container(
                width: 62.w,
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  color: selectedFilter.value == 0
                      ? AppColors.gray4
                      : AppColors.white,
                  borderRadius: BorderRadius.circular(22.h),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 15.h,
                      width: 15.h,
                      decoration: const ShapeDecoration(
                        shape: OvalBorder(
                          side: BorderSide(color: AppColors.gray3),
                        ),
                        color: AppColors.white,
                      ),
                    ),
                    5.horizontalSpace,
                    Text(
                      'All',
                      style: TextStyle(
                        color: AppColors.blueDark,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => onSelectFilter(1),
              child: Container(
                width: 96.w,
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  color: selectedFilter.value == 1
                      ? AppColors.gray4
                      : AppColors.white,
                  borderRadius: BorderRadius.circular(22.h),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 15.h,
                      width: 15.h,
                      decoration: const ShapeDecoration(
                        shape: OvalBorder(
                          side: BorderSide(color: AppColors.gray3),
                        ),
                        color: AppColors.gray5,
                      ),
                    ),
                    5.horizontalSpace,
                    Text(
                      'pending'.tr,
                      style: TextStyle(
                        color: AppColors.blueDark,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => onSelectFilter(2),
              child: Container(
                width: 96.w,
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  color: selectedFilter.value == 2
                      ? AppColors.gray4
                      : AppColors.white,
                  borderRadius: BorderRadius.circular(22.h),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 15.h,
                      width: 15.h,
                      decoration: const ShapeDecoration(
                        shape: OvalBorder(),
                        color: AppColors.primary,
                      ),
                    ),
                    5.horizontalSpace,
                    Text(
                      'Approved',
                      style: TextStyle(
                        color: AppColors.blueDark,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => onSelectFilter(3),
              child: Container(
                width: 86.w,
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  color: selectedFilter.value == 3
                      ? AppColors.gray4
                      : AppColors.white,
                  borderRadius: BorderRadius.circular(22.h),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 15.h,
                      width: 15.h,
                      decoration: const ShapeDecoration(
                        shape: OvalBorder(),
                        color: AppColors.redLight,
                      ),
                    ),
                    5.horizontalSpace,
                    Text(
                      'cancel'.tr,
                      style: TextStyle(
                        color: AppColors.blueDark,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
