import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../config/colors/colors.dart';
import '../../../../../../config/controllerConfig/base_controller.dart';
import '../models/dashboard_admin_model.dart';
import '../services/chairman_service.dart';

class ChairmanController extends BaseController
    with GetTickerProviderStateMixin {
  /// SERVICES
  final ChairmanService _chairmanService = ChairmanService();

  /// CONTROLLERS

  /// VARIABLES
  RxInt showingTooltip = 1.obs;
  RxInt vacationTakenPercentage = 40.obs;
  RxList<BarChartGroupData> barGroupsLowRated = <BarChartGroupData>[].obs;
  RxList<BarChartGroupData> barGroupsMostRated = <BarChartGroupData>[].obs;
  RxList<FlSpot> spots = <FlSpot>[].obs;

  Rx<DashboardAdminModel> dashboardAdminData = DashboardAdminModel(
    mostRatedEvaluations: [],
    lowRatedEvaluations: [],
    bonuStatistics: [],
    punishmentStatistics: [],
    yearVacations: [],
    totalAlerts: 0,
  ).obs;

  /// second chart
  List<Color> gradientColors = [
    AppColors.primary.withOpacity(0.5),
    AppColors.primary.withOpacity(0.5),
  ];

  bool showAvg = false;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  /// INITIALISATION
  void initValues() {
    getDashboardData();
  }

  /// FUNCTIONS
  getDashboardData() {
    _chairmanService.getDashboardAdmin().then((value) {
      if (value != null) {
        dashboardAdminData.value = value;
        for (int month = 1; month <= 12; month++) {
          bool monthExists = dashboardAdminData.value.bonuStatistics.any(
              (stat) =>
                  int.parse(stat.month) == month &&
                  int.parse(stat.year) == 2024);
          if (!monthExists) {
            dashboardAdminData.value.bonuStatistics.add(Statistic(
                month: month.toString(), year: '2024', totalAmount: 0.0));
          }
        }
        dashboardAdminData.value.bonuStatistics
            .sort((a, b) => int.parse(a.month).compareTo(int.parse(b.month)));

        for (var i = 0;
            i < dashboardAdminData.value.lowRatedEvaluations.length;
            i++) {
          barGroupsLowRated.add(generateGroupData(
              i,
              dashboardAdminData.value.lowRatedEvaluations[i].degreeScale
                  .toInt()));
        }
        for (var i = 0;
            i < dashboardAdminData.value.mostRatedEvaluations.length;
            i++) {
          barGroupsMostRated.add(generateGroupData(
              i,
              dashboardAdminData.value.mostRatedEvaluations[i].degreeScale
                  .toInt()));
        }
        for (var i = 0;
            i < dashboardAdminData.value.bonuStatistics.length;
            i++) {
          spots.add(FlSpot((i).toDouble(),
              dashboardAdminData.value.bonuStatistics[i].totalAmount));
        }
      }
    });
  }

  Future<void> handleRefresh() async {
    getDashboardData();
  }

  var isLowRatedSelected = true.obs;
  var isBonusSelected = true.obs;

  void toggleMostRated() {
    isLowRatedSelected.value = false;
  }

  void toggleLowRated() {
    isLowRatedSelected.value = true;
  }

  void toggleBonus() {
    isBonusSelected.value = true;
  }

  void togglePunishment() {
    isBonusSelected.value = false;
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
}
