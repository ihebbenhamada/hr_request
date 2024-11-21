import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/models/get_employee_vacations_response.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/models/vacation.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-form/screens/vacations_form_screen.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../../../config/image_urls/image_urls.dart';
import '../../../../main/controller/dashboard-controller.dart';
import '../../main/models/get_update_response.dart';
import '../services/show_all_vacations_service.dart';

class ShowAllVacationsController extends BaseController {
  /// SERVICES
  final ShowAllVacationsService _showAllVacationsService =
      ShowAllVacationsService();

  /// CONTROLLERS
  final DashboardController _dashboardController = Get.find();

  /// VARIABLES
  RxInt selectedFilter = 0.obs;
  RxInt currentVacationIndex = 0.obs;
  RxList<Vacation> allVacationsList = <Vacation>[].obs;
  RxList<Vacation> pendingVacationsList = <Vacation>[].obs;
  RxList<Vacation> approvedVacationsList = <Vacation>[].obs;
  RxList<Vacation> rejectedVacationList = <Vacation>[].obs;

  RxList<Vacation> vacationsList = <Vacation>[].obs;
  GetUpdateVacationResponse? selectedVacation;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  /// INITIALISATION
  void initValues() {
    if (Get.arguments != null) {
      EmployeeVacations employeeVacations = Get.arguments[0];
      selectedFilter.value = Get.arguments[1];
      allVacationsList.value = employeeVacations.all;
      pendingVacationsList.value = employeeVacations.pending;
      approvedVacationsList.value = employeeVacations.approved;
      rejectedVacationList.value = employeeVacations.rejected;
      onSelectFilter(selectedFilter.value);
    }
  }

  getListVacations() {
    _showAllVacationsService.getEmployeeVacations().then((value) {
      if (value != null) {
        allVacationsList.value = value.all.map((e) {
          e.color = e.fKReqStatusId == 9
              ? AppColors.gray5
              : e.fKReqStatusId == 10
                  ? AppColors.primary
                  : AppColors.redLight;
          e.icon = e.fKReqStatusId == 9
              ? AppImages.progress
              : e.fKReqStatusId == 10
                  ? AppImages.doubleCheck
                  : AppImages.x;
          e.iconHeight = e.fKReqStatusId == 9
              ? 30.0
              : e.fKReqStatusId == 10
                  ? 15
                  : 23;
          e.withAlert = false;

          return e;
        }).toList();
        pendingVacationsList.value = value.pending.map((e) {
          e.color = AppColors.gray5;
          e.icon = AppImages.progress;
          e.iconHeight = 30.0;
          e.withAlert = false;
          return e;
        }).toList();
        approvedVacationsList.value = value.approved.map((e) {
          e.color = AppColors.primary;
          e.icon = AppImages.doubleCheck;
          e.iconHeight = 15.0;
          e.withAlert = true;
          return e;
        }).toList();
        rejectedVacationList.value = value.rejected.map((e) {
          e.color = AppColors.redLight;
          e.icon = AppImages.x;
          e.iconHeight = 23.0;
          e.withAlert = false;
          return e;
        }).toList();
        vacationsList.value = allVacationsList;
      }
      _dashboardController.isVacationLoading.value = false;
      if (_dashboardController.isDecisionLoading.isFalse &&
          _dashboardController.isMeetingLoading.isFalse &&
          _dashboardController.isBonusLoading.isFalse) {
        AppInterceptor.hideLoader();
      }
    });
  }

  /// FUNCTIONS
  onSelectFilter(int index) {
    selectedFilter.value = index;
    switch (index) {
      case 0:
        vacationsList.value = allVacationsList;
      case 1:
        vacationsList.value = pendingVacationsList;
      case 2:
        vacationsList.value = approvedVacationsList;
      case 3:
        vacationsList.value = rejectedVacationList;
      default:
        vacationsList.value = allVacationsList;
    }
  }

  onChangeVacationList(int index, CarouselPageChangedReason reason) {
    currentVacationIndex.value = index;
  }

  onClickVacationItem(int id) {
    AppInterceptor.showLoader();
    _showAllVacationsService
        .getUpdateVacation(vacationId: id)
        .then((value) async {
      if (value != null) {
        AppInterceptor.hideLoader();
        selectedVacation = value;
        final result = await Get.to(
          id: 2,
          () => VacationsFormScreen(),
          transition: Transition.leftToRight,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 500),
        ); //or use default navigation
        if (result != null) {
          getListVacations(); // call your own function here to refresh screen
        }
      }
    });
  }

  void navigateAndRefresh() async {
    selectedVacation = null;
    final result = await Get.to(
      () => VacationsFormScreen(from: 'showAll'),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    ); //or use default navigation
    if (result != null) {
      getListVacations(); // call your own function here to refresh screen
    }
  }

  Future<void> handleRefresh() async {
    AppInterceptor.showLoader();
    getListVacations();
  }
}
