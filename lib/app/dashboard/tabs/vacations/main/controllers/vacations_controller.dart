import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-form/screens/vacations_form_screen.dart';
import 'package:request_hr/config/colors/colors.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../../../config/image_urls/image_urls.dart';
import '../services/vacations_service.dart';

class VacationsController extends BaseController {
  /// SERVICES
  final VacationsService _vacationsService = VacationsService();

  /// CONTROLLERS

  /// VARIABLES
  RxInt selectedFilter = 0.obs;
  RxInt currentVacationIndex = 0.obs;
  RxInt currentOfficialVacationIndex = 0.obs;
  final Map<String, dynamic> vacationsList = {
    'slide1': [
      {
        'title': 'Sick\nVacation',
        'icon': AppImages.doubleCheck,
        'start_date': '23-10-2023',
        'end_date': '24-10-2023',
        'color': AppColors.primary,
        'with_alert': true,
        'icon_height': 15.0,
      },
    ],
    'slide2': [
      {
        'title': 'Wedding\nVacation',
        'icon': AppImages.progress,
        'start_date': '23-10-2023',
        'end_date': '24-10-2023',
        'color': AppColors.gray5,
        'with_alert': false,
        'icon_height': 30.0,
      },
    ],
    'slide3': [
      {
        'title': 'Summer\nVacation',
        'icon': AppImages.x,
        'start_date': '23-10-2023',
        'end_date': '24-10-2023',
        'color': AppColors.redLight,
        'with_alert': false,
        'icon_height': 23.0,
      },
    ],
  };
  final Map<String, dynamic> officialVacationList = {
    'slide1': [
      {
        'title': 'National day',
        'icon': AppImages.doubleCheck,
        'date': '23-10-2023',
      },
    ],
    'slide2': [
      {
        'title': 'National day',
        'icon': AppImages.doubleCheck,
        'date': '23-10-2023',
      },
    ],
    'slide3': [
      {
        'title': 'National day',
        'icon': AppImages.doubleCheck,
        'date': '23-10-2023',
      },
    ],
  };

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  /// INITIALISATION
  void initValues() {}

  /// FUNCTIONS
  onSelectFilter(int index) {
    selectedFilter.value = index;
  }

  onChangeVacationList(int index, CarouselPageChangedReason reason) {
    currentVacationIndex.value = index;
  }

  onChangeOfficialVacationList(int index, CarouselPageChangedReason reason) {
    currentOfficialVacationIndex.value = index;
  }

  onClickVacationItem() {
    Get.to(
      id: 2,
      () => VacationsFormScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }
}
