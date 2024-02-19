import 'package:carousel_slider/carousel_options.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/alert/alert-details/screens/alert_details_screen.dart';
import 'package:request_hr/config/colors/colors.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/image_urls/image_urls.dart';
import '../services/alert_service.dart';

class AlertController extends BaseController {
  /// SERVICES
  final AlertService _alertService = AlertService();

  /// CONTROLLERS

  /// VARIABLES
  RxInt currentAlert = 0.obs;
  RxInt selectedChart = 0.obs;
  final List<Map<String, dynamic>> carouselAlertList = [
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'employee_position': 'project Manager',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
      'editable': false,
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'employee_position': 'project Manager',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
      'editable': false,
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'employee_position': 'project Manager',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
      'editable': false,
    },
  ];
  RxInt showingTooltip = 1.obs;

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
  onClickCreateAlert() {
    Get.to(
      () => AlertDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  onClickItemAlert() {
    Get.to(
      () => AlertDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  onChangeAlertCarousel(int index, CarouselPageChangedReason reason) {
    currentAlert.value = index;
  }

  BarChartGroupData generateGroupData(int x, int y) {
    return BarChartGroupData(
      x: x,
      showingTooltipIndicators: showingTooltip.value == x ? [0] : [],
      barRods: [
        BarChartRodData(
          toY: y.toDouble(),
          color: AppColors.blue2,
          width: 15,
          borderRadius: BorderRadius.circular(8),
        ),
      ],
    );
  }

  onSelectChart(int index) {
    selectedChart.value = index;
  }
}
