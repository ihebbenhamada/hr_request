import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/colors/colors.dart';

class FinalExitApproval extends StatefulWidget {
  FinalExitApproval({
    super.key,
    required this.firstStepEmployeeName,
    required this.firstStepCreationDate,
    required this.firstStepLastWorkingDayDate,
    required this.firstStepPhone,
    required this.firstStepMobile,
    required this.firstStepAddress,
  });
  final RxString firstStepEmployeeName;
  final RxString firstStepCreationDate;
  final RxString firstStepLastWorkingDayDate;
  final RxString firstStepPhone;
  final RxString firstStepMobile;
  final RxString firstStepAddress;

  @override
  State<FinalExitApproval> createState() => _FinalExitApprovalState();
}

class _FinalExitApprovalState extends State<FinalExitApproval> {
  late TextEditingController phone;
  late TextEditingController mobile;
  late TextEditingController address;

  @override
  void initState() {
    // TODO: implement initState
    phone = TextEditingController(text: widget.firstStepPhone.value);
    mobile = TextEditingController(text: widget.firstStepMobile.value);
    address = TextEditingController(text: widget.firstStepAddress.value);
    super.initState();
  }

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
                  widget.firstStepEmployeeName.value,
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
                            widget.firstStepLastWorkingDayDate.value
                                    .substring(0, 10) ??
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
                            widget.firstStepCreationDate.value.substring(0, 10),
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
