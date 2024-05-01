import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/settings/controllers/settings_controller.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/widgets/settings-item/settings-item.dart';

import '../../../../../../config/colors/colors.dart';

class SettingsScreen extends StatelessWidget {
  final _settingsController = Get.put(SettingsController());

  SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (MediaQuery.of(context).viewPadding.top + 20).h.verticalSpace,
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                height: 40.h,
                width: 40.h,
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
            7.h.verticalSpace,
            Text(
              'Setting',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 16.sp,
              ),
            ),
            30.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.ltr,
              children: [
                Obx(
                  () => SettingsItem(
                    icon: AppImages.languageSetting,
                    title: 'arabic_language',
                    description: 'change_language',
                    onToggleSwitch: (value) =>
                        _settingsController.toggleLanguage(value),
                    isEnabled: _settingsController.isArabic.value,
                    isDarkMode: false,
                  ),
                ),
                Obx(
                  () => SettingsItem(
                    icon: AppImages.theme,
                    title: 'dark_theme',
                    description: 'change_theme',
                    onToggleSwitch: (value) =>
                        _settingsController.toggleTheme(value),
                    isDarkMode: false,
                    isEnabled: _settingsController.isDarkTheme.value,
                  ),
                ),
              ],
            ),
            28.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.ltr,
              children: [
                Obx(
                  () => SettingsItem(
                    icon: AppImages.notification,
                    title: 'send_notification',
                    description: 'send_notification_alarm',
                    onToggleSwitch: (value) =>
                        _settingsController.toggleNotification(value),
                    isEnabled: _settingsController.isNotificationEnabled.value,
                    isDarkMode: false,
                  ),
                ),
                SettingsItem(
                  icon: AppImages.logout,
                  title: 'sign_out',
                  description: 'sign_out_from_app',
                  isDarkMode: false,
                  onClickItem: _settingsController.logout,
                ),
              ],
            ),
            30.h.verticalSpace,
          ],
        ),
      ),
    );
  }
}
