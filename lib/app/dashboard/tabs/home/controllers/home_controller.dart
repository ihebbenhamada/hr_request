import 'dart:developer';

import 'package:carousel_slider/carousel_options.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

import '../../../../../config/controllerConfig/base_controller.dart';
import '../models/dash.dart';
import '../services/home_service.dart';

class HomeController extends BaseController {
  /// SERVICES
  final HomeService _homeService = HomeService();

  /// CONTROLLERS

  /// VARIABLES
  RxInt current = 0.obs;
  RxInt currentBonusPunishments = 0.obs;
  RxInt currentMeeting = 0.obs;
  final List<Map<String, dynamic>> carouselBonusPunishmentsData = [
    {
      'image': AppImages.gift,
      'title': 'bonus',
      'amount': 0.0,
      'type': 0,
    },
    {
      'image': AppImages.checkList,
      'title': 'punishments',
      'amount': 0.0,
      'type': 1,
    },
    {
      'image': AppImages.loan,
      'title': 'loan',
      'amount': 0.0,
      'type': 0,
    },
  ];
  final List<Map<String, dynamic>> carouselMeetingsData = [
    {
      'title': 'subject_meeting',
      'image': AppImages.avatar1,
      'description': 'lorem_epsum',
      'date': '19/Dec/2023',
    },
    {
      'title': 'subject_meeting',
      'image': AppImages.avatar2,
      'description': 'lorem_epsum',
      'date': '19/Dec/2023',
    },
    {
      'title': 'subject_meeting',
      'image': AppImages.avatar1,
      'description': 'lorem_epsum',
      'date': '19/Dec/2023',
    },
  ];
  final List<Map<String, dynamic>> bonusPunishmentCategoryList = [
    {
      'title': 'all',
      'is_new': false,
    },
    {
      'title': 'bonus',
      'is_new': true,
    },
    {
      'title': 'punishments',
      'is_new': false,
    },
    {
      'title': 'loan',
      'is_new': false,
    }
  ];
  RxInt selectedBonusPunishments = 0.obs;
  Rx<DashBoardInfo> dashboardInfo = DashBoardInfo(
    employeeId: 0,
    employeeNameAr: '',
    employeeNameEn: '',
    employeeJob: '',
    basicSalary: 0,
    allowances: 0,
    totalExtra: 0,
    totalLoan: 0,
    totalBonus: 0,
    punishments: 0,
    netSalary: 0,
    contractDateFrom: '',
    contractDateTo: '',
    annualLeaveCount: 0,
    hasAirlineTicket: false,
    meetingsCount: 0,
    incomingMeetings: [],
  ).obs;
  RxDouble workPeriod = 0.0.obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// INITIALISATION
  void initValues() {
    getDashInfo();
  }

  /// FUNCTIONS
  getDashInfo() {
    _homeService.getDashboardInfo().then((value) {
      if (value != null) {
        dashboardInfo.value = value;
        workPeriod.value = calculateWorkPeriodPercentage(
          contractStart: value.contractDateFrom,
          contractEnd: value.contractDateTo,
        );

        log('wwwwwwww => ' +
            calculateWorkPeriodPercentage(
              contractStart: value.contractDateFrom,
              contractEnd: value.contractDateTo,
            ).toString());

        carouselBonusPunishmentsData.map((e) => {e['amount'] = 3000.0});
      }
    });
  }

  double calculateWorkPeriodPercentage({
    required String contractStart,
    required String contractEnd,
  }) {
    final DateTime today = DateTime.now();
    final DateTime startDate = DateTime.parse(contractStart);
    final DateTime endDate = DateTime.parse(contractEnd);
    // Handle edge cases
    if (today.isBefore(startDate)) return 0.0;
    if (today.isAfter(endDate)) return 1.0;

    // Total duration of the contract
    final int totalDays = endDate.difference(startDate).inDays;

    // Days passed since the start date
    final int passedDays = today.difference(startDate).inDays;

    // Percentage calculation
    double percentage = (passedDays / totalDays) * 100;

    return percentage;
  }

  onChangeCarousel(int index, CarouselPageChangedReason reason) {
    current.value = index;
  }

  onChangeBonusPunishmentsCarousel(
    int index,
    CarouselPageChangedReason reason,
  ) {
    currentBonusPunishments.value = index;
  }

  onChangeMeetingCarousel(
    int index,
    CarouselPageChangedReason reason,
  ) {
    currentMeeting.value = index;
  }

  onSelectBonusPunishment(int index) {
    selectedBonusPunishments.value = index;
  }
}
