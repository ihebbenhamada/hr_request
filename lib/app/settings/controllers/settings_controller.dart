import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:request_hr/app/auth/login/screens/login_screen.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/settings_service.dart';

class SettingsController extends BaseController {
  /// SERVICES
  final SettingsService _settingsService = SettingsService();

  /// CONTROLLERS

  /// VARIABLES
  late GetStorage storage;
  RxBool isArabic = false.obs;
  RxBool isDarkTheme = false.obs;
  RxBool isNotificationEnabled = false.obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// INITIALISATION
  void initValues() {
    storage = GetStorage();
  }

  /// FUNCTIONS
  toggleLanguage(bool value) {
    isArabic.value = value;

    if (value) {
      storage.write('language', 'ar');
      Get.updateLocale(const Locale('ar', 'AR'));
    } else {
      storage.write('language', 'en');
      Get.updateLocale(const Locale('en', 'US'));
    }
  }

  toggleTheme(bool value) {
    isDarkTheme.value = value;
  }

  toggleNotification(bool value) {
    isNotificationEnabled.value = value;
  }

  logout() {
    storage.erase();
    Get.offAll(
      () => LoginScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }
}
