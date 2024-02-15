import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FormA extends StatelessWidget {
  const FormA({
    super.key,
    required this.jobDescSliderValue,
    required this.importantRoleValue,
    required this.onChangeSlider,
    required this.managementEncourageValue,
    required this.memberQualifiedValue,
    required this.discusesJobDutiesValue,
    required this.helpManagingWorkValue,
    required this.understandManagerExpectationValue,
  });
  final RxDouble jobDescSliderValue;
  final RxDouble importantRoleValue;
  final RxDouble managementEncourageValue;
  final RxDouble memberQualifiedValue;
  final RxDouble discusesJobDutiesValue;
  final RxDouble helpManagingWorkValue;
  final RxDouble understandManagerExpectationValue;
  final void Function(dynamic, int) onChangeSlider;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(19.h),
                  topLeft: Radius.circular(19.h),
                  bottomRight: Radius.circular(12.h),
                  bottomLeft: Radius.circular(12.h),
                ),
              ),
              color: AppColors.white.withOpacity(0.1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(4.h),
                  decoration: BoxDecoration(
                    color: AppColors.blueDark,
                    borderRadius: BorderRadius.circular(19.h),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 28.h,
                        width: 28.h,
                        decoration: const ShapeDecoration(
                          color: AppColors.gray10,
                          shape: OvalBorder(),
                        ),
                        child: Center(
                          child: Image.asset(
                            AppImages.add,
                            height: 12.h,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      Text(
                        'work place factory or company',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                12.h.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My job description is related to my duties	',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.white,
                        ),
                      ),
                      8.h.verticalSpace,
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 126,
                          child: SfSliderTheme(
                            data: SfSliderThemeData(
                              overlayRadius: 0,
                              labelOffset: const Offset(0, 7),
                              activeLabelStyle: TextStyle(
                                color: AppColors.white,
                                fontSize: 7.sp,
                              ),
                              inactiveLabelStyle: TextStyle(
                                color: AppColors.white,
                                fontSize: 7.sp,
                              ),
                              activeTrackHeight: 3.h,
                              inactiveTrackHeight: 3.h,
                              thumbRadius: 7.h,
                            ),
                            child: Obx(
                              () => SfSlider(
                                min: 0.0,
                                max: 100.0,
                                value: jobDescSliderValue.value,
                                interval: 25,
                                showTicks: false,
                                showLabels: true,
                                enableTooltip: false,
                                activeColor: AppColors.blueDark,
                                inactiveColor: AppColors.white,
                                edgeLabelPlacement: EdgeLabelPlacement.auto,
                                labelFormatterCallback: (a, label) {
                                  return '$label%';
                                },
                                onChanged: (dynamic value) =>
                                    onChangeSlider(value, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      13.h.verticalSpace,
                      Text(
                        'I fell that I play Important role in achiving the mission of company',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.white,
                        ),
                      ),
                      8.h.verticalSpace,
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 126,
                          child: SfSliderTheme(
                            data: SfSliderThemeData(
                              overlayRadius: 0,
                              labelOffset: const Offset(0, 7),
                              activeLabelStyle: TextStyle(
                                color: AppColors.white,
                                fontSize: 7.sp,
                              ),
                              inactiveLabelStyle: TextStyle(
                                color: AppColors.white,
                                fontSize: 7.sp,
                              ),
                              activeTrackHeight: 3.h,
                              inactiveTrackHeight: 3.h,
                              thumbRadius: 7.h,
                            ),
                            child: Obx(
                              () => SfSlider(
                                min: 0.0,
                                max: 100.0,
                                value: importantRoleValue.value,
                                interval: 25,
                                showTicks: false,
                                showLabels: true,
                                enableTooltip: false,
                                activeColor: AppColors.blueDark,
                                inactiveColor: AppColors.white,
                                edgeLabelPlacement: EdgeLabelPlacement.auto,
                                labelFormatterCallback: (a, label) {
                                  return '$label%';
                                },
                                onChanged: (dynamic value) =>
                                    onChangeSlider(value, 2),
                              ),
                            ),
                          ),
                        ),
                      ),
                      13.h.verticalSpace,
                    ],
                  ),
                ),
              ],
            ),
          ),
          20.h.verticalSpace,
          Container(
            width: double.infinity,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(19.h),
                  topLeft: Radius.circular(19.h),
                  bottomRight: Radius.circular(12.h),
                  bottomLeft: Radius.circular(12.h),
                ),
              ),
              color: AppColors.white.withOpacity(0.1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(4.h),
                  decoration: BoxDecoration(
                    color: AppColors.blueDark,
                    borderRadius: BorderRadius.circular(19.h),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 28.h,
                        width: 28.h,
                        decoration: const ShapeDecoration(
                          color: AppColors.gray10,
                          shape: OvalBorder(),
                        ),
                        child: Center(
                          child: Image.asset(
                            AppImages.add,
                            height: 12.h,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      Text(
                        'Relationship with collage',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                12.h.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My management encourage team work',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.white,
                        ),
                      ),
                      8.h.verticalSpace,
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 126,
                          child: SfSliderTheme(
                            data: SfSliderThemeData(
                              overlayRadius: 0,
                              labelOffset: const Offset(0, 7),
                              activeLabelStyle: TextStyle(
                                color: AppColors.white,
                                fontSize: 7.sp,
                              ),
                              inactiveLabelStyle: TextStyle(
                                color: AppColors.white,
                                fontSize: 7.sp,
                              ),
                              activeTrackHeight: 3.h,
                              inactiveTrackHeight: 3.h,
                              thumbRadius: 7.h,
                            ),
                            child: Obx(
                              () => SfSlider(
                                min: 0.0,
                                max: 100.0,
                                value: managementEncourageValue.value,
                                interval: 25,
                                showTicks: false,
                                showLabels: true,
                                enableTooltip: false,
                                activeColor: AppColors.blueDark,
                                inactiveColor: AppColors.white,
                                edgeLabelPlacement: EdgeLabelPlacement.auto,
                                labelFormatterCallback: (a, label) {
                                  return '$label%';
                                },
                                onChanged: (dynamic value) =>
                                    onChangeSlider(value, 3),
                              ),
                            ),
                          ),
                        ),
                      ),
                      13.h.verticalSpace,
                      Text(
                        'The company factory member qualified to do the work',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.white,
                        ),
                      ),
                      8.h.verticalSpace,
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 126,
                          child: SfSliderTheme(
                            data: SfSliderThemeData(
                              overlayRadius: 0,
                              labelOffset: const Offset(0, 7),
                              activeLabelStyle: TextStyle(
                                color: AppColors.white,
                                fontSize: 7.sp,
                              ),
                              inactiveLabelStyle: TextStyle(
                                color: AppColors.white,
                                fontSize: 7.sp,
                              ),
                              activeTrackHeight: 3.h,
                              inactiveTrackHeight: 3.h,
                              thumbRadius: 7.h,
                            ),
                            child: Obx(
                              () => SfSlider(
                                min: 0.0,
                                max: 100.0,
                                value: memberQualifiedValue.value,
                                interval: 25,
                                showTicks: false,
                                showLabels: true,
                                enableTooltip: false,
                                activeColor: AppColors.blueDark,
                                inactiveColor: AppColors.white,
                                edgeLabelPlacement: EdgeLabelPlacement.auto,
                                labelFormatterCallback: (a, label) {
                                  return '$label%';
                                },
                                onChanged: (dynamic value) =>
                                    onChangeSlider(value, 4),
                              ),
                            ),
                          ),
                        ),
                      ),
                      13.h.verticalSpace,
                      Text(
                        'I discuses the job duties with my collage',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.white,
                        ),
                      ),
                      8.h.verticalSpace,
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 126,
                          child: SfSliderTheme(
                            data: SfSliderThemeData(
                              overlayRadius: 0,
                              labelOffset: const Offset(0, 7),
                              activeLabelStyle: TextStyle(
                                color: AppColors.white,
                                fontSize: 7.sp,
                              ),
                              inactiveLabelStyle: TextStyle(
                                color: AppColors.white,
                                fontSize: 7.sp,
                              ),
                              activeTrackHeight: 3.h,
                              inactiveTrackHeight: 3.h,
                              thumbRadius: 7.h,
                            ),
                            child: Obx(
                              () => SfSlider(
                                min: 0.0,
                                max: 100.0,
                                value: discusesJobDutiesValue.value,
                                interval: 25,
                                showTicks: false,
                                showLabels: true,
                                enableTooltip: false,
                                activeColor: AppColors.blueDark,
                                inactiveColor: AppColors.white,
                                edgeLabelPlacement: EdgeLabelPlacement.auto,
                                labelFormatterCallback: (a, label) {
                                  return '$label%';
                                },
                                onChanged: (dynamic value) =>
                                    onChangeSlider(value, 5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      13.h.verticalSpace,
                    ],
                  ),
                ),
              ],
            ),
          ),
          20.h.verticalSpace,
          Container(
            width: double.infinity,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(19.h),
                  topLeft: Radius.circular(19.h),
                  bottomRight: Radius.circular(12.h),
                  bottomLeft: Radius.circular(12.h),
                ),
              ),
              color: AppColors.white.withOpacity(0.1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(4.h),
                  decoration: BoxDecoration(
                    color: AppColors.blueDark,
                    borderRadius: BorderRadius.circular(19.h),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 28.h,
                        width: 28.h,
                        decoration: const ShapeDecoration(
                          color: AppColors.gray10,
                          shape: OvalBorder(),
                        ),
                        child: Center(
                          child: Image.asset(
                            AppImages.add,
                            height: 12.h,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      Text(
                        'Management/Department',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                12.h.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'I have authorities which help me in managing the work',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.white,
                        ),
                      ),
                      8.h.verticalSpace,
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 126,
                          child: SfSliderTheme(
                            data: SfSliderThemeData(
                              overlayRadius: 0,
                              labelOffset: const Offset(0, 7),
                              activeLabelStyle: TextStyle(
                                color: AppColors.white,
                                fontSize: 7.sp,
                              ),
                              inactiveLabelStyle: TextStyle(
                                color: AppColors.white,
                                fontSize: 7.sp,
                              ),
                              activeTrackHeight: 3.h,
                              inactiveTrackHeight: 3.h,
                              thumbRadius: 7.h,
                            ),
                            child: Obx(
                              () => SfSlider(
                                min: 0.0,
                                max: 100.0,
                                value: helpManagingWorkValue.value,
                                interval: 25,
                                showTicks: false,
                                showLabels: true,
                                enableTooltip: false,
                                activeColor: AppColors.blueDark,
                                inactiveColor: AppColors.white,
                                edgeLabelPlacement: EdgeLabelPlacement.auto,
                                labelFormatterCallback: (a, label) {
                                  return '$label%';
                                },
                                onChanged: (dynamic value) =>
                                    onChangeSlider(value, 6),
                              ),
                            ),
                          ),
                        ),
                      ),
                      13.h.verticalSpace,
                    ],
                  ),
                ),
              ],
            ),
          ),
          20.h.verticalSpace,
          Container(
            width: double.infinity,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(19.h),
                  topLeft: Radius.circular(19.h),
                  bottomRight: Radius.circular(12.h),
                  bottomLeft: Radius.circular(12.h),
                ),
              ),
              color: AppColors.white.withOpacity(0.1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(4.h),
                  decoration: BoxDecoration(
                    color: AppColors.blueDark,
                    borderRadius: BorderRadius.circular(19.h),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 28.h,
                        width: 28.h,
                        decoration: const ShapeDecoration(
                          color: AppColors.gray10,
                          shape: OvalBorder(),
                        ),
                        child: Center(
                          child: Image.asset(
                            AppImages.add,
                            height: 12.h,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      Text(
                        'Direct Management/Department manager	',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                12.h.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'I can understand my manager expectation',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.white,
                        ),
                      ),
                      8.h.verticalSpace,
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 126,
                          child: SfSliderTheme(
                            data: SfSliderThemeData(
                              overlayRadius: 0,
                              labelOffset: const Offset(0, 7),
                              activeLabelStyle: TextStyle(
                                color: AppColors.white,
                                fontSize: 7.sp,
                              ),
                              inactiveLabelStyle: TextStyle(
                                color: AppColors.white,
                                fontSize: 7.sp,
                              ),
                              activeTrackHeight: 3.h,
                              inactiveTrackHeight: 3.h,
                              thumbRadius: 7.h,
                            ),
                            child: Obx(
                              () => SfSlider(
                                min: 0.0,
                                max: 100.0,
                                value: understandManagerExpectationValue.value,
                                interval: 25,
                                showTicks: false,
                                showLabels: true,
                                enableTooltip: false,
                                activeColor: AppColors.blueDark,
                                inactiveColor: AppColors.white,
                                edgeLabelPlacement: EdgeLabelPlacement.auto,
                                labelFormatterCallback: (a, label) {
                                  return '$label%';
                                },
                                onChanged: (dynamic value) =>
                                    onChangeSlider(value, 7),
                              ),
                            ),
                          ),
                        ),
                      ),
                      13.h.verticalSpace,
                    ],
                  ),
                ),
              ],
            ),
          ),
          25.h.verticalSpace,
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 135,
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: AppColors.blueDark,
              ),
              child: Center(
                child: Text(
                  'Total:475/700',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
          25.h.verticalSpace,
        ],
      ),
    );
  }
}
