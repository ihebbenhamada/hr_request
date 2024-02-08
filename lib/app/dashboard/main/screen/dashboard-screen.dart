import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/home/screens/home_screen.dart';
import 'package:request_hr/app/dashboard/tabs/mail/screens/mail_screen.dart';
import 'package:request_hr/app/dashboard/tabs/meetings/screens/meetings_screen.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/screens/vacations_screen.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/image_urls/image_urls.dart';
import '../../../../config/theme/theme_controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../../widgets/drawer-content/drawer-content.dart';
import '../../../../widgets/header/header.dart';
import '../../tabs/decisions/main/screens/decisions_screen.dart';
import '../controller/dashboard-controller.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  final _dashboardController = Get.put(DashboardController());
  final ThemeController themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: SafeArea(
        top: false,
        child: ClipRRect(
          child: Obx(
            () => Scaffold(
              key: _dashboardController.scaffoldKey,
              extendBody: true,
              backgroundColor: AppColors.gray2,
              body: Column(
                children: [
                  20.h.verticalSpace,
                  Header(
                    onClickProfile: () {},
                    onClickMenu: () {
                      _dashboardController.scaffoldKey.currentState!
                          .openDrawer();
                    },
                    onClickMessage: () {},
                    onClickNotification: () {},
                  ),
                  Expanded(
                    child: IndexedStack(
                      index: _dashboardController.pageIndex.value,
                      children: [
                        Navigator(
                          key: Get.nestedKey(1),
                          initialRoute: AppRoutes.decisions,
                          onGenerateRoute: (route) => MaterialPageRoute(
                            settings: route,
                            builder: (context) => DecisionsScreen(),
                          ),
                        ),
                        Navigator(
                          key: Get.nestedKey(2),
                          onGenerateRoute: (route) => MaterialPageRoute(
                            settings: route,
                            builder: (context) => VacationsScreen(),
                          ),
                        ),
                        Navigator(
                          key: Get.nestedKey(3),
                          onGenerateRoute: (route) => MaterialPageRoute(
                            settings: route,
                            builder: (context) => HomeScreen(),
                          ),
                        ),
                        Navigator(
                          key: Get.nestedKey(4),
                          onGenerateRoute: (route) => MaterialPageRoute(
                            settings: route,
                            builder: (context) => MeetingsScreen(),
                          ),
                        ),
                        Navigator(
                          key: Get.nestedKey(5),
                          onGenerateRoute: (route) => MaterialPageRoute(
                            settings: route,
                            builder: (context) => MailScreen(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              drawer: Drawer(
                width: MediaQuery.of(context).size.width,
                child: DrawerContent(
                  scaffoldKey: _dashboardController.scaffoldKey,
                ),
              ),
              bottomNavigationBar: CurvedNavigationBar(
                key: _dashboardController.bottomNavigationKey,
                index: _dashboardController.pageIndex.value,
                height: Platform.isIOS ? 50.h : 64.h,
                items: <Widget>[
                  Image.asset(
                    AppImages.decisions,
                    height: 29,
                    width: 29,
                    color: _dashboardController.pageIndex.value == 0
                        ? AppColors.primary
                        : AppColors.white,
                  ),
                  Image.asset(
                    AppImages.vacations,
                    height: 29,
                    width: 29,
                    color: _dashboardController.pageIndex.value == 1
                        ? AppColors.primary
                        : AppColors.white,
                  ),
                  Image.asset(
                    AppImages.innTechLogo,
                    height: 29,
                    width: 29,
                    color: _dashboardController.pageIndex.value == 2
                        ? null
                        : AppColors.white,
                  ),
                  Image.asset(
                    AppImages.meetings,
                    height: 29,
                    width: 29,
                    color: _dashboardController.pageIndex.value == 3
                        ? AppColors.primary
                        : AppColors.white,
                  ),
                  Image.asset(
                    AppImages.searchMail,
                    height: 29,
                    width: 29,
                    color: _dashboardController.pageIndex.value == 4
                        ? AppColors.primary
                        : AppColors.white,
                  ),
                ],
                color: AppColors.primary,
                buttonBackgroundColor: Colors.white,
                backgroundColor: Colors.transparent,
                animationCurve: Curves.easeInOut,
                animationDuration: const Duration(milliseconds: 600),
                onTap: (index) => _dashboardController.onItemSelected(index),
                letIndexChange: (index) => true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
