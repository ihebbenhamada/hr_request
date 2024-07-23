import 'package:carousel_slider/carousel_options.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../complaint-details/screens/complaint_details_screen.dart';
import '../models/complaint_response.dart';
import '../services/complaint_service.dart';

class ComplaintController extends BaseController {
  /// SERVICES
  final ComplaintService _complaintService = ComplaintService();

  /// CONTROLLERS

  /// VARIABLES
  RxInt currentComplaint = 0.obs;
  RxInt selectedChart = 0.obs;
  final Rx<ComplaintResponse> complaintResponse = ComplaintResponse(
    totalCount: 0,
    reqComplaintMobile: [],
    reqComplaintChart: ReqComplaintChart(
      count: [],
      lastSixMonths: [],
    ),
  ).obs;
  RxInt showingTooltip = 1.obs;
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
    getComplaints();
  }

  /// FUNCTIONS
  getComplaints() {
    AppInterceptor.showLoader();
    _complaintService.getComplaints().then((value) {
      if (value != null) {
        complaintResponse.value = value;
        for (var i = 0; i < value.reqComplaintChart.count.length; i++) {
          barGroups
              .add(generateGroupData(i + 1, value.reqComplaintChart.count[i]));
        }
      }
      AppInterceptor.hideLoader();
    });
  }

  onClickCreateComplaint() async {
    final result = await Get.to(
      () => ComplaintDetailsScreen(
        title: 'create_complaint',
      ),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
    if (result != null) {
      barGroups.clear();
      getComplaints();
    }
  }

  onClickItemComplaint(ReqComplaintMobile item) {
    Get.to(
      () => ComplaintDetailsScreen(title: 'detail_complaint'),
      transition: Transition.leftToRight,
      arguments: item,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  onChangeComplaintCarousel(int index, CarouselPageChangedReason reason) {
    currentComplaint.value = index;
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
    getComplaints();
  }
}
