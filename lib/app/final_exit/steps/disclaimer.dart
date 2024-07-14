import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/final_exit/main/controllers/final_exit_controller.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

class Disclaimer extends StatelessWidget {
  const Disclaimer({
    super.key,
    required this.finalExitController,
  });

  final FinalExitController finalExitController;

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.39,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'name'.tr,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            finalExitController
                                .thirdStepData.value.employeeName,
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
                            'job'.tr,
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
                            controller: finalExitController
                                .jobNameTextEditingController,
                            cursorColor: AppColors.white,
                            decoration: const InputDecoration(
                              isDense: true,
                              focusedBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                            maxLines: 1,
                            autocorrect: false,
                            enableSuggestions: false,
                            enabled: true,
                            enableInteractiveSelection: true,
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
                            'depart'.tr,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            finalExitController
                                .thirdStepData.value.departmentName,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Obx(
                      () => Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'last_working_day'.tr,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => finalExitController.selectDate(
                                  context, 'thirdStep'),
                              child: Text(
                                finalExitController
                                    .lastWorkingDateThirdStep.value
                                    .substring(0, 10),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
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
                        'reason_for_leaving'.tr,
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
                        controller:
                            finalExitController.reasonTextEditingController,
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
                      'upload_file'.tr,
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
                      'print'.tr,
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
