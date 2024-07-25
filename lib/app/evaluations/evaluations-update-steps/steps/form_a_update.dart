import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FormAUpdate extends StatelessWidget {
  const FormAUpdate({
    super.key,
    required this.jobDescSliderValue,
    required this.importantRoleValue,
    required this.onChangeSlider,
    required this.managementEncourageValue,
    required this.memberQualifiedValue,
    required this.discusesJobDutiesValue,
    required this.helpManagingWorkValue,
    required this.understandManagerExpectationValue,
    required this.workPlaceFactoryTitle,
    required this.relationShipCollageTitle,
    required this.managementDepartmentTitle,
    required this.directManagementTitle,
    required this.workPlaceDesc1,
    required this.workPlaceDesc2,
    required this.relationShipDesc1,
    required this.relationShipDesc2,
    required this.relationShipDesc3,
    required this.managementDepartmentDesc,
    required this.directManagementDesc,
    required this.totalScale,
  });

  final RxDouble totalScale;

  ///area1
  final RxString workPlaceFactoryTitle;
  final RxString workPlaceDesc1;
  final RxString workPlaceDesc2;
  final RxDouble jobDescSliderValue;
  final RxDouble importantRoleValue;

  ///area2
  final RxString relationShipCollageTitle;
  final RxString relationShipDesc1;
  final RxString relationShipDesc2;
  final RxString relationShipDesc3;
  final RxDouble managementEncourageValue;
  final RxDouble memberQualifiedValue;
  final RxDouble discusesJobDutiesValue;

  ///area3
  final RxString managementDepartmentTitle;
  final RxString managementDepartmentDesc;
  final RxDouble helpManagingWorkValue;

  ///area4
  final RxString directManagementTitle;
  final RxString directManagementDesc;
  final RxDouble understandManagerExpectationValue;

  ///
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
                        workPlaceFactoryTitle.value,
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
                        workPlaceDesc1.value,
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
                                stepSize: 25,
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
                        workPlaceDesc2.value,
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
                                stepSize: 25,
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
                        relationShipCollageTitle.value,
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
                        relationShipDesc1.value,
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
                                stepSize: 25,
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
                        relationShipDesc2.value,
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
                                stepSize: 25,
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
                        relationShipDesc3.value,
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
                                stepSize: 25,
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
                        managementDepartmentTitle.value,
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
                        managementDepartmentDesc.value,
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
                                stepSize: 25,
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
                        directManagementTitle.value,
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
                        directManagementDesc.value,
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
                                stepSize: 25,
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
              width: 145,
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: AppColors.blueDark,
              ),
              child: Center(
                child: Obx(
                  () => Text(
                    '${'total'.tr} :${totalScale.value.round()}/700',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.white,
                    ),
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
