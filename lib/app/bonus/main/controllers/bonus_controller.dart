import 'package:carousel_slider/carousel_options.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/bonus/bonus-details/screens/bonus_details_screen.dart';
import 'package:request_hr/config/colors/colors.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/image_urls/image_urls.dart';
import '../services/bonus_service.dart';

class BonusController extends BaseController {
  /// SERVICES
  final BonusService _bonusService = BonusService();

  /// CONTROLLERS

  /// VARIABLES
  RxInt currentBonus = 0.obs;
  RxInt selectedChart = 0.obs;
  final List<Map<String, dynamic>> carouselBonusList = [
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'employee_bonus': 3000,
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
      'editable': false,
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'employee_bonus': 2000,
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
      'editable': false,
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'employee_bonus': 3000,
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
  onClickCreateBonus() {
    Get.to(
      () => BonusDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  onClickItemBonus() {
    Get.to(
      () => BonusDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
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
