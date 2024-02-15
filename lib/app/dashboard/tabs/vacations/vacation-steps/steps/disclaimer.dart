import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

class Disclaimer extends StatelessWidget {
  const Disclaimer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.h),
              color: AppColors.white.withOpacity(0.1),
            ),
            child: Column(
              children: [
                14.h.verticalSpace,
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.39,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            'Mohamed Gamal',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Job',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            'Senior front end developer',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                10.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.39,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Department',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            'It solutions',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Last day of work in',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            '20-10-2024',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                10.h.verticalSpace,
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reason for leaving',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.white,
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.white,
                        ),
                        keyboardType: TextInputType.number,
                        cursorColor: AppColors.white,
                        decoration: const InputDecoration(
                          isDense: true,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                        maxLines: 3,
                        autocorrect: false,
                        enableSuggestions: false,
                        enabled: true,
                        enableInteractiveSelection: true,
                      ),
                      const Divider(
                        height: 1,
                        color: AppColors.white,
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
                23.h.verticalSpace,
              ],
            ),
          ),
          31.h.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 88.h,
                height: 88.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.h),
                  color: AppColors.white.withOpacity(0.1),
                ),
                child: Column(
                  children: [
                    10.h.verticalSpace,
                    Text(
                      'Upload file',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.white,
                      ),
                    ),
                    13.h.verticalSpace,
                    Image.asset(
                      AppImages.upload,
                      height: 29,
                    )
                  ],
                ),
              ),
              15.horizontalSpace,
              Container(
                width: 88.h,
                height: 88.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.h),
                  color: AppColors.white.withOpacity(0.1),
                ),
                child: Column(
                  children: [
                    10.h.verticalSpace,
                    Text(
                      'Print',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.white,
                      ),
                    ),
                    13.h.verticalSpace,
                    Image.asset(
                      AppImages.print,
                      height: 29,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
