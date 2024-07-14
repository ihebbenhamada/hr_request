import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/final_exit/main/controllers/final_exit_controller.dart';
import 'package:request_hr/config/colors/colors.dart';

class FinalExitApproval extends StatelessWidget {
  const FinalExitApproval({
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
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 11.h),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.h),
              ),
              color: AppColors.white.withOpacity(0.1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'i_admit'.tr,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.white,
                    ),
                    controller:
                        finalExitController.employeeNameTextEditingController,
                    keyboardType: TextInputType.number,
                    cursorColor: AppColors.white,
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    autocorrect: false,
                    enableSuggestions: false,
                    enabled: true,
                    autofocus: true,
                    enableInteractiveSelection: true,
                  ),
                ),
                5.h.verticalSpace,
                Obx(
                  () => Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'end_working'.tr,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () =>
                                finalExitController.selectDate(context, 'end'),
                            child: Text(
                              finalExitController.endWorkingDate.value,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      43.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'adopted_from'.tr,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => finalExitController.selectDate(
                                context, 'adopted'),
                            child: Text(
                              finalExitController.adoptedFromDate.value,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                5.h.verticalSpace,
                Text(
                  'final_exit_desc'.tr,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          28.h.verticalSpace,
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.h),
              ),
              color: AppColors.white.withOpacity(0.1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                14.h.verticalSpace,
                Text(
                  'holder'.tr,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.white,
                  ),
                ),
                14.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.38,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'telephone'.tr,
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
                                finalExitController.phoneTextEditingController,
                            keyboardType: TextInputType.number,
                            cursorColor: AppColors.white,
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              focusedBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                            autocorrect: false,
                            enableSuggestions: false,
                            enabled: true,
                            enableInteractiveSelection: true,
                          ),
                          5.h.verticalSpace,
                          const Divider(
                            height: 1,
                            color: AppColors.white,
                            thickness: 1,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.38,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'phone_number'.tr,
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
                                finalExitController.mobileTextEditingController,
                            keyboardType: TextInputType.number,
                            cursorColor: AppColors.white,
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              focusedBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                            autocorrect: false,
                            enableSuggestions: false,
                            enabled: true,
                            enableInteractiveSelection: true,
                          ),
                          5.h.verticalSpace,
                          const Divider(
                            height: 1,
                            color: AppColors.white,
                            thickness: 1,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                5.h.verticalSpace,
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'address'.tr,
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
                            finalExitController.addressTextEditingController,
                        keyboardType: TextInputType.number,
                        cursorColor: AppColors.white,
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                        autocorrect: false,
                        enableSuggestions: false,
                        enabled: true,
                        enableInteractiveSelection: true,
                      ),
                      5.h.verticalSpace,
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
        ],
      ),
    );
  }
}
