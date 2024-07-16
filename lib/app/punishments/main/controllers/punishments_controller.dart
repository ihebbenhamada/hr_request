import 'package:carousel_slider/carousel_options.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:request_hr/app/punishments/main/models/punishment_chart.dart';
import 'package:request_hr/app/punishments/main/models/punishment_response.dart';
import 'package:request_hr/app/punishments/punishments-details/screens/punishments_details_screen.dart';
import 'package:request_hr/config/colors/colors.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../services/punishments_service.dart';

class PunishmentsController extends BaseController {
  /// SERVICES
  final PunishmentsService _punishmentsService = PunishmentsService();

  /// CONTROLLERS

  /// VARIABLES
  RxInt currentPunishment = 0.obs;
  RxInt selectedChart = 0.obs;
  RxInt showingTooltip = 1.obs;
  RxList<PunishmentResponse> punishmentList = <PunishmentResponse>[].obs;
  RxList<PunishmentChart> punishmentChart = <PunishmentChart>[].obs;
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
    getPunishmentList();
  }

  /// FUNCTIONS
  getPunishmentList() {
    AppInterceptor.showLoader();
    _punishmentsService.getPunishmentList().then((value) {
      if (value != null) {
        punishmentList.value = value;
        getPunishmentChartList();
      } else {
        AppInterceptor.hideLoader();
      }
    });
  }

  getPunishmentChartList() {
    _punishmentsService.getPunishmentChart().then((value) {
      if (value != null) {
        punishmentChart.value = value;
        for (var i = 0; i < value.length; i++) {
          barGroups.add(generateGroupData(i + 1, value[i].count));
        }
      }
      AppInterceptor.hideLoader();
    });
  }

  void navigateAndRefresh() async {
    final result = await Get.to(
      () => PunishmentsDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
    if (result != null) {
      barGroups.clear();
      getPunishmentList();
    }
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

  Future<void> handleRefresh() async {
    barGroups.clear();
    getPunishmentList();
  }
}
