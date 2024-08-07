import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:request_hr/app/loan/main/models/loan_response.dart';

import '../../../../../config/colors/colors.dart';
import '../../../../../config/image_urls/image_urls.dart';

class LoanInfoContainer extends StatelessWidget {
  const LoanInfoContainer({super.key, required this.loanResponse});

  final LoanResponse loanResponse;
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
            width: 208.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'loan_year'.tr,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  'loans_requested'.tr,
                  style: TextStyle(
                    color: AppColors.blueDark,
                    fontSize: 14.sp,
                  ),
                ),
                17.h.verticalSpace,
                Stack(
                  alignment: Get.locale?.languageCode == 'en'
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  children: [
                    Container(
                      height: 22.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.h),
                        color: AppColors.primary,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: Get.locale?.languageCode == 'en' ? 25.h : 5.h,
                          right: Get.locale?.languageCode == 'en' ? 5.h : 25.h,
                        ),
                        child: Text(
                          '${'total'.tr}: ${getTotal(loanResponse.totalLoans ?? '0')}',
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
              percent: loanResponse.loansPercentage / 100,
              center: Text(
                '${loanResponse.loansPercentage.toStringAsFixed(1)}%',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 24.sp,
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

  String getTotal(String total) {
    if (total != "0") {
      String a = total.substring(0, total.indexOf("/")).replaceAll("٫", ".");
      String b = total
          .substring(total.indexOf("/") + 1, total.length)
          .replaceAll("٫", ".");
      if (double.parse(a) >= 1000) {
        a = "${(double.parse(a) / 1000).toStringAsFixed(2)}${'k'.tr}";
      }
      if (double.parse(b) >= 1000) {
        b = "${(double.parse(b) / 1000).toStringAsFixed(2)}${'k'.tr}";
      }
      return '$a / $b';
    }
    return "0/0";
  }
}
