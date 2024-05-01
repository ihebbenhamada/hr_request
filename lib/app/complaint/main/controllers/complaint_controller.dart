import 'package:carousel_slider/carousel_options.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/image_urls/image_urls.dart';
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
  final List<Map<String, dynamic>> carouselComplaintList = [
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'employee_position': 'project Manager',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
      'editable': false,
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'employee_position': 'project Manager',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
      'editable': false,
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'employee_position': 'project Manager',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
      'editable': false,
    },
  ];
  final Rx<ComplaintResponse> complaintResponse = ComplaintResponse(
    totalCount: 0,
    reqComplaintMobile: [],
    reqComplaintChart: ReqComplaintChart(
      count: [],
      lastSixMonths: [],
    ),
  ).obs;
  RxInt showingTooltip = 1.obs;

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
        complaintResponse.value.reqComplaintMobile.add(
          ReqComplaintMobile(
            id: 1,
            fkHrEmployeeId: 1,
            senderName: "Hobba",
            senderImagePath: "https://placebear.com/g/200/200",
            subject: "complaint subject",
            description: "complaint desc",
            fkReqStatusId: 1,
            complaintDate: "2024-04-20",
          ),
        );
      }
      AppInterceptor.hideLoader();
    });
  }

  onClickCreateComplaint() {
    Get.to(
      () => ComplaintDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  onClickItemComplaint() {
    Get.to(
      () => ComplaintDetailsScreen(),
      transition: Transition.leftToRight,
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
}
