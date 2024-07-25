import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:request_hr/app/auth/login/screens/login_screen.dart';
import 'package:request_hr/config/theme/request-theme.dart';

import '../config/binding/binding.dart';
import '../config/translation/translation.dart';
import '../routes/app_pages.dart';
import 'app/dashboard/main/screen/dashboard-screen.dart';
import 'config/theme/theme_controller.dart';

class RequestApp extends StatelessWidget {
  RequestApp({
    super.key,
    required this.language,
  });
  final String? language;
  final ThemeController themeController = Get.put(ThemeController());
  final GetStorage storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: AppPages.routes,
          translations: Translation(),
          theme: RequestTheme.lightTheme,
          darkTheme: RequestTheme.darkTheme,
          themeMode:
              storage.read('theme') != null ? ThemeMode.dark : ThemeMode.light,
          locale: language == 'ar'
              ? const Locale('ar', 'AR')
              : const Locale('en', 'US'),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ar', 'AR'),
          ],
          initialBinding: Binding(),
          smartManagement: SmartManagement.keepFactory,
          home: storage.read("token") != null
              ? DashboardScreen(
                  from: 'reload',
                )
              : LoginScreen(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
