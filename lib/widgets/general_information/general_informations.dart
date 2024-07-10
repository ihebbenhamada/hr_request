import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

class GeneralInformation extends StatelessWidget {
  const GeneralInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 236.h,
          width: 140.w,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(21),
            boxShadow: const [
              BoxShadow(
                color: Color(0x29000000),
                blurRadius: 3,
                offset: Offset(0, 3),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              21.h.verticalSpace,
              Text(
                'contract'.tr,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16.sp,
                ),
              ),
              25.h.verticalSpace,
              CircularPercentIndicator(
                radius: 45.0,
                lineWidth: 10.0,
                animation: true,
                percent: 0.5,
                center: Text(
                  '50%',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16.sp,
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                progressColor: AppColors.white,
                backgroundColor: AppColors.blueLight,
              ),
              34.h.verticalSpace,
              Text(
                '${'start'.tr} : 1/1/2023',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 10.sp,
                ),
              ),
              3.h.verticalSpace,
              Text(
                '${'end'.tr} : 1/1/2025',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
        ),
        10.horizontalSpace,
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 236.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100.w,
                      height: 113.h,
                      decoration: ShapeDecoration(
                        color: Colors.white,
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
                        children: [
                          7.h.verticalSpace,
                          Text(
                            'vacations'.tr,
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            '30_year'.tr,
                            style: TextStyle(
                              color: AppColors.blueDark,
                              fontSize: 10.sp,
                            ),
                          ),
                          4.h.verticalSpace,
                          CircularPercentIndicator(
                            radius: 16.0,
                            lineWidth: 4.0,
                            animation: true,
                            percent: 0.25,
                            center: Text(
                              '25%',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 10.sp,
                              ),
                            ),
                            circularStrokeCap: CircularStrokeCap.butt,
                            progressColor: AppColors.primary,
                            backgroundColor: AppColors.blueLight1,
                          ),
                          5.h.verticalSpace,
                          Text(
                            '${'left'.tr} 27',
                            style: TextStyle(
                              color: AppColors.blueDark,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100.w,
                      height: 113.h,
                      decoration: ShapeDecoration(
                        color: Colors.white,
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
                        children: [
                          7.h.verticalSpace,
                          Text(
                            'indemnity'.tr,
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            '${'date_entitlement'.tr}\n19-20-2040',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.blueDark,
                              fontSize: 10.sp,
                            ),
                          ),
                          12.h.verticalSpace,
                          Image.asset(
                            AppImages.indemnity,
                            height: 34.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 236.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100.w,
                      height: 113.h,
                      decoration: ShapeDecoration(
                        color: Colors.white,
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
                        children: [
                          7.h.verticalSpace,
                          Text(
                            'ticket'.tr,
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            'has_tickets'.tr,
                            style: TextStyle(
                              color: AppColors.blueDark,
                              fontSize: 10.sp,
                            ),
                          ),
                          4.h.verticalSpace,
                          Image.asset(
                            AppImages.tick,
                            height: 31.h,
                          ),
                          5.h.verticalSpace,
                          Text(
                            'yes'.tr,
                            style: TextStyle(
                              color: AppColors.blueDark,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100.w,
                      height: 113.h,
                      decoration: ShapeDecoration(
                        color: Colors.white,
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
                        children: [
                          7.h.verticalSpace,
                          Text(
                            'meetings'.tr,
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            '${'total_meetings'.tr}\n30',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.blueDark,
                              fontSize: 10.sp,
                            ),
                          ),
                          12.h.verticalSpace,
                          Image.asset(
                            AppImages.meeting,
                            height: 34.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
