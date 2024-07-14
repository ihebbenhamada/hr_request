import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/final_exit/main/controllers/final_exit_controller.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/config/theme/theme_controller.dart';
import 'package:request_hr/widgets/avatar-circle/avatar_circle.dart';
import 'package:request_hr/widgets/custom-button/custom-button.dart';
import 'package:request_hr/widgets/progress/circular_progress.dart';

class FinalExitScreen extends StatelessWidget {
  final _vacationsStepsController = Get.put(FinalExitController());
  final ThemeController _themeController = Get.find();
  FinalExitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.bgLogin),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
            opacity: 0.1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                          width: _vacationsStepsController
                              .animatedFirstStepBarWidth.value,
                          decoration: const BoxDecoration(
                            color: AppColors.blueDark,
                          ),
                        ),
                      ],
                    ),
                    //circle
                    AnimatedBuilder(
                      animation:
                          _vacationsStepsController.firstStepContainerAnimation,
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
                            value: _vacationsStepsController
                                .firstStepContainerAnimation.value,
                            center: Center(
                              child: Text(
                                '2',
                                style: TextStyle(
                                  color: _vacationsStepsController
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
                          width: _vacationsStepsController
                              .animatedSecondStepBarWidth.value,
                          decoration: const BoxDecoration(
                            color: AppColors.blueDark,
                          ),
                        ),
                      ],
                    ),
                    //circle
                    AnimatedBuilder(
                      animation: _vacationsStepsController
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
                            value: _vacationsStepsController
                                .secondStepContainerAnimation.value,
                            center: Center(
                              child: Text(
                                '3',
                                style: TextStyle(
                                  color: _vacationsStepsController
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
              Padding(
                padding: EdgeInsets.only(
                  right: Get.locale?.languageCode == 'en' ? 17.0 : 0,
                  left: Get.locale?.languageCode == 'ar' ? 17.0 : 0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          'final_exit_approval'.tr,
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
                          '${'ticket_exchange'.tr}\n${'request'.tr}',
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
                          'disclaimer'.tr,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              30.h.verticalSpace,
              Expanded(
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _vacationsStepsController.pageController,
                  itemCount: _vacationsStepsController.steps.length,
                  onPageChanged: (index) =>
                      _vacationsStepsController.onPageChanged(index),
                  itemBuilder: (BuildContext context, int index) {
                    return _vacationsStepsController.steps[index];
                  },
                ),
              ),
              Column(
                children: [
                  10.h.verticalSpace,
                  Obx(
                    () => CustomButton(
                      text: _vacationsStepsController.activePage.value == 2
                          ? 'finish'.tr
                          : 'next'.tr,
                      onClick: _vacationsStepsController.activePage.value == 2
                          ? _vacationsStepsController.onClickFinish
                          : _vacationsStepsController.onClickNext,
                    ),
                  ),
                  18.h.verticalSpace,
                  CustomButton(
                    text: 'back'.tr,
                    onClick: _vacationsStepsController.onClickBack,
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
