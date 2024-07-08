import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/evaluations/evaluations-steps/main/controllers/evaluations_steps_controller.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/config/theme/theme_controller.dart';
import 'package:request_hr/widgets/avatar-circle/avatar_circle.dart';
import 'package:request_hr/widgets/custom-button/custom-button.dart';
import 'package:request_hr/widgets/progress/circular_progress.dart';

class EvaluationsStepsScreen extends StatelessWidget {
  final _evaluationsStepsController = Get.put(EvaluationsStepsController());
  final ThemeController _themeController = Get.find();
  EvaluationsStepsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
        color: AppColors.primary,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0.w),
          child: Column(
            children: [
              Center(
                child: AvatarCircle(
                  image: AppImages.profile,
                  circleColor: AppColors.white,
                  size: 111.h,
                  iconSize: 22.h,
                  imageSize: 95.h,
                  left: 13,
                  icon: AppImages.innTechDark,
                ),
              ),
              30.h.verticalSpace,
              Obx(
                () => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //circle
                    Container(
                      height: 40.h,
                      width: 40.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.blueDark,
                      ),
                      child: Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ),
                    //bar
                    Stack(
                      children: [
                        Container(
                          width:
                              (MediaQuery.of(context).size.width - 170.w) / 4,
                          height: 5.h,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          height: 5.h,
                          width: _evaluationsStepsController
                              .animatedFirstStepBarWidth.value,
                          decoration: const BoxDecoration(
                            color: AppColors.blueDark,
                          ),
                        ),
                      ],
                    ),
                    //circle
                    AnimatedBuilder(
                      animation: _evaluationsStepsController
                          .firstStepContainerAnimation,
                      builder: (context, child) {
                        return SizedBox(
                          height: 40.h,
                          width: 40.h,
                          child: LiquidCircularProgressIndicator(
                            backgroundColor: AppColors.white,
                            valueColor: const AlwaysStoppedAnimation(
                              AppColors.blueDark,
                            ),
                            value: _evaluationsStepsController
                                .firstStepContainerAnimation.value,
                            center: Center(
                              child: Text(
                                '2',
                                style: TextStyle(
                                  color: _evaluationsStepsController
                                      .firstStepTextColor.value,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    //bar
                    Stack(
                      children: [
                        Container(
                          width:
                              (MediaQuery.of(context).size.width - 170.w) / 4,
                          height: 5.h,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          height: 5.h,
                          width: _evaluationsStepsController
                              .animatedSecondStepBarWidth.value,
                          decoration: const BoxDecoration(
                            color: AppColors.blueDark,
                          ),
                        ),
                      ],
                    ),
                    //circle
                    AnimatedBuilder(
                      animation: _evaluationsStepsController
                          .secondStepContainerAnimation,
                      builder: (context, child) {
                        return SizedBox(
                          height: 40.h,
                          width: 40.h,
                          child: LiquidCircularProgressIndicator(
                            backgroundColor: AppColors.white,
                            valueColor: const AlwaysStoppedAnimation(
                              AppColors.blueDark,
                            ),
                            value: _evaluationsStepsController
                                .secondStepContainerAnimation.value,
                            center: Center(
                              child: Text(
                                '3',
                                style: TextStyle(
                                  color: _evaluationsStepsController
                                      .secondStepTextColor.value,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    //bar
                    Stack(
                      children: [
                        Container(
                          width:
                              (MediaQuery.of(context).size.width - 170.w) / 4,
                          height: 5.h,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          height: 5.h,
                          width: _evaluationsStepsController
                              .animatedThirdStepBarWidth.value,
                          decoration: const BoxDecoration(
                            color: AppColors.blueDark,
                          ),
                        ),
                      ],
                    ),
                    //circle
                    AnimatedBuilder(
                      animation: _evaluationsStepsController
                          .thirdStepContainerAnimation,
                      builder: (context, child) {
                        return SizedBox(
                          height: 40.h,
                          width: 40.h,
                          child: LiquidCircularProgressIndicator(
                            backgroundColor: AppColors.white,
                            valueColor: const AlwaysStoppedAnimation(
                              AppColors.blueDark,
                            ),
                            value: _evaluationsStepsController
                                .thirdStepContainerAnimation.value,
                            center: Center(
                              child: Text(
                                '4',
                                style: TextStyle(
                                  color: _evaluationsStepsController
                                      .thirdStepTextColor.value,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              5.h.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Form type',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'First Step',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        'Form A',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Second Step',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        'Recommendation',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Third Step',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        'Employee',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              30.h.verticalSpace,
              Obx(
                () => Expanded(
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _evaluationsStepsController.pageController,
                    itemCount: _evaluationsStepsController.steps.value.length,
                    onPageChanged: (index) =>
                        _evaluationsStepsController.onPageChanged(index),
                    itemBuilder: (BuildContext context, int index) {
                      return _evaluationsStepsController.steps.value[index];
                    },
                  ),
                ),
              ),
              Column(
                children: [
                  10.h.verticalSpace,
                  Obx(
                    () => CustomButton(
                      text: _evaluationsStepsController.activePage.value == 3
                          ? 'Finish'
                          : 'Next'.tr,
                      onClick: _evaluationsStepsController.activePage.value == 3
                          ? _evaluationsStepsController.onClickFinish
                          : _evaluationsStepsController.onClickNext,
                    ),
                  ),
                  18.h.verticalSpace,
                  CustomButton(
                    text: 'back'.tr,
                    onClick: _evaluationsStepsController.onClickBack,
                    isPrimary: false,
                  ),
                  56.h.verticalSpace,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
