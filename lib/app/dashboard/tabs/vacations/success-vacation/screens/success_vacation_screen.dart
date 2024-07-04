import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/success-vacation/controllers/success_vacation_controller.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/config/theme/theme_controller.dart';
import 'package:request_hr/widgets/avatar-circle/avatar_circle.dart';
import 'package:request_hr/widgets/custom-button/custom-button.dart';

class SuccessVacationScreen extends StatelessWidget {
  final _successVacationController = Get.put(SuccessVacationController());
  final ThemeController _themeController = Get.find();
  SuccessVacationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        padding: EdgeInsets.only(
          top: 200.h,
        ),
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
                  image: AppImages.cup,
                  circleColor: AppColors.white,
                  size: 271.h,
                  iconSize: 53.h,
                  imageSize: 150.h,
                  left: 34,
                  icon: AppImages.innTechDark,
                ),
              ),
              35.h.verticalSpace,
              Text(
                'You Transaction Done Successfully!!\nClick on continue button for continue',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20.sp,
                  height: 1.6,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      text: 'continue'.tr,
                      onClick: _successVacationController.onClickContinue,
                    ),
                  ],
                ),
              ),
              132.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
