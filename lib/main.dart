import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:request_hr/config/network/dependency_injection.dart';
import 'package:request_hr/requestApp.dart';

import 'config/colors/colors.dart';
import 'config/custom_loading_animation.dart';

Future<void> main() async {
  /// INITIALIZE STORAGE
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  configureGlobalLoader();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );

  /// INITIALIZE FIREBASE

  dynamic user = await GetStorage().read('user');
  dynamic language = await GetStorage().read('language');

  if (language == null) {
    await GetStorage().write('language', 'en');
  }

  /// CONFIGURE NOTIFICATIONS
  //notification();

  /// MAIN FUNCTION
  runApp(
    RequestApp(
      isLoggedIn: user != null ? true : false,
      language: language,
    ),
  );
  DependencyInjection.init();
}

void configureGlobalLoader() {
  EasyLoading.instance
    ..animationStyle = EasyLoadingAnimationStyle.opacity
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..indicatorColor = AppColors.white
    ..progressColor = Colors.transparent
    ..backgroundColor = AppColors.primary
    ..maskType = EasyLoadingMaskType.black
    ..textColor = AppColors.primary
    ..textStyle = const TextStyle(fontSize: 14, color: AppColors.white)
    ..userInteractions = false
    ..customAnimation = CustomAnimation();
}
