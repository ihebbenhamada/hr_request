import 'package:carousel_slider/carousel_options.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:request_hr/app/bonus/bonus-details/screens/bonus_details_screen.dart';
import 'package:request_hr/app/bonus/main/models/bonus_response.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../dashboard/main/controller/dashboard-controller.dart';
import '../services/bonus_service.dart';

class BonusController extends BaseController {
  /// SERVICES
  final BonusService _bonusService = BonusService();

  /// CONTROLLERS
  final DashboardController _dashboardController = Get.find();

  /// VARIABLES
  RxInt currentBonus = 0.obs;
  RxInt selectedChart = 0.obs;
  RxInt showingTooltip = 1.obs;
  Rx<BonusResponse> bonusResponse =
      BonusResponse(bonuses: [], chart: [], total: 0, percent: 0).obs;
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
    getBonusList();
  }

  /// FUNCTIONS
  getBonusList() {
    _bonusService.getBonus().then((value) {
      if (value != null) {
        bonusResponse.value = value;
        for (var i = 0; i < value.chart.length; i++) {
          barGroups.add(generateGroupData(i + 1, value.chart[i].count));
        }
      }
      _dashboardController.isBonusLoading.value = false;
      if (_dashboardController.isDecisionLoading.isFalse &&
          _dashboardController.isMeetingLoading.isFalse &&
          _dashboardController.isVacationLoading.isFalse) {
        AppInterceptor.hideLoader();
      }
    });
  }

  onClickItemBonus(Bonus bonus) {
    Get.to(
      () => BonusDetailsScreen(title: 'detail_bonus'),
      arguments: bonus,
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  void navigateAndRefresh() async {
    final result = await Get.to(
      () => BonusDetailsScreen(title: 'create_bonus'),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
    if (result != null) {
      barGroups.clear();
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

  Future<void> handleRefresh() async {
    barGroups.clear();
    getBonusList();
  }
}
