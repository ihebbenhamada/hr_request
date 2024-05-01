import 'package:carousel_slider/carousel_options.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/bonus/bonus-details/screens/bonus_details_screen.dart';
import 'package:request_hr/app/bonus/main/models/bonus_chart.dart';
import 'package:request_hr/app/bonus/main/models/bonus_response.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/bonus_service.dart';

class BonusController extends BaseController {
  /// SERVICES
  final BonusService _bonusService = BonusService();

  /// CONTROLLERS

  /// VARIABLES
  RxInt currentBonus = 0.obs;
  RxInt selectedChart = 0.obs;
  RxInt showingTooltip = 1.obs;
  RxList<BonusResponse> bonusList = <BonusResponse>[].obs;
  RxList<BonusChart> bonusChart = <BonusChart>[].obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  getBonusList() {
    AppInterceptor.showLoader();
    _bonusService.getBonusList().then((value) {
      if (value != null) {
        bonusList.value = value;
      }
    });
  }

  getBonusChart() {
    _bonusService.getBonusChart().then((value) {
      if (value != null) {
        bonusChart.value = value;
      }
      AppInterceptor.hideLoader();
    });
  }

  /// INITIALISATION
  void initValues() {
    getBonusList();
    getBonusChart();
  }

  /// FUNCTIONS
  onClickItemBonus() {
    Get.to(
      () => BonusDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  void navigateAndRefresh() async {
    final result = await Get.to(
      () => BonusDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
    if (result != null) {
      getBonusList();
    }
  }

  onChangeBonusCarousel(int index, CarouselPageChangedReason reason) {
    currentBonus.value = index;
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
