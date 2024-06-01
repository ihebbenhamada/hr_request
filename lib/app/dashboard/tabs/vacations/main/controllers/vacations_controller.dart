import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/models/vacation.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-form/screens/vacations_form_screen.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../../../config/image_urls/image_urls.dart';
import '../models/get_update_response.dart';
import '../services/vacations_service.dart';

class VacationsController extends BaseController {
  /// SERVICES
  final VacationsService _vacationsService = VacationsService();

  /// CONTROLLERS

  /// VARIABLES
  RxInt selectedFilter = 0.obs;
  RxInt currentVacationIndex = 0.obs;
  RxInt currentOfficialVacationIndex = 0.obs;
  RxList<Vacation> allVacationsList = <Vacation>[].obs;
  RxList<Vacation> pendingVacationsList = <Vacation>[].obs;
  RxList<Vacation> approvedVacationsList = <Vacation>[].obs;
  RxList<Vacation> rejectedVacationList = <Vacation>[].obs;

  RxList<Vacation> vacationsList = <Vacation>[].obs;
  final List<Map<String, dynamic>> officialVacationList = [
    {
      'title': 'National day',
      'date': '23 september',
    },
    {
      'title': 'Founding day',
      'date': '22 February',
    },
    {
      'title': 'Eid al-Adha',
      'date': '9-12 Dhul-Hijjah',
    },
    {
      'title': 'Eid al-Fitr',
      'date': '1-3 Shawwal',
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
    _vacationsService.getEmployeeVacations().then((value) {
      if (value != null) {
        leftDays.value = value.leftDays;
        takenDays.value = value.takenDays;
        vacationPercentage.value = value.vacationsPercentage;
        nextVacation.value = value.nextVacation;
        allVacationsList.value = value.all.map((e) {
          e.color = e.fKReqStatusId == 10
              ? AppColors.gray5
              : e.fKReqStatusId == 11
                  ? AppColors.primary
                  : AppColors.redLight;
          e.icon = e.fKReqStatusId == 10
              ? AppImages.progress
              : e.fKReqStatusId == 11
                  ? AppImages.doubleCheck
                  : AppImages.x;
          e.iconHeight = e.fKReqStatusId == 10
              ? 30.0
              : e.fKReqStatusId == 11
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
      AppInterceptor.hideLoader();
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
}
