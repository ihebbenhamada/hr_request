import 'package:carousel_slider/carousel_options.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/alert/alert-details/screens/alert_details_screen.dart';
import 'package:request_hr/app/alert/main/models/alert_chart.dart';
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
  RxList<AlertResponse> alertList = <AlertResponse>[].obs;
  RxList<AlertChart> alertChart = <AlertChart>[].obs;
  RxInt showingTooltip = 1.obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  /// INITIALISATION
  void initValues() {
    getAlertsList();
    getAlertsChart();
  }

  /// FUNCTIONS
  getAlertsList() {
    AppInterceptor.showLoader();
    _alertService.getAlertsList().then((value) {
      if (value != null) {
        alertList.value = value;

        alertList.add(
          AlertResponse(
            id: 1,
            subject: "aaa",
            creationDate: "2024-04-10",
            isDeleted: false,
            imagePath: "",
            isActive: true,
            assigneeName: "iheb",
            byAssigneeName: "hobba",
            fKHrAssigneeById: 1,
            fKHrAssigneeId: 1,
            fKReqAlertId: 1,
            lastModifiedDate: "2024-04-20",
          ),
        );
      }
      AppInterceptor.hideLoader();
    });
  }

  getAlertsChart() {
    _alertService.getAlertsChart().then((value) {
      if (value != null) {
        alertChart.value = value;
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
}
