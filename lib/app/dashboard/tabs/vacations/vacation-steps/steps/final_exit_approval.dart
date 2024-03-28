import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-steps/main/model/get_create_first_step.dart';
import 'package:request_hr/config/colors/colors.dart';

class FinalExitApproval extends StatelessWidget {
  const FinalExitApproval({
    super.key,
    required this.firstStepData,
    required this.phoneController,
    required this.mobileController,
    required this.addressController,
  });

  final Rx<GetCreateFirstStep> firstStepData;
  final TextEditingController phoneController;
  final TextEditingController mobileController;
  final TextEditingController addressController;

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
                  'I Admit',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  firstStepData.value.employeeName ?? "",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.white,
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
                            'End of working day',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            firstStepData.value.lastWorkingDayDate
                                    ?.substring(0, 10) ??
                                '',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                      43.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Adopted from',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            firstStepData.value.creationDate.substring(0, 10),
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                5.h.verticalSpace,
                Text(
                  'I pledge to sign below to pay the phone, water and lighting bills, as well as any financial obligations, such as advances,etc , to Al-Ansari Specialized Hospital',
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
                  'Data for the holder of the leave in the home country',
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
                            'Telephone',
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
                            controller: phoneController,
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
                            'Phone Number',
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
                            controller: mobileController,
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
                        'Address',
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
                        controller: addressController,
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
