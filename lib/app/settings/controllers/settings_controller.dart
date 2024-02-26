import 'package:flutter/animation.dart';
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
  logout() {
    storage.remove('user');
    storage.remove('token');
    Get.offAll(
      () => LoginScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }
}
