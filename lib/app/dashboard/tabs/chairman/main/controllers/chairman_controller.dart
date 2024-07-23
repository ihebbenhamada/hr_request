import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

import '../../../../../../config/colors/colors.dart';
import '../../../../../../config/controllerConfig/base_controller.dart';
import '../models/bonus_chairman_chart.dart';
import '../models/rated_employee_chart.dart';
import '../services/chairman_service.dart';

class ChairmanController extends BaseController {
  /// SERVICES
  final ChairmanService _chairmanService = ChairmanService();

  /// CONTROLLERS

  /// VARIABLES
  RxInt showingTooltip = 1.obs;
  RxInt vacationTakenPercentage = 40.obs;
  RxList<BarChartGroupData> barGroups = <BarChartGroupData>[].obs;
  RxList<FlSpot> spots = <FlSpot>[].obs;

  List<RatedEmployeeChart> list = [
    RatedEmployeeChart(
        count: 100, name: 'Ahmed mohamed', image: AppImages.profile),
    RatedEmployeeChart(count: 80, name: 'Jana Ahmed', image: AppImages.profile),
    RatedEmployeeChart(count: 60, name: 'Ahmed Zaki', image: AppImages.profile),
    RatedEmployeeChart(
        count: 50, name: 'Ibrahim Ramzy', image: AppImages.profile),
    RatedEmployeeChart(
        count: 30, name: 'Mohamed Shazly', image: AppImages.profile),
    RatedEmployeeChart(
        count: 10, name: 'Faten Ahmed', image: AppImages.profile),
  ];
  List<ChairmanBonusChart> listBonus = [
    ChairmanBonusChart(count: 0, month: 1, monthName: 'Jun', year: '2024'),
    ChairmanBonusChart(count: 50, month: 2, monthName: 'Jul', year: '2024'),
    ChairmanBonusChart(count: 20, month: 3, monthName: 'Aug', year: '2024'),
    ChairmanBonusChart(count: 60, month: 4, monthName: 'Sep', year: '2024'),
    ChairmanBonusChart(count: 15, month: 5, monthName: 'Oct', year: '2024'),
    ChairmanBonusChart(count: 40, month: 6, monthName: 'Nov', year: '2024'),
  ];

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
    for (var i = 0; i < list.length; i++) {
      barGroups.add(generateGroupData(i, list[i].count));
    }
    for (var i = 0; i < listBonus.length; i++) {
      spots.add(FlSpot((i).toDouble(), listBonus[i].count.toDouble()));
    }
  }

  /// FUNCTIONS
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
