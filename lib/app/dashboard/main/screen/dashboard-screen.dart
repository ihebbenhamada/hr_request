import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:request_hr/app/auth/login/models/login_response.dart';
import 'package:request_hr/app/bonus/bonus-details/screens/bonus_details_screen.dart';
import 'package:request_hr/app/bonus/main/screens/bonus_screen.dart';
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
  DashboardScreen({
    super.key,
    this.employee,
  });
  final _dashboardController = Get.put(DashboardController());
  final ThemeController themeController = Get.find();
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey =
      GlobalKey<CurvedNavigationBarState>();
  final Emp? employee;

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
                  Platform.isIOS ? 0.h.verticalSpace : 20.h.verticalSpace,
                  Header(
                    onClickProfile: _dashboardController.onClickProfile,
                    onClickMenu: () =>
                        _dashboardController.onClickDrawer(scaffoldKey),
                    onClickMessage: _dashboardController.onClickMessage,
                    onClickNotification:
                        _dashboardController.onClickNotification,
                    image: employee?.imagePath ??
                        _dashboardController.employee.value.imagePath ??
                        AppImages.profile,
                    name: Get.locale?.languageCode == 'ar'
                        ? employee?.fullName != null
                            ? employee!.fullName
                            : _dashboardController.employee.value.fullName
                        : employee?.fullNameEn != null
                            ? employee!.fullNameEn
                            : _dashboardController.employee.value.fullNameEn,
                    job: Get.locale?.languageCode == 'ar'
                        ? employee?.jobName != null
                            ? employee!.jobName
                            : _dashboardController.employee.value.jobName
                        : employee?.jobName != null
                            ? employee!.jobName
                            : _dashboardController.employee.value.jobName,
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
                                page: () => const MeetingsDetailsScreen(),
                                binding: MeetingsDetailsPageBindings(),
                              );
                            }
                            return null;
                          },
                        ),
                        Navigator(
                          key: Get.nestedKey(nestedNavigationBonusId),
                          initialRoute: AppRoutes.bonus,
                          onGenerateRoute: (routeSettings) {
                            if (routeSettings.name == AppRoutes.bonus) {
                              return GetPageRoute(
                                routeName: AppRoutes.bonus,
                                page: () => BonusScreen(),
                                binding: BonusPageBindings(),
                              );
                            } else if (routeSettings.name ==
                                AppRoutes.bonusDetails) {
                              return GetPageRoute(
                                routeName: AppRoutes.bonusDetails,
                                page: () => BonusDetailsScreen(),
                                binding: BonusDetailsPageBindings(),
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
                      top: MediaQuery.of(context).viewPadding.top,
                    ),
                    child: Column(
                      children: [
                        HeaderDrawer(
                          image:
                              _dashboardController.employee.value.imagePath ??
                                  AppImages.profile,
                          name: Get.locale?.languageCode == 'ar'
                              ? employee?.fullName != null
                                  ? employee!.fullName
                                  : _dashboardController.employee.value.fullName
                              : employee?.fullNameEn != null
                                  ? employee!.fullNameEn
                                  : _dashboardController
                                      .employee.value.fullNameEn,
                          job: Get.locale?.languageCode == 'ar'
                              ? employee?.jobName != null
                                  ? employee!.jobName
                                  : _dashboardController.employee.value.jobName
                              : employee?.jobName != null
                                  ? employee!.jobName
                                  : _dashboardController.employee.value.jobName,
                          closeDrawer: () {
                            scaffoldKey.currentState!.closeDrawer();
                          },
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(
                              9.h,
                            ),
                            decoration: const BoxDecoration(
                              color: AppColors.blueDark,
                              image: DecorationImage(
                                image: AssetImage(AppImages.poster),
                                fit: BoxFit.cover,
                                matchTextDirection: true,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  employee?.contractDueDate != null
                                      ? DateFormat('ddMMM., yyyy').format(
                                          DateTime.parse(
                                            employee!.contractDueDate!,
                                          ),
                                        )
                                      : _dashboardController.employee.value
                                                  .contractDueDate !=
                                              null
                                          ? DateFormat('ddMMM., yyyy').format(
                                              DateTime.parse(
                                                _dashboardController.employee
                                                    .value.contractDueDate!,
                                              ),
                                            )
                                          : "--/--/---",
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
                                      '${'start_job'.tr}: ${employee?.contractStartDate != null ? DateFormat('dd-MM-yyyy').format(
                                          DateTime.parse(
                                            employee!.contractStartDate!,
                                          ),
                                        ) : _dashboardController.employee.value.contractStartDate != null ? DateFormat('dd-MM-yyyy').format(
                                          DateTime.parse(
                                            _dashboardController.employee.value
                                                .contractStartDate!,
                                          ),
                                        ) : "--/--/---"}',
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
                                      '${'job_code'.tr}: ${employee?.code != null ? employee!.code : _dashboardController.employee.value.code}',
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
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 8.h,
                              crossAxisSpacing: 10,
                              childAspectRatio: Platform.isIOS ? 1.3 : 1.2,
                            ),
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              right: 10,
                            ),
                            physics: const AlwaysScrollableScrollPhysics(),
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
                        ),
                        const Footer(),
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
                  Image.asset(
                    AppImages.decisions,
                    height: 29.h,
                    width: 29.h,
                    color: _dashboardController.decisionsIconColor.value,
                  ),
                  Image.asset(
                    AppImages.vacations,
                    height: 29.h,
                    width: 29.h,
                    color: _dashboardController.vacationsIconColor.value,
                  ),
                  Image.asset(
                    AppImages.innTechLogo,
                    height: 29.h,
                    width: 29.h,
                    color: _dashboardController.innTechIconColor.value,
                  ),
                  Image.asset(
                    AppImages.meetings,
                    height: 29,
                    width: 29,
                    color: _dashboardController.meetingIconColor.value,
                  ),
                  Image.asset(
                    AppImages.bonusDrawer,
                    height: 25.h,
                    width: 25.h,
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
