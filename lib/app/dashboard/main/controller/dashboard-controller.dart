import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:request_hr/app/auth/login/models/login_response.dart';
import 'package:request_hr/app/bonus/main/screens/bonus_screen.dart';
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
import 'package:request_hr/widgets/search-bottom-sheet/search_bottom_sheet.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/image_urls/image_urls.dart';
import '../../../alert/main/screens/alert_screen.dart';
import '../../tabs/vacations/main/models/drop_down.dart';

class DashboardController extends BaseController {
  RxInt pageIndex = 2.obs;

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
    birthDate: "",
    fKHrBloodTypeId: 0,
    gender: 0,
    placeOfBirth: "",
    fKNationalityId: 0,
    fKDefReligionId: 0,
    fKSocialStatusId: 0,
    hasAirlineTicket: false,
    contractDueDate: "",
    branchName: "",
    contractStartDate: "",
    fKGeneralManagerId: 0,
    fKManagingDirectorId: 0,
    fKHumanResourcesManagerId: 0,
    fKDepartmentManagerId: 0,
    fKDirectorGeneralId: 0,
    jobName: "",
    issuerName: "",
    isActive: true,
    creationDate: "",
    isDeleted: false,
    isDeveloper: false,
    fKCostcenterId: 0,
    fKCreatorId: 0,
    fKModifiedById: 0,
    lastModifiedDate: "",
  ).obs;

  Rx<Color> decisionsIconColor = AppColors.white.obs;
  Rx<Color> vacationsIconColor = AppColors.white.obs;
  Rx<Color> innTechIconColor = AppColors.white.obs;
  Rx<Color> meetingIconColor = AppColors.white.obs;
  Rx<Color> searchIconColor = AppColors.white.obs;
  Rx<DateTime> dateFrom = DateTime.now().obs;
  Rx<DateTime> dateTo = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day + 1,
  ).obs;
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

  final List<DropDownModel> companyList = [
    DropDownModel(disabled: false, text: 'Choose', value: '0'),
    DropDownModel(disabled: false, text: 'Annual', value: '1'),
    DropDownModel(disabled: false, text: 'Monthly', value: '2'),
    DropDownModel(disabled: false, text: 'Weekly', value: '3'),
    DropDownModel(disabled: false, text: 'daily', value: '4'),
  ];
  final List<DropDownModel> departmentsList = [
    DropDownModel(disabled: false, text: 'Choose', value: '0'),
    DropDownModel(disabled: false, text: 'Annual', value: '1'),
    DropDownModel(disabled: false, text: 'Monthly', value: '2'),
    DropDownModel(disabled: false, text: 'Weekly', value: '3'),
    DropDownModel(disabled: false, text: 'daily', value: '4'),
  ];
  late Rx<DropDownModel> selectedCompany;
  late Rx<DropDownModel> selectedDepartment;

  onItemSelected(int index) {
    switch (index) {
      case 0:
        pageIndex.value = index;
        decisionsIconColor.value = AppColors.primary;
        vacationsIconColor.value = AppColors.white;
        innTechIconColor.value = AppColors.white;
        meetingIconColor.value = AppColors.white;
        searchIconColor.value = AppColors.white;
        break;
      case 1:
        pageIndex.value = index;
        vacationsIconColor.value = AppColors.primary;
        searchIconColor.value = AppColors.white;
        innTechIconColor.value = AppColors.white;
        meetingIconColor.value = AppColors.white;
        decisionsIconColor.value = AppColors.white;
        break;
      case 2:
        pageIndex.value = index;
        innTechIconColor.value = AppColors.primary;
        searchIconColor.value = AppColors.white;
        vacationsIconColor.value = AppColors.white;
        decisionsIconColor.value = AppColors.white;
        meetingIconColor.value = AppColors.white;
        break;
      case 3:
        pageIndex.value = index;
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
        pageIndex.value = pageIndex.value;
        Get.bottomSheet(
          SearchBottomSheet(
            dateFrom: dateFrom,
            dateTo: dateTo,
            selectDate: (context, value) => selectDate(context, value),
            companyList: companyList,
            selectedCompany: selectedCompany,
            departmentsList: departmentsList,
            selectedDepartment: selectedDepartment,
            onSelectCompany: (value) => onSelectCompany(value),
            onSelectDepartment: (value) => onSelectDepartment(value),
          ),
          barrierColor: AppColors.primary.withOpacity(0.54),
          isDismissible: false,
          enableDrag: false,
        );
        break;
      default:
        break;
    }
  }

  onTapDrawer(int index) {
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
        searchIconColor.value = AppColors.white;
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
        searchIconColor.value = AppColors.white;
        meetingIconColor.value = AppColors.white;
        break;
      case 6:
        // Navigate to Bonus
        Get.back();
        pageIndex.value = 2;
        Get.to(() => BonusScreen());
        innTechIconColor.value = AppColors.primary;
        searchIconColor.value = AppColors.white;
        vacationsIconColor.value = AppColors.white;
        searchIconColor.value = AppColors.white;
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
        searchIconColor.value = AppColors.white;
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
        searchIconColor.value = AppColors.white;
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
        searchIconColor.value = AppColors.white;
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
        searchIconColor.value = AppColors.white;
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
        searchIconColor.value = AppColors.white;
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
        searchIconColor.value = AppColors.white;
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
        searchIconColor.value = AppColors.white;
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
        searchIconColor.value = AppColors.white;
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
        searchIconColor.value = AppColors.white;
        meetingIconColor.value = AppColors.white;
        break;

      default:
        Get.back();
        pageIndex.value = 1;
    }
  }

  @override
  void onInit() {
    initView();
    super.onInit();
  }

  initView() {
    innTechIconColor.value = AppColors.primary;
    searchIconColor.value = AppColors.white;
    vacationsIconColor.value = AppColors.white;
    searchIconColor.value = AppColors.white;
    meetingIconColor.value = AppColors.white;
    selectedCompany = companyList[0].obs;
    selectedDepartment = departmentsList[0].obs;
    employee.value = Emp.fromJson(GetStorage().read('employee'));
  }

  /// FUNCTIONS
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
  onSelectCompany(DropDownModel value) {
    selectedCompany.value = value;
  }

  onSelectDepartment(DropDownModel value) {
    selectedDepartment.value = value;
  }

  void selectDate(
    BuildContext context,
    String selectedDate,
  ) async {
    final DateTime? pickedDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary, // header background color
              onPrimary: AppColors.white, // header text color
              onSurface: AppColors.black, // body text color
            ),
            textTheme: Theme.of(context).textTheme.copyWith(
                  bodyLarge: TextStyle(fontSize: 14.sp),
                ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.black, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (selectedDate == 'from') {
      if (pickedDate != null && pickedDate != dateFrom.value) {
        dateFrom.value = pickedDate;
      }
    } else {
      if (pickedDate != null && pickedDate != dateTo.value) {
        dateTo.value = pickedDate;
      }
    }
  }
}
