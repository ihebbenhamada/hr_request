import 'package:carousel_slider/carousel_options.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:request_hr/app/alert/alert-details/screens/alert_details_screen.dart';
import 'package:request_hr/app/alert/main/models/alert_response.dart';
import 'package:request_hr/config/colors/colors.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../services/alert_service.dart';

class AlertController extends BaseController {
  /// SERVICES
  final AlertService _alertService = AlertService();

  /// CONTROLLERS

  /// VARIABLES
  RxInt currentAlert = 0.obs;
  RxInt selectedChart = 0.obs;
  Rx<AlertResponse> alertResponse = AlertResponse(alerts: [], chart: []).obs;
  RxInt showingTooltip = 1.obs;
  bool isAdmin = false;
  GetStorage storage = GetStorage();
  RxList<BarChartGroupData> barGroups = <BarChartGroupData>[].obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  /// INITIALISATION
  void initValues() {
    if (storage.read('isAdmin') != null) {
      isAdmin = storage.read('isAdmin');
    }
    getAlertsList();
  }

  /// FUNCTIONS
  getAlertsList() {
    AppInterceptor.showLoader();
    _alertService.getAlertsList().then((value) {
      if (value != null) {
        alertResponse.value = value;
        for (var i = 0; i < value.chart.length; i++) {
          barGroups.add(generateGroupData(i + 1, value.chart[i].count));
        }
      }
      AppInterceptor.hideLoader();
    });
  }

  void navigateAndRefresh() async {
    final result = await Get.to(
      () => AlertDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
    if (result != null) {
      getAlertsList();
    }
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

  Future<void> handleRefresh() async {
    barGroups.clear();
    getAlertsList();
  }
}
