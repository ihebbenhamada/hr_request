import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/evaluations/evaluations-steps/main/controllers/evaluations_steps_controller.dart';
import 'package:request_hr/app/evaluations/main/models/evaluation_form.dart';
import 'package:request_hr/config/colors/colors.dart';

class Recommendation extends StatelessWidget {
  Recommendation({
    super.key,
    required this.recItemsList,
    required this.onCheckBox,
  });
  List<RecommendationItem> recItemsList;
  final Function(int, bool) onCheckBox;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.h),
              color: AppColors.white.withOpacity(0.1),
            ),
            child: GetBuilder<EvaluationsStepsController>(
              builder: (_) => GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // number of items in each row
                    mainAxisSpacing: 5.h, // spacing between rows
                    crossAxisSpacing: 5.0.h,
                    childAspectRatio: (1 / .15)
                    // spacing between columns
                    ),
                padding: EdgeInsets.symmetric(
                  vertical: 14.h,
                ),
                shrinkWrap: true, // padding around the grid
                itemCount: recItemsList.length, // total number of items
                itemBuilder: (context, index) {
                  RecommendationItem item = recItemsList[index];
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: 30.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.evaluationItemEn ?? '',
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
                              value: item.checked ?? false,
                              activeColor: AppColors.blueDark,
                              onChanged: (value) =>
                                  onCheckBox(item.id ?? 0, value),
                              activeTrackColor: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          19.h.verticalSpace,
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
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '-  Development / Training Needs',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                      //supervisor comment
                      10.h.verticalSpace,
                      Text(
                        'supervisor comment',
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
                      7.h.verticalSpace,
                      //Action plans
                      Text(
                        'Action plans',
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
                      7.h.verticalSpace,
                      //Employee comment
                      Text(
                        'Employee comment',
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
