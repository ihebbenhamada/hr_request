import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          height: 234.h,
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
                'Contract',
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
                'Start : 1/1/2023',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 10.h,
                ),
              ),
              3.h.verticalSpace,
              Text(
                'End : 1/1/2025',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 10.h,
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
                height: 234.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100.w,
                      height: 111.h,
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
                            'Vacations',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            '30 days on year',
                            style: TextStyle(
                              color: AppColors.blueDark,
                              fontSize: 10.sp,
                            ),
                          ),
                          9.h.verticalSpace,
                          CircularPercentIndicator(
                            radius: 17.0,
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
                          6.h.verticalSpace,
                          Text(
                            'Left 27',
                            style: TextStyle(
                              color: AppColors.blueDark,
                              fontSize: 12.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100.w,
                      height: 111.h,
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
                            'Indemnity',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            'Date entitlement\n19-20-2040',
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
                height: 234.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100.w,
                      height: 111.h,
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
                            'Ticket',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            'Has airline tickets?',
                            style: TextStyle(
                              color: AppColors.blueDark,
                              fontSize: 10.sp,
                            ),
                          ),
                          9.h.verticalSpace,
                          Image.asset(
                            AppImages.tick,
                            height: 31.h,
                          ),
                          12.h.verticalSpace,
                          Text(
                            'Yes',
                            style: TextStyle(
                              color: AppColors.blueDark,
                              fontSize: 12.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100.w,
                      height: 111.h,
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
                            ' Meetings',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            'Total of Meeting\n30',
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
