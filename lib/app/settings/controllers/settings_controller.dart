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
    initSwitches();
  }

  /// FUNCTIONS
  initSwitches() {
    if (storage.read('language') == 'ar') {
      isArabic.value = true;
    } else {
      isArabic.value = false;
    }
    isNotificationEnabled.value =
        storage.read('isNotificationEnabled') ?? false;
    isDarkTheme.value = storage.read('isDarkTheme') ?? false;
  }

  toggleLanguage() {
    isArabic.value = !isArabic.value;
    if (isArabic.isTrue) {
      storage.write('language', 'ar');
      Get.updateLocale(const Locale('ar', 'AR'));
    } else {
      storage.write('language', 'en');
      Get.updateLocale(const Locale('en', 'US'));
    }
  }

  toggleTheme() {
    isDarkTheme.value = !isDarkTheme.value;
    storage.write('isDarkTheme', isDarkTheme.value);
  }

  toggleNotification() {
    isNotificationEnabled.value = !isNotificationEnabled.value;
    storage.write('isNotificationEnabled', isNotificationEnabled.value);
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
