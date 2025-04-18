import 'dart:developer';

import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/models/vacation.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/show_all_vacations/screens/show_all_vacations_screen.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-form/screens/vacations_form_screen.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../../../config/image_urls/image_urls.dart';
import '../../../../main/controller/dashboard-controller.dart';
import '../models/get_employee_vacations_response.dart';
import '../models/get_update_response.dart';
import '../services/vacations_service.dart';

class VacationsController extends BaseController {
  /// SERVICES
  final VacationsService _vacationsService = VacationsService();

  /// CONTROLLERS
  final DashboardController _dashboardController = Get.find();

  /// VARIABLES
  RxInt selectedFilter = 0.obs;
  RxInt currentVacationIndex = 0.obs;
  RxInt currentOfficialVacationIndex = 0.obs;
  RxList<Vacation> allVacationsList = <Vacation>[].obs;
  RxList<Vacation> pendingVacationsList = <Vacation>[].obs;
  RxList<Vacation> approvedVacationsList = <Vacation>[].obs;
  RxList<Vacation> rejectedVacationList = <Vacation>[].obs;
  RxList<Vacation> vacationsList = <Vacation>[].obs;
  Rx<EmployeeVacations> empVacRes = EmployeeVacations(
    all: [],
    pending: [],
    approved: [],
    rejected: [],
    vacationsPercentage: 0.0,
    takenDays: 0,
    leftDays: 0,
    nextVacation: '',
  ).obs;
  final List<Map<String, dynamic>> officialVacationList = [
    {
      'title': 'national_day',
      'date': 'national_day_date',
    },
    {
      'title': 'founding_day',
      'date': 'founding_day_date',
    },
    {
      'title': 'eid_al_adha',
      'date': 'eid_al_adha_date',
    },
    {
      'title': 'eid_al_fitr',
      'date': 'eid_al_fitr_date',
    },
  ];
  RxDouble takenDays = 0.0.obs;
  RxDouble leftDays = 0.0.obs;
  RxDouble vacationPercentage = 0.0.obs;
  RxString nextVacation = "".obs;
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
    getListVacations();
  }

  getListVacations() {
    _vacationsService.getEmployeeVacations().then((value) async {
      if (value != null) {
        empVacRes.value = value;
        leftDays.value = value.leftDays;
        takenDays.value = value.takenDays;
        vacationPercentage.value = value.vacationsPercentage;
        nextVacation.value = value.nextVacation.toLowerCase().contains("no")
            ? "No vacations"
            : value.nextVacation;
        allVacationsList.value = await value.all.map((e) {
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
        pendingVacationsList.value = await value.pending.map((e) {
          e.color = AppColors.gray5;
          e.icon = AppImages.progress;
          e.iconHeight = 30.0;
          e.withAlert = false;
          return e;
        }).toList();
        approvedVacationsList.value = await value.approved.map((e) {
          e.color = AppColors.primary;
          e.icon = AppImages.doubleCheck;
          e.iconHeight = 15.0;
          e.withAlert = true;
          return e;
        }).toList();
        rejectedVacationList.value = await value.rejected.map((e) {
          e.color = AppColors.redLight;
          e.icon = AppImages.x;
          e.iconHeight = 23.0;
          e.withAlert = false;
          return e;
        }).toList();
        onSelectFilter(selectedFilter.value);
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
    log(index.toString());
    currentVacationIndex.value = index;
  }

  onChangeOfficialVacationList(int index, CarouselPageChangedReason reason) {
    currentOfficialVacationIndex.value = index;
  }

  onClickVacationItem(int id) {
    AppInterceptor.showLoader();
    _vacationsService.getUpdateVacation(vacationId: id).then((value) async {
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

  Future<void> handleRefresh() async {
    AppInterceptor.showLoader();
    getListVacations();
  }

  handleShowAll() {
    Get.to(
      () => ShowAllVacationsScreen(),
      arguments: [empVacRes.value, selectedFilter.value],
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }
}
