import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:request_hr/config/colors/colors.dart';

class EmployeePart extends StatelessWidget {
  const EmployeePart({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                14.h.verticalSpace,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Agree / Disgree',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        height: 10.h,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Switch(
                            value: true,
                            activeColor: AppColors.blueDark,
                            onChanged: (value) {},
                            activeTrackColor: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                16.h.verticalSpace,
                Text(
                  'Date',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.white,
                  ),
                ),
                5.h.verticalSpace,
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
                  maxLines: 1,
                  autocorrect: false,
                  enableSuggestions: false,
                  enabled: true,
                  enableInteractiveSelection: true,
                ),
                3.h.verticalSpace,
                const Divider(
                  height: 1,
                  color: AppColors.white,
                  thickness: 1,
                ),
                16.h.verticalSpace,
                Text(
                  'Remark',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.white,
                  ),
                ),
                5.h.verticalSpace,
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
                  maxLines: 4,
                  autocorrect: false,
                  enableSuggestions: false,
                  enabled: true,
                  enableInteractiveSelection: true,
                ),
                3.h.verticalSpace,
                const Divider(
                  height: 1,
                  color: AppColors.white,
                  thickness: 1,
                ),
                16.h.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
