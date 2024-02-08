import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:request_hr/app/dashboard/tabs/home/screens/home_screen.dart';
import 'package:request_hr/app/dashboard/tabs/mail/screens/mail_screen.dart';
import 'package:request_hr/app/dashboard/tabs/meetings/screens/meetings_screen.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/screens/vacations_screen.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/image_urls/image_urls.dart';
import '../../tabs/decisions/main/screens/decisions_screen.dart';

class DashboardController extends BaseController {
  RxInt pageIndex = 2.obs;
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GetStorage storage = GetStorage();
  final List<Map<String, dynamic>> drawerItems = [
    {
      'title': 'Dashboard',
      'icon': AppImages.dashboardDrawer,
      'icon_width': 35.0,
      'icon_height': 25.0,
    },
    {
      'title': 'Decisions',
      'icon': AppImages.decisions,
      'icon_width': 30.5,
      'icon_height': 32.0,
    },
    {
      'title': 'Vacations',
      'icon': AppImages.vacations,
      'icon_width': 30.0,
      'icon_height': 32.0,
    },
    {
      'title': '  Final Exit',
      'icon': AppImages.exitDrawer,
      'icon_width': 22.0,
      'icon_height': 22.0,
    },
    {
      'title': 'Evaluations',
      'icon': AppImages.evaluationsDrawer,
      'icon_width': 28.0,
      'icon_height': 22.5,
    },
    {
      'title': 'Loan',
      'icon': AppImages.loanDrawer,
      'icon_width': 27.5,
      'icon_height': 26.0,
    },
    {
      'title': 'Bonus',
      'icon': AppImages.bonusDrawer,
      'icon_width': 24.0,
      'icon_height': 24.0,
    },
    {
      'title': 'Punishments',
      'icon': AppImages.punishmentsDrawer,
      'icon_width': 32.0,
      'icon_height': 32.0,
    },
    {
      'title': ' Alerts',
      'icon': AppImages.alertWhiteDrawer,
      'icon_width': 28.5,
      'icon_height': 26.0,
    },
    {
      'title': 'Messages',
      'icon': AppImages.messageDrawer,
      'icon_width': 26.0,
      'icon_height': 25.0,
    },
    {
      'title': 'Meetings',
      'icon': AppImages.meetings,
      'icon_width': 29.0,
      'icon_height': 27.5,
    },
    {
      'title': 'Complaint',
      'icon': AppImages.complaintDrawer,
      'icon_width': 29.5,
      'icon_height': 25.0,
    },
    {
      'title': 'Ticket',
      'icon': AppImages.ticketMenuDrawer,
      'icon_width': 28.0,
      'icon_height': 28.5,
    },
    {
      'title': 'Sign in & out',
      'icon': AppImages.signOutDrawer,
      'icon_width': 23.5,
      'icon_height': 21.0,
    },
    {
      'title': 'Custody',
      'icon': AppImages.custodyDrawer,
      'icon_width': 22.5,
      'icon_height': 28.0,
    },
    {
      'title': 'Purchase ',
      'icon': AppImages.purchaseDrawer,
      'icon_width': 20.20,
      'icon_height': 28.0,
    },
    {
      'title': 'Setting',
      'icon': AppImages.settingDrawer,
      'icon_width': 24.0,
      'icon_height': 27.0,
    },
  ];

  onItemSelected(int index) {
    pageIndex.value = index;
    update();
  }

  void navigateToPage(int index, BuildContext context) {
    Navigator.of(context).pop(); // Close the drawer if open
    pageIndex.value = index;
    update();
    // Navigate to the selected page
    switch (index) {
      case 0:
        // Navigate to Home Page
        Get.to(() => DecisionsScreen(), id: 1);
        break;
      case 1:
        // Navigate to Search Page
        Get.to(() => VacationsScreen(), id: 1);
        break;
      case 2:
        // Navigate to Search Page
        Get.to(() => HomeScreen(), id: 1);
        break;
      case 3:
        // Navigate to Search Page
        Get.to(() => MeetingsScreen(), id: 1);
        break;
      case 4:
        // Navigate to Profile Page
        Get.to(() => MailScreen(), id: 1);
        break;
    }
  }
}
