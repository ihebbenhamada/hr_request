import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/delete/controllers/delete_controller.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/theme/theme_controller.dart';

import '../../../config/image_urls/image_urls.dart';
import '../../../widgets/avatar-circle/avatar_circle.dart';
import '../../../widgets/custom-button/custom-button.dart';

class DeleteScreen extends StatelessWidget {
  final _deleteController = Get.put(DeleteController());
  final ThemeController _themeController = Get.find();
  DeleteScreen({super.key});
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: AvatarCircle(
                  image: AppImages.bigTrash,
                  circleColor: AppColors.white,
                  size: 271.h,
                  iconSize: 53.h,
                  imageSize: 125.h,
                  left: 34,
                  icon: AppImages.innTechDark,
                ),
              ),
              35.h.verticalSpace,
              Text(
                'Are You Sure !!\nif you delete this record you cant recover it again !',
                textAlign: TextAlign.center,
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
                      onClick: _deleteController.onClickDelete,
                    ),
                    30.h.verticalSpace,
                    CustomButton(
                      text: 'back'.tr,
                      onClick: _deleteController.onClickDelete,
                      isPrimary: false,
                    ),
                  ],
                ),
              ),
              45.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
