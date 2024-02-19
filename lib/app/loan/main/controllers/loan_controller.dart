import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/loan/loan-details/screens/loan_details_screen.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/loan_service.dart';

class LoanController extends BaseController {
  /// SERVICES
  final LoanService _loanService = LoanService();

  /// CONTROLLERS

  /// VARIABLES
  RxInt selectedFilter = 0.obs;
  RxInt currentLoanIndex = 0.obs;
  RxInt selectedChart = 0.obs;
  final List<Map<String, dynamic>> carouselLoanList = [
    {
      'title': 'Loan Request',
      'cost': 2000,
      'icon': AppImages.doubleCheck,
      'type': 0,
      'date': '13-2-2024',
      'editable': true,
    },
    {
      'title': 'Loan Request',
      'cost': 2000,
      'icon': AppImages.progress,
      'type': 1,
      'date': '13-2-2024',
      'editable': true,
    },
    {
      'title': 'Loan Request',
      'cost': 2000,
      'icon': AppImages.x,
      'type': 2,
      'date': '13-2-2024',
      'editable': false,
    },
  ];

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
  onSelectFilter(int index) {
    selectedFilter.value = index;
  }

  onChangeLoanCarousel(int index, CarouselPageChangedReason reason) {
    currentLoanIndex.value = index;
  }

  onClickLoanItem() {
    Get.to(
      () => LoanDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  onClickCreateLoan() {
    Get.to(
      () => LoanDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }
}
