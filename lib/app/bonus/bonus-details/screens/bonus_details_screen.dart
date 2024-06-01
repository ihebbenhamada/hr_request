import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/bonus/bonus-details/controllers/bonus_details_controller.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/widgets/avatar-circle/avatar_circle.dart';
import 'package:request_hr/widgets/input/input_form.dart';

import '../../../../../../config/colors/colors.dart';

class BonusDetailsScreen extends StatelessWidget {
  final _bonusDetailsController = Get.put(BonusDetailsController());
  BonusDetailsScreen({super.key});
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
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    height: 40.h,
                    width: 40.h,
                    margin: const EdgeInsets.only(left: 25),
                    decoration: const ShapeDecoration(
                      shape: OvalBorder(),
                      color: AppColors.primary,
                    ),
                    child: Center(
                      child: Image.asset(
                        AppImages.back,
                        height: 20.h,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                10.h.horizontalSpace,
                Text(
                  'Create bonus',
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
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
                                _bonusDetailsController
                                    .employee.value.fullNameEn,
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
                                _bonusDetailsController.employee.value.jobName,
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
                                _bonusDetailsController
                                    .employee.value.creationDate
                                    .substring(0, 10),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InputForm(
                        height: 55.h,
                        width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                        title: 'Choose Employee',
                        inputType: 'select',
                        selectedDropDownItem:
                            _bonusDetailsController.selectedEmployee,
                        onSelect: (value) =>
                            _bonusDetailsController.onSelectEmployee(value),
                        listDropDown: _bonusDetailsController.employeesList,
                      ),
                      InputForm(
                        height: 55.h,
                        width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                        title: 'Bonus Amount',
                        inputType: 'input',
                        nbrLines: 1,
                        textEditingController:
                            _bonusDetailsController.amountTextEditingController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                          signed: true,
                        ),
                        inputFormatter: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],
                      ),
                    ],
                  ),
                  13.h.verticalSpace,
                  InputForm(
                    height: 55.h,
                    width: double.infinity,
                    title: 'Bonus Title',
                    inputType: 'input',
                    nbrLines: 1,
                    keyboardType: TextInputType.text,
                    textEditingController:
                        _bonusDetailsController.titleTextEditingController,
                  ),
                  13.h.verticalSpace,
                  InputForm(
                    width: double.infinity,
                    title: 'Remark',
                    inputType: 'input',
                    textEditingController:
                        _bonusDetailsController.remarkTextEditingController,
                  ),
                  30.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _bonusDetailsController.onClickSubmit,
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
