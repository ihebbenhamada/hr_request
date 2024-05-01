import 'dart:developer';
import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/decisions/decision-details/screens/decisions_details_screen.dart';
import 'package:request_hr/app/dashboard/tabs/home/screens/home_screen.dart';
import 'package:request_hr/app/dashboard/tabs/meetings/main/screens/meetings_screen.dart';
import 'package:request_hr/app/dashboard/tabs/meetings/meetings-details/screens/meetings_details_screen.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/screens/vacations_screen.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-form/screens/vacations_form_screen.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/constants/navigation_ids.dart';
import 'package:request_hr/routes/app_bindings.dart';
import 'package:request_hr/routes/routing.dart';

import '../../../../config/image_urls/image_urls.dart';
import '../../../../config/theme/theme_controller.dart';
import '../../../../widgets/drawer-grid-item/drawer_grid_item.dart';
import '../../../../widgets/footer/footer.dart';
import '../../../../widgets/header-drawer/header_drawer.dart';
import '../../../../widgets/header/header.dart';
import '../../tabs/decisions/main/screens/decisions_screen.dart';
import '../controller/dashboard-controller.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  final _dashboardController = Get.put(DashboardController());
  final ThemeController themeController = Get.find();
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey =
      GlobalKey<CurvedNavigationBarState>();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: SafeArea(
        top: false,
        child: ClipRRect(
          child: Obx(
            () => Scaffold(
              key: scaffoldKey,
              extendBody: true,
              backgroundColor: AppColors.gray2,
              body: Column(
                children: [
                  20.h.verticalSpace,
                  Header(
                    onClickProfile: _dashboardController.onClickProfile,
                    onClickMenu: () =>
                        _dashboardController.onClickDrawer(scaffoldKey),
                    onClickMessage: _dashboardController.onClickMessage,
                    onClickNotification:
                        _dashboardController.onClickNotification,
                  ),
                  Expanded(
                    child: IndexedStack(
                      index: _dashboardController.pageIndex.value,
                      children: [
                        Navigator(
                          key: Get.nestedKey(nestedNavigationDecisionId),
                          initialRoute: AppRoutes.decisions,
                          reportsRouteUpdateToEngine: true,
                          onGenerateRoute: (routeSettings) {
                            if (routeSettings.name == AppRoutes.decisions) {
                              return GetPageRoute(
                                routeName: AppRoutes.decisions,
                                page: () => DecisionsScreen(),
                                binding: DecisionsPageBindings(),
                              );
                            } else if (routeSettings.name ==
                                AppRoutes.decisionsDetails) {
                              return GetPageRoute(
                                routeName: AppRoutes.decisionsDetails,
                                page: () => DecisionsDetailsScreen(),
                                binding: DecisionsDetailsPageBindings(),
                              );
                            }
                            return null;
                          },
                        ),
                        Navigator(
                          key: Get.nestedKey(nestedNavigationVacationId),
                          initialRoute: AppRoutes.vacations,
                          onGenerateRoute: (routeSettings) {
                            if (routeSettings.name == AppRoutes.vacations) {
                              Get.routing.args = routeSettings.arguments;
                              return GetPageRoute(
                                settings: routeSettings,
                                routeName: AppRoutes.vacations,
                                page: () => VacationsScreen(),
                                binding: VacationPageBindings(),
                              );
                            } else if (routeSettings.name ==
                                AppRoutes.vacationsForm) {
                              Get.routing.args = routeSettings.arguments;

                              log(routeSettings.arguments.toString());
                              return GetPageRoute(
                                settings: routeSettings,
                                routeName: AppRoutes.vacationsForm,
                                page: () => VacationsFormScreen(),
                                binding: VacationsFormPageBindings(),
                              );
                            }
                            return null;
                          },
                        ),
                        Navigator(
                          key: Get.nestedKey(nestedNavigationHomeId),
                          initialRoute: AppRoutes.home,
                          onGenerateRoute: (routeSettings) {
                            if (routeSettings.name == AppRoutes.home) {
                              return GetPageRoute(
                                routeName: AppRoutes.home,
                                page: () => HomeScreen(),
                                binding: HomePageBindings(),
                              );
                            }
                            return null;
                          },
                        ),
                        Navigator(
                          key: Get.nestedKey(nestedNavigationMeetingsId),
                          initialRoute: AppRoutes.meetings,
                          onGenerateRoute: (routeSettings) {
                            if (routeSettings.name == AppRoutes.meetings) {
                              return GetPageRoute(
                                routeName: AppRoutes.meetings,
                                page: () => MeetingsScreen(),
                                binding: MeetingsPageBindings(),
                              );
                            } else if (routeSettings.name ==
                                AppRoutes.meetingsDetails) {
                              return GetPageRoute(
                                routeName: AppRoutes.meetingsDetails,
                                page: () => MeetingsDetailsScreen(),
                                binding: MeetingsDetailsPageBindings(),
                              );
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              drawer: Drawer(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.primary,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 25,
                      right: 25,
                      bottom: 10.h,
                      top: MediaQuery.of(context).viewPadding.top + 10.h,
                    ),
                    child: Column(
                      children: [
                        HeaderDrawer(
                          closeDrawer: () {
                            scaffoldKey.currentState!.closeDrawer();
                          },
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(
                              top: 9.h,
                              left: 9.h,
                              bottom: 9.h,
                            ),
                            decoration: const BoxDecoration(
                              color: AppColors.blueDark,
                              image: DecorationImage(
                                image: AssetImage(AppImages.poster),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '21Dec., 2024',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                14.h.verticalSpace,
                                Row(
                                  children: [
                                    Container(
                                      height: 25.h,
                                      width: 25.h,
                                      decoration: const ShapeDecoration(
                                        shape: OvalBorder(),
                                        color: AppColors.primary,
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          AppImages.startJob,
                                          height: 13.h,
                                          width: 13.h,
                                        ),
                                      ),
                                    ),
                                    5.horizontalSpace,
                                    Text(
                                      'Start Job: 22-3-2023',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                5.h.verticalSpace,
                                Row(
                                  children: [
                                    Container(
                                      height: 25.h,
                                      width: 25.h,
                                      decoration: const ShapeDecoration(
                                        shape: OvalBorder(),
                                        color: AppColors.primary,
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          AppImages.codeEmployee,
                                          height: 13.h,
                                          width: 13.h,
                                        ),
                                      ),
                                    ),
                                    5.horizontalSpace,
                                    Text(
                                      'Job Code: 54545',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        10.h.verticalSpace,
                        GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 8.h,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1.3,
                          ),
                          padding: const EdgeInsets.only(left: 10.0, right: 10),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true, // padding around the grid
                          itemCount: _dashboardController
                              .drawerItems.length, // total number of items
                          itemBuilder: (context, index) {
                            Map<String, dynamic> item =
                                _dashboardController.drawerItems[index];
                            return DrawerGridItem(
                              title: item['title'],
                              icon: item['icon'],
                              iconWidth: item['icon_width'],
                              iconHeight: item['icon_height'],
                              onTap: () =>
                                  _dashboardController.onTapDrawer(index),
                            );
                          },
                        ),
                        const Expanded(child: Footer()),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: CurvedNavigationBar(
                key: bottomNavigationKey,
                index: _dashboardController.pageIndex.value,
                height: Platform.isIOS ? 50.h : 64.h,
                items: <Widget>[
                  Image.asset(AppImages.decisions,
                      height: 29.h,
                      width: 29.h,
                      color: _dashboardController.decisionsIconColor.value),
                  Image.asset(AppImages.vacations,
                      height: 29.h,
                      width: 29.h,
                      color: _dashboardController.vacationsIconColor.value),
                  Image.asset(AppImages.innTechLogo,
                      height: 29.h,
                      width: 29.h,
                      color: _dashboardController.innTechIconColor.value),
                  Image.asset(AppImages.meetings,
                      height: 29,
                      width: 29,
                      color: _dashboardController.meetingIconColor.value),
                  Image.asset(
                    AppImages.searchMail,
                    height: 29.h,
                    width: 29.h,
                    color: _dashboardController.searchIconColor.value,
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
