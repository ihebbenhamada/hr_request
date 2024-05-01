import 'package:carousel_slider/carousel_options.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/evaluations/evaluations-steps/main/screens/evaluations_steps_screen.dart';
import 'package:request_hr/app/evaluations/main/models/evaluation.dart';
import 'package:request_hr/app/evaluations/main/models/evaluation_chart.dart';
import 'package:request_hr/config/colors/colors.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../services/evaluations_service.dart';

class EvaluationsController extends BaseController {
  /// SERVICES
  final EvaluationsService _evaluationsService = EvaluationsService();

  /// CONTROLLERS

  /// VARIABLES
  RxInt currentEvaluation = 0.obs;
  RxInt selectedChart = 0.obs;
  RxInt showingTooltip = 1.obs;
  RxList<Evaluation> evaluationList = <Evaluation>[].obs;
  RxString totalMonthDegreeScale = "".obs;

  RxString percentage = "0.0".obs;
  RxList<Evaluation> listHrEmployeeEvaluations = <Evaluation>[].obs;
  RxList<ListEmployeeEvaluationChart> listEmployeeEvaluationChart =
      <ListEmployeeEvaluationChart>[].obs;
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
    getListEvaluations();
    getEvaluationChart();
  }

  /// FUNCTIONS
  onClickCreateEvaluation() {
    Get.to(
      () => EvaluationsStepsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  onClickItemEvaluation() {
    Get.to(
      () => EvaluationsStepsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  onChangeEvaluationCarousel(int index, CarouselPageChangedReason reason) {
    currentEvaluation.value = index;
  }

  List<BarChartGroupData> generateGroupData(
      List<ListEmployeeEvaluationChart> listChart) {
    List<BarChartGroupData> list = <BarChartGroupData>[];
    for (int i = 0; i < listChart.length; i++) {
      list.add(BarChartGroupData(
        x: listChart[i].month ?? 0,
        showingTooltipIndicators:
            showingTooltip.value == (listChart[i].month ?? 0) ? [0] : [],
        barRods: [
          BarChartRodData(
            toY: (listChart[i].monthDegreeScalePercentage ?? 0).toDouble(),
            color: AppColors.blue2,
            width: 15,
            borderRadius: BorderRadius.circular(8),
          ),
        ],
      ));
    }
    return list;
  }

  onSelectChart(int index) {
    selectedChart.value = index;
  }

  getListEvaluations() {
    AppInterceptor.showLoader();
    _evaluationsService.getEvaluations().then((value) {
      if (value != null) {
        evaluationList.value = value;
      }
    });
  }

  getEvaluationChart() {
    _evaluationsService.getEvaluationChart().then((value) {
      if (value != null) {
        listEmployeeEvaluationChart.value = value.listEmployeeEvaluationChart ??
            <ListEmployeeEvaluationChart>[];
        listHrEmployeeEvaluations.value =
            value.listHrEmployeeEvaluations ?? <Evaluation>[];
        totalMonthDegreeScale.value = value.totalMonthDegreeScale ?? "";
        getPercentage(value.totalMonthDegreeScale ?? "");
        barGroups.value = generateGroupData(value.listEmployeeEvaluationChart ??
            <ListEmployeeEvaluationChart>[]);
      }
      AppInterceptor.hideLoader();
    });
  }

  getPercentage(String value) {
    double a = 0.0;
    double b = 0.0;
    if (value.isNotEmpty) {
      a = int.parse(value[0]).toDouble();
      b = int.parse(value[4]).toDouble();
    }
    if (b == 0.0) {
      percentage.value = "0";
    } else {
      percentage.value = (a / b).toString();
    }
  }
}
