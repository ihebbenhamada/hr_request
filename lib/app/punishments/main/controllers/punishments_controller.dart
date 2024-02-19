import 'package:carousel_slider/carousel_options.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/punishments/punishments-details/screens/punishments_details_screen.dart';
import 'package:request_hr/config/colors/colors.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/image_urls/image_urls.dart';
import '../services/punishments_service.dart';

class PunishmentsController extends BaseController {
  /// SERVICES
  final PunishmentsService _punishmentsService = PunishmentsService();

  /// CONTROLLERS

  /// VARIABLES
  RxInt currentPunishment = 0.obs;
  RxInt selectedChart = 0.obs;
  final List<Map<String, dynamic>> carouselPunishmentsList = [
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'employee_punishment': 3000,
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
      'editable': false,
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'employee_punishment': 2000,
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
      'editable': false,
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'employee_punishment': 3000,
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
  onClickCreatePunishments() {
    Get.to(
      () => PunishmentsDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  onClickItemPunishments() {
    Get.to(
      () => PunishmentsDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  onChangePunishmentsCarousel(int index, CarouselPageChangedReason reason) {
    currentPunishment.value = index;
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
