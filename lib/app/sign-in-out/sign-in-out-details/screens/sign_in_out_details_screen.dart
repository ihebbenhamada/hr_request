import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:request_hr/app/sign-in-out/sign-in-out-details/controllers/sign_in_out_details_controller.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/widgets/avatar-circle/avatar_circle.dart';
import 'package:request_hr/widgets/input/input_form.dart';

import '../../../../../../config/colors/colors.dart';

class SignInOutDetailsScreen extends StatelessWidget {
  final _signInOutDetailsController = Get.put(SignInOutDetailsController());
  SignInOutDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray2,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              (MediaQuery.of(context).viewPadding.top + 20).h.verticalSpace,
              Center(
                child: AvatarCircle(
                  image: AppImages.profile,
                  icon: AppImages.innTechDark,
                  size: 111.h,
                  iconSize: 22.h,
                  imageSize: 95.h,
                  left: 13,
                ),
              ),
              30.h.verticalSpace,
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => _signInOutDetailsController.onSelectType(0),
                      child: Container(
                        height: 45.h,
                        width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x29000000),
                              blurRadius: 3,
                              offset: Offset(0, 3),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 16.h,
                              width: 16.h,
                              decoration: ShapeDecoration(
                                color: AppColors.white,
                                shape: OvalBorder(
                                  side: BorderSide(
                                    color: _signInOutDetailsController
                                                .selectedType.value ==
                                            0
                                        ? AppColors.primary
                                        : AppColors.gray13,
                                    width: 3.5,
                                  ),
                                ),
                              ),
                            ),
                            6.horizontalSpace,
                            Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.blueDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _signInOutDetailsController.onSelectType(01),
                      child: Container(
                        height: 45.h,
                        width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x29000000),
                              blurRadius: 3,
                              offset: Offset(0, 3),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 16.h,
                              width: 16.h,
                              decoration: ShapeDecoration(
                                color: AppColors.white,
                                shape: OvalBorder(
                                  side: BorderSide(
                                    color: _signInOutDetailsController
                                                .selectedType.value ==
                                            1
                                        ? AppColors.primary
                                        : AppColors.gray13,
                                    width: 3.5,
                                  ),
                                ),
                              ),
                            ),
                            6.horizontalSpace,
                            Text(
                              'Sign Out',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.blueDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              15.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => InputForm(
                      height: 55.h,
                      width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                      title: 'Date',
                      inputType: 'date',
                      text: DateFormat('dd-MM-yyyy')
                          .format(_signInOutDetailsController.signDate.value),
                      onSelectDate: () =>
                          _signInOutDetailsController.selectDate(context),
                    ),
                  ),
                  10.h.verticalSpace,
                  InputForm(
                    height: 55.h,
                    width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                    title: 'Time',
                    inputType: 'text',
                    text: '09:00',
                  ),
                ],
              ),
              15.h.verticalSpace,
              InputForm(
                height: 55.h,
                width: double.infinity,
                title: 'Location',
                inputType: 'text',
                text: 'Latitude: 29.9804626, Longitude: 31.159573',
              ),
              15.h.verticalSpace,
              InputForm(
                height: 55.h,
                width: double.infinity,
                title: 'Area',
                inputType: 'text',
                text: 'Amr Abn Elkhtab st., Yanbu .ksa',
              ),
              30.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _signInOutDetailsController.onClickSubmit,
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
                    onTap: _signInOutDetailsController.onClickBack,
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
      ),
    );
  }
}
