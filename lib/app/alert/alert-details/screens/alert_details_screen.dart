import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/alert/alert-details/controllers/alert_details_controller.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/widgets/avatar-circle/avatar_circle.dart';
import 'package:request_hr/widgets/input/input_form.dart';

import '../../../../../../config/colors/colors.dart';

class AlertDetailsScreen extends StatelessWidget {
  final _alertDetailsController = Get.put(AlertDetailsController());
  AlertDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray2,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            (MediaQuery.of(context).viewPadding.top + 20).h.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: SizedBox(
                height: 111.h,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      width: 360.w,
                      height: 80.h,
                      padding: const EdgeInsets.only(left: 25),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        image: DecorationImage(
                          image: AssetImage(AppImages.poster),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 20.h,
                                width: 20.h,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(20.h),
                                  border: Border.all(color: AppColors.blue1),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    AppImages.employee,
                                    height: 12.5.h,
                                    width: 12,
                                  ),
                                ),
                              ),
                              4.horizontalSpace,
                              Text(
                                'Mohamed Ismail ',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          5.h.verticalSpace,
                          Row(
                            children: [
                              Container(
                                height: 20.h,
                                width: 20.h,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(20.h),
                                  border: Border.all(color: AppColors.blue1),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    AppImages.position,
                                    height: 10.7.h,
                                    width: 13.3,
                                  ),
                                ),
                              ),
                              4.horizontalSpace,
                              Text(
                                'project Manager',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          5.h.verticalSpace,
                          Row(
                            children: [
                              Container(
                                height: 20.h,
                                width: 20.h,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(20.h),
                                  border: Border.all(color: AppColors.blue1),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    AppImages.cal,
                                    height: 8.h,
                                    width: 8.h,
                                  ),
                                ),
                              ),
                              4.horizontalSpace,
                              Text(
                                '19/5/2024',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: AvatarCircle(
                        image: AppImages.avatar3,
                        size: 112.h,
                        iconSize: 22.h,
                        imageSize: 95.h,
                        left: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            40.h.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  InputForm(
                    height: 55.h,
                    width: double.infinity,
                    title: 'Choose Employee',
                    inputType: 'select',
                    selectedDropDownItem:
                        _alertDetailsController.selectedEmployee,
                    onSelect: (value) =>
                        _alertDetailsController.onSelectEmployee(value),
                    listDropDown: _alertDetailsController.employeesList,
                  ),
                  13.h.verticalSpace,
                  InputForm(
                    height: 55.h,
                    width: double.infinity,
                    title: 'Alert Title',
                    inputType: 'text',
                    text: 'Proficiency bonus',
                  ),
                  13.h.verticalSpace,
                  const InputForm(
                    width: double.infinity,
                    title: 'Remark',
                    inputType: 'input',
                  ),
                  30.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 50.h,
                          width: 50.h,
                          decoration: const ShapeDecoration(
                            color: AppColors.primary,
                            shape: OvalBorder(),
                          ),
                          child: Center(
                            child: Image.asset(
                              AppImages.tick,
                              color: AppColors.white,
                              height: 30.h,
                            ),
                          ),
                        ),
                      ),
                      23.horizontalSpace,
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 50.h,
                          width: 50.h,
                          decoration: const ShapeDecoration(
                            color: AppColors.blueDark,
                            shape: OvalBorder(),
                          ),
                          child: Center(
                            child: Image.asset(
                              AppImages.x,
                              color: AppColors.white,
                              height: 20.h,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
