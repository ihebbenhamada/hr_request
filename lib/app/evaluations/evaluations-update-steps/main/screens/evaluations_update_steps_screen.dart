import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/config/theme/theme_controller.dart';
import 'package:request_hr/widgets/avatar-circle/avatar_circle.dart';
import 'package:request_hr/widgets/custom-button/custom-button.dart';
import 'package:request_hr/widgets/progress/circular_progress.dart';

import '../controllers/evaluations_update_steps_controller.dart';

class EvaluationsUpdateStepsScreen extends StatelessWidget {
  final _evaluationsUpdateStepsController =
      Get.put(EvaluationsUpdateStepsController());
  final ThemeController _themeController = Get.find();
  EvaluationsUpdateStepsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
                            width: 86,
                            height: 5.h,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            height: 5.h,
                            width: _evaluationsUpdateStepsController
                                .animatedFirstStepBarWidth.value,
                            decoration: const BoxDecoration(
                              color: AppColors.blueDark,
                            ),
                          ),
                        ],
                      ),
                      //circle
                      AnimatedBuilder(
                        animation: _evaluationsUpdateStepsController
                            .firstStepContainerAnimation,
                        builder: (context, child) {
                          return SizedBox(
                            height: 40.h,
                            width: 40.h,
                            child: LiquidCircularProgressIndicator(
                              backgroundColor: Get.locale?.languageCode == 'en'
                                  ? AppColors.white
                                  : AppColors.blueDark,
                              valueColor: AlwaysStoppedAnimation(
                                Get.locale?.languageCode == 'en'
                                    ? AppColors.blueDark
                                    : AppColors.white,
                              ),
                              value: _evaluationsUpdateStepsController
                                  .firstStepContainerAnimation.value,
                              center: Center(
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    color: _evaluationsUpdateStepsController
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
                            width: 86,
                            height: 5.h,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            height: 5.h,
                            width: _evaluationsUpdateStepsController
                                .animatedSecondStepBarWidth.value,
                            decoration: const BoxDecoration(
                              color: AppColors.blueDark,
                            ),
                          ),
                        ],
                      ),
                      //circle
                      AnimatedBuilder(
                        animation: _evaluationsUpdateStepsController
                            .secondStepContainerAnimation,
                        builder: (context, child) {
                          return SizedBox(
                            height: 40.h,
                            width: 40.h,
                            child: LiquidCircularProgressIndicator(
                              backgroundColor: Get.locale?.languageCode == 'en'
                                  ? AppColors.white
                                  : AppColors.blueDark,
                              valueColor: AlwaysStoppedAnimation(
                                Get.locale?.languageCode == 'en'
                                    ? AppColors.blueDark
                                    : AppColors.white,
                              ),
                              value: _evaluationsUpdateStepsController
                                  .secondStepContainerAnimation.value,
                              center: Center(
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                    color: _evaluationsUpdateStepsController
                                        .secondStepTextColor.value,
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          'first_step'.tr,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          'form_a'.tr,
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
                          'second_step'.tr,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          'recommendation'.tr,
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
                          'third_step'.tr,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          'employee'.tr,
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
                      controller:
                          _evaluationsUpdateStepsController.pageController,
                      itemCount:
                          _evaluationsUpdateStepsController.steps.value.length,
                      onPageChanged: (index) =>
                          _evaluationsUpdateStepsController
                              .onPageChanged(index),
                      itemBuilder: (BuildContext context, int index) {
                        return _evaluationsUpdateStepsController
                            .steps.value[index];
                      },
                    ),
                  ),
                ),
                Column(
                  children: [
                    10.h.verticalSpace,
                    Obx(
                      () => CustomButton(
                        text: _evaluationsUpdateStepsController
                                    .activePage.value ==
                                2
                            ? 'finish'.tr
                            : 'next'.tr,
                        onClick: _evaluationsUpdateStepsController
                                    .activePage.value ==
                                2
                            ? _evaluationsUpdateStepsController.onClickFinish
                            : _evaluationsUpdateStepsController.onClickNext,
                      ),
                    ),
                    18.h.verticalSpace,
                    CustomButton(
                      text: 'back'.tr,
                      onClick: _evaluationsUpdateStepsController.onClickBack,
                      isPrimary: false,
                    ),
                    56.h.verticalSpace,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
