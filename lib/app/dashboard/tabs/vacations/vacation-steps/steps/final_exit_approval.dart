import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:request_hr/config/colors/colors.dart';

class FinalExitApproval extends StatelessWidget {
  const FinalExitApproval({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                'mohamed Gamal Kotb',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.white,
                ),
              ),
              5.h.verticalSpace,
              Row(
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
                        '21-10-2024',
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
                        '20-10-2024',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ],
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
        30.h.verticalSpace,
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
              17.h.verticalSpace,
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
                          key: key,
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
                          key: key,
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
                  )
                ],
              ),
              20.h.verticalSpace,
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
                      key: key,
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
      ],
    );
  }
}
