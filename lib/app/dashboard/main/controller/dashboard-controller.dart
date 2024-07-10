import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:request_hr/app/auth/login/models/login_response.dart';
import 'package:request_hr/app/complaint/main/screens/complaint_screen.dart';
import 'package:request_hr/app/custody/main/screens/custody_screen.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-steps/main/screens/vacations_steps_screen.dart';
import 'package:request_hr/app/evaluations/main/screens/evaluations_screen.dart';
import 'package:request_hr/app/loan/main/screens/loan_screen.dart';
import 'package:request_hr/app/mail/main/screens/mail_screen.dart';
import 'package:request_hr/app/notification/screens/notifications_screen.dart';
import 'package:request_hr/app/punishments/main/screens/punishments_screen.dart';
import 'package:request_hr/app/purchase/main/screens/purchase_screen.dart';
import 'package:request_hr/app/settings/screens/settings_screen.dart';
import 'package:request_hr/app/sign-in-out/main/screens/sign_in_out_screen.dart';
import 'package:request_hr/app/ticket/main/screens/ticket_screen.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/image_urls/image_urls.dart';
import '../../../alert/main/screens/alert_screen.dart';

class DashboardController extends BaseController {
  ///VARIABLES
  RxInt pageIndex = 2.obs;
  RxBool isDecisionLoading = true.obs;
  RxBool isMeetingLoading = true.obs;
  RxBool isVacationLoading = true.obs;
  RxBool isBonusLoading = true.obs;
  final GetStorage storage = GetStorage();
  Rx<Emp> employee = Emp(
    id: 0,
    code: "",
    fullName: "",
    fullNameEn: "",
    idNumber: "",
    fKDefBranchId: 0,
    fKHrManagementId: 0,
    fKHrDepartmentId: 0,
    birthDate: DateTime.now().toString().substring(0, 10),
    fKHrBloodTypeId: 0,
    gender: 0,
    placeOfBirth: "",
    fKNationalityId: 0,
    fKDefReligionId: 0,
    fKSocialStatusId: 0,
    hasAirlineTicket: false,
    contractDueDate: DateTime.now().toString().substring(0, 10),
    branchName: "",
    contractStartDate: DateTime.now().toString().substring(0, 10),
    fKGeneralManagerId: 0,
    fKManagingDirectorId: 0,
    fKHumanResourcesManagerId: 0,
    fKDepartmentManagerId: 0,
    fKDirectorGeneralId: 0,
    jobName: "",
    issuerName: "",
    isActive: true,
    creationDate: DateTime.now().toString().substring(0, 10),
    isDeleted: false,
    isDeveloper: false,
    fKCostcenterId: 0,
    fKCreatorId: 0,
    fKModifiedById: 0,
    lastModifiedDate: DateTime.now().toString().substring(0, 10),
  ).obs;
  Rx<Color> decisionsIconColor = AppColors.white.obs;
  Rx<Color> vacationsIconColor = AppColors.white.obs;
  Rx<Color> innTechIconColor = AppColors.white.obs;
  Rx<Color> meetingIconColor = AppColors.white.obs;
  Rx<Color> searchIconColor = AppColors.white.obs;
  final List<Map<String, dynamic>> drawerItems = [
    {
      'title': 'dashboard',
      'icon': AppImages.dashboardDrawer,
      'icon_width': 35.0,
      'icon_height': 25.0,
    },
    {
      'title': 'decisions',
      'icon': AppImages.decisions,
      'icon_width': 30.5,
      'icon_height': 32.0,
    },
    {
      'title': 'vacations',
      'icon': AppImages.vacations,
      'icon_width': 30.0,
      'icon_height': 32.0,
    },
    {
      'title': 'final_exit',
      'icon': AppImages.exitDrawer,
      'icon_width': 22.0,
      'icon_height': 22.0,
    },
    {
      'title': 'evaluations',
      'icon': AppImages.evaluationsDrawer,
      'icon_width': 28.0,
      'icon_height': 22.5,
    },
    {
      'title': 'loan',
      'icon': AppImages.loanDrawer,
      'icon_width': 27.5,
      'icon_height': 26.0,
    },
    {
      'title': 'bonus',
      'icon': AppImages.bonusDrawer,
      'icon_width': 24.0,
      'icon_height': 24.0,
    },
    {
      'title': 'punishments',
      'icon': AppImages.punishmentsDrawer,
      'icon_width': 32.0,
      'icon_height': 32.0,
    },
    {
      'title': 'alerts',
      'icon': AppImages.alertWhiteDrawer,
      'icon_width': 28.5,
      'icon_height': 26.0,
    },
    {
      'title': 'messages',
      'icon': AppImages.messageDrawer,
      'icon_width': 26.0,
      'icon_height': 25.0,
    },
    {
      'title': 'meetings',
      'icon': AppImages.meetings,
      'icon_width': 29.0,
      'icon_height': 27.5,
    },
    {
      'title': 'complaint',
      'icon': AppImages.complaintDrawer,
      'icon_width': 29.5,
      'icon_height': 25.0,
    },
    {
      'title': 'ticket',
      'icon': AppImages.ticketMenuDrawer,
      'icon_width': 28.0,
      'icon_height': 28.5,
    },
    {
      'title': 'sign_in_out',
      'icon': AppImages.signOutDrawer,
      'icon_width': 23.5,
      'icon_height': 21.0,
    },
    {
      'title': 'custody',
      'icon': AppImages.custodyDrawer,
      'icon_width': 22.5,
      'icon_height': 28.0,
    },
    {
      'title': 'purchase',
      'icon': AppImages.purchaseDrawer,
      'icon_width': 20.20,
      'icon_height': 28.0,
    },
    {
      'title': 'settings',
      'icon': AppImages.settingDrawer,
      'icon_width': 24.0,
      'icon_height': 27.0,
    },
  ];

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initView();
    super.onInit();
  }

  /// FUNCTIONS
  initView() {
    innTechIconColor.value = AppColors.primary;
    searchIconColor.value = AppColors.white;
    vacationsIconColor.value = AppColors.white;
    searchIconColor.value = AppColors.white;
    meetingIconColor.value = AppColors.white;
    if (Get.arguments != null) {
      employee.value = Get.arguments;
    } else {
      employee.value = Emp.fromJson(GetStorage().read('employee'));
    }
  }

  onItemSelected(int index) {
    if (index != pageIndex.value) {
      Get.nestedKey(pageIndex.value + 1)
          ?.currentState
          ?.popUntil((route) => route.isFirst);
    }
    pageIndex.value = index;
    switch (index) {
      case 0:
        decisionsIconColor.value = AppColors.primary;
        vacationsIconColor.value = AppColors.white;
        innTechIconColor.value = AppColors.white;
        meetingIconColor.value = AppColors.white;
        searchIconColor.value = AppColors.white;
        break;
      case 1:
        vacationsIconColor.value = AppColors.primary;
        searchIconColor.value = AppColors.white;
        innTechIconColor.value = AppColors.white;
        meetingIconColor.value = AppColors.white;
        decisionsIconColor.value = AppColors.white;
        break;
      case 2:
        innTechIconColor.value = AppColors.primary;
        searchIconColor.value = AppColors.white;
        vacationsIconColor.value = AppColors.white;
        decisionsIconColor.value = AppColors.white;
        meetingIconColor.value = AppColors.white;
        break;
      case 3:
        meetingIconColor.value = AppColors.primary;
        searchIconColor.value = AppColors.white;
        vacationsIconColor.value = AppColors.white;
        innTechIconColor.value = AppColors.white;
        decisionsIconColor.value = AppColors.white;
        break;
      case 4:
        searchIconColor.value = AppColors.primary;
        vacationsIconColor.value = AppColors.white;
        innTechIconColor.value = AppColors.white;
        decisionsIconColor.value = AppColors.white;
        meetingIconColor.value = AppColors.white;
        break;
      default:
        break;
    }
  }

  onTapDrawer(int index) {
    Get.nestedKey(pageIndex.value + 1)
        ?.currentState
        ?.popUntil((route) => route.isFirst);
    switch (index) {
      case 0:
        // Navigate to Dashboard
        Get.back();
        pageIndex.value = 2;
        innTechIconColor.value = AppColors.primary;
        searchIconColor.value = AppColors.white;
        vacationsIconColor.value = AppColors.white;
        decisionsIconColor.value = AppColors.white;
        meetingIconColor.value = AppColors.white;
        break;
      case 1:
        // Navigate to Decision
        Get.back();
        pageIndex.value = 0;
        decisionsIconColor.value = AppColors.primary;
        vacationsIconColor.value = AppColors.white;
        innTechIconColor.value = AppColors.white;
        meetingIconColor.value = AppColors.white;
        searchIconColor.value = AppColors.white;
        break;
      case 2:
        // Navigate vacation
        Get.back();
        pageIndex.value = 1;
        vacationsIconColor.value = AppColors.primary;
        searchIconColor.value = AppColors.white;
        innTechIconColor.value = AppColors.white;
        meetingIconColor.value = AppColors.white;
        decisionsIconColor.value = AppColors.white;
        break;
      case 3:
        // Navigate to final exit
        Get.back();
        pageIndex.value = 1;
        Get.to(() => VacationsStepsScreen());
        vacationsIconColor.value = AppColors.primary;
        searchIconColor.value = AppColors.white;
        innTechIconColor.value = AppColors.white;
        meetingIconColor.value = AppColors.white;
        decisionsIconColor.value = AppColors.white;
        break;
      case 4:
        // Navigate to evaluation
        Get.back();
        pageIndex.value = 2;
        Get.to(() => EvaluationsScreen());
        innTechIconColor.value = AppColors.primary;
        searchIconColor.value = AppColors.white;
        vacationsIconColor.value = AppColors.white;
        decisionsIconColor.value = AppColors.white;
        meetingIconColor.value = AppColors.white;
        break;
      case 5:
        // Navigate to loan
        Get.back();
        pageIndex.value = 2;
        Get.to(() => LoanScreen());
        innTechIconColor.value = AppColors.primary;
        searchIconColor.value = AppColors.white;
        vacationsIconColor.value = AppColors.white;
        decisionsIconColor.value = AppColors.white;
        meetingIconColor.value = AppColors.white;
        break;
      case 6:
        // Navigate to Bonus
        Get.back();
        pageIndex.value = 4;
        searchIconColor.value = AppColors.primary;
        innTechIconColor.value = AppColors.white;
        vacationsIconColor.value = AppColors.white;
        decisionsIconColor.value = AppColors.white;
        meetingIconColor.value = AppColors.white;
        break;
      case 7:
        // Navigate to punishments
        Get.back();
        pageIndex.value = 2;
        Get.to(() => PunishmentsScreen());
        innTechIconColor.value = AppColors.primary;
        searchIconColor.value = AppColors.white;
        vacationsIconColor.value = AppColors.white;
        decisionsIconColor.value = AppColors.white;
        meetingIconColor.value = AppColors.white;
        break;
      case 8:
        // Navigate to Alerts
        Get.back();
        pageIndex.value = 2;
        Get.to(() => AlertScreen());
        innTechIconColor.value = AppColors.primary;
        searchIconColor.value = AppColors.white;
        vacationsIconColor.value = AppColors.white;
        decisionsIconColor.value = AppColors.white;
        meetingIconColor.value = AppColors.white;
        break;
      case 9:
        // Navigate to messages
        Get.back();
        pageIndex.value = 2;
        Get.to(() => MailScreen());
        innTechIconColor.value = AppColors.primary;
        searchIconColor.value = AppColors.white;
        vacationsIconColor.value = AppColors.white;
        decisionsIconColor.value = AppColors.white;
        meetingIconColor.value = AppColors.white;
        break;
      case 10:
        // Navigate to meetings
        Get.back();
        pageIndex.value = 3;
        meetingIconColor.value = AppColors.primary;
        searchIconColor.value = AppColors.white;
        vacationsIconColor.value = AppColors.white;
        innTechIconColor.value = AppColors.white;
        decisionsIconColor.value = AppColors.white;
        break;
      case 11:
        // Navigate to complaint
        Get.back();
        pageIndex.value = 2;
        Get.to(() => ComplaintScreen());
        innTechIconColor.value = AppColors.primary;
        searchIconColor.value = AppColors.white;
        vacationsIconColor.value = AppColors.white;
        decisionsIconColor.value = AppColors.white;
        meetingIconColor.value = AppColors.white;
        break;
      case 12:
        // Navigate to ticket
        Get.back();
        pageIndex.value = 2;
        Get.to(() => TicketScreen());
        innTechIconColor.value = AppColors.primary;
        searchIconColor.value = AppColors.white;
        vacationsIconColor.value = AppColors.white;
        decisionsIconColor.value = AppColors.white;
        meetingIconColor.value = AppColors.white;
        break;
      case 13:
        // Navigate to sign out
        Get.back();
        pageIndex.value = 2;
        Get.to(() => SignInOutScreen());
        innTechIconColor.value = AppColors.primary;
        searchIconColor.value = AppColors.white;
        vacationsIconColor.value = AppColors.white;
        decisionsIconColor.value = AppColors.white;
        meetingIconColor.value = AppColors.white;
        break;
      case 14:
        // Navigate to custody
        Get.back();
        pageIndex.value = 2;
        Get.to(() => CustodyScreen());
        innTechIconColor.value = AppColors.primary;
        searchIconColor.value = AppColors.white;
        vacationsIconColor.value = AppColors.white;
        decisionsIconColor.value = AppColors.white;
        meetingIconColor.value = AppColors.white;
        break;
      case 15:
        // Navigate to purchase
        Get.back();
        pageIndex.value = 2;
        Get.to(() => PurchaseScreen());
        innTechIconColor.value = AppColors.primary;
        searchIconColor.value = AppColors.white;
        vacationsIconColor.value = AppColors.white;
        decisionsIconColor.value = AppColors.white;
        meetingIconColor.value = AppColors.white;
        break;
      case 16:
        // Navigate to settings
        Get.back();
        pageIndex.value = 2;
        Get.to(() => SettingsScreen());
        innTechIconColor.value = AppColors.primary;
        searchIconColor.value = AppColors.white;
        vacationsIconColor.value = AppColors.white;
        decisionsIconColor.value = AppColors.white;
        meetingIconColor.value = AppColors.white;
        break;

      default:
        Get.back();
        pageIndex.value = 1;
    }
  }

  onClickDrawer(GlobalKey<ScaffoldState> scaffoldKey) {
    scaffoldKey.currentState!.openDrawer();
  }

  onClickMessage() {
    Get.to(
      () => MailScreen(),
      transition: Transition.downToUp,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  onClickNotification() {
    Get.to(
      () => NotificationsScreen(),
      transition: Transition.downToUp,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  onClickProfile() {}

  @override
  void onReady() {
    AppInterceptor.showLoader();
    super.onReady();
  }
}
