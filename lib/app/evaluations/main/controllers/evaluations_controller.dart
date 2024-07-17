import 'package:carousel_slider/carousel_options.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
  bool isAdmin = false;
  GetStorage storage = GetStorage();

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
    getListEvaluations();
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
        x: listChart[i].month,
        showingTooltipIndicators:
            showingTooltip.value == (listChart[i].month) ? [0] : [],
        barRods: [
          BarChartRodData(
            toY: (listChart[i].monthDegreeScalePercentage).toDouble(),
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
        evaluationList.value = value.listHrEmployeeEvaluations!;
        listEmployeeEvaluationChart.value = value.listEmployeeEvaluationChart ??
            <ListEmployeeEvaluationChart>[];
        listHrEmployeeEvaluations.value =
            value.listHrEmployeeEvaluations ?? <Evaluation>[];
        totalMonthDegreeScale.value = value.totalMonthDegreeScale ?? "";
        percentage.value =
            evaluateExpression(value.totalMonthDegreeScale ?? '1/1').toString();
        barGroups.value = generateGroupData(value.listEmployeeEvaluationChart ??
            <ListEmployeeEvaluationChart>[]);
      }
      AppInterceptor.hideLoader();
    });
  }

  double evaluateExpression(String expression) {
    List<String> parts = expression.split('/');
    double numerator = double.parse(parts[0].trim());
    double denominator = double.parse(parts[1].trim());

    return denominator != 0 ? numerator / denominator : 0.0;
  }

  Future<void> handleRefresh() async {
    getListEvaluations();
  }
}
