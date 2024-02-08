import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllerConfig/base_controller.dart';

class ThemeController extends BaseController {
  late RxBool isDarkMode;
  late GetStorage storage = GetStorage();

  @override
  void onInit() {
    if (storage.read('theme') == true) {
      isDarkMode = true.obs;
    } else {
      isDarkMode = false.obs;
    }
    super.onInit();
  }

  toggleTheme(bool value) {
    isDarkMode.value = value;
    Get.changeThemeMode(
      isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
    );
    _saveThemeStatus();
  }

  _saveThemeStatus() async {
    storage.write('theme', isDarkMode.value);
  }
}
