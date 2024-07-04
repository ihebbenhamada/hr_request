import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/loan/loan-details/screens/loan_details_screen.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/image_urls/image_urls.dart';
import '../models/loan_response.dart';
import '../services/loan_service.dart';

class LoanController extends BaseController {
  /// SERVICES
  final LoanService _loanService = LoanService();

  /// CONTROLLERS

  /// VARIABLES
  RxInt selectedFilter = 0.obs;
  RxInt currentLoanIndex = 0.obs;
  RxInt selectedChart = 0.obs;
  Rx<LoanResponse> empLoanResponse = LoanResponse(
    all: [],
    pending: [],
    approved: [],
    rejected: [],
    loansPercentage: 0,
    totalLoans: "0",
    pendingPercentage: 0,
    approvedPercentage: 0,
    rejectedPercentage: 0,
  ).obs;
  RxList<Loan> allLoansList = <Loan>[].obs;
  RxList<Loan> pendingLoansList = <Loan>[].obs;
  RxList<Loan> approvedLoansList = <Loan>[].obs;
  RxList<Loan> rejectedLoanList = <Loan>[].obs;
  RxList<Loan> loanList = <Loan>[].obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  getLoanList() {
    AppInterceptor.showLoader();
    _loanService.getEmpLoans().then((value) {
      if (value != null) {
        empLoanResponse.value = value;
        allLoansList.value = value.all!.map((e) {
          switch (e.status) {
            case "LoanInProgress":
              e.type = 1;
              e.icon = AppImages.progress;
              break;
            case "LoanRejected":
              e.type = 2;
              e.icon = AppImages.x;
              break;
            case "LoanApproved":
              e.type = 0;
              e.icon = AppImages.doubleCheck;
              break;
            default:
              e.type = 0;
          }
          return e;
        }).toList();
        approvedLoansList.value = value.approved!.map((e) {
          e.icon = AppImages.doubleCheck;
          e.type = 0;
          return e;
        }).toList();
        pendingLoansList.value = value.pending!.map((e) {
          e.icon = AppImages.progress;
          e.type = 1;
          return e;
        }).toList();
        rejectedLoanList.value = value.rejected!.map((e) {
          e.icon = AppImages.x;
          e.type = 2;
          return e;
        }).toList();
        loanList.value = allLoansList;
      }
      AppInterceptor.hideLoader();
    });
  }

  /// INITIALISATION
  void initValues() {
    getLoanList();
  }

  /// FUNCTIONS
  onSelectFilter(int index) {
    selectedFilter.value = index;
    switch (index) {
      case 0:
        loanList.value = allLoansList;
      case 1:
        loanList.value = pendingLoansList;
      case 2:
        loanList.value = approvedLoansList;
      case 3:
        loanList.value = rejectedLoanList;
      default:
        loanList.value = allLoansList;
    }
  }

  onChangeLoanCarousel(int index, CarouselPageChangedReason reason) {
    currentLoanIndex.value = index;
  }

  onClickLoanItem(Loan item) {
    _loanService.getUpdateLoan(loanId: item.id).then((value) async {
      if (value != null) {
        AppInterceptor.hideLoader();
        Get.to(
          () => LoanDetailsScreen(loanItem: item, screenTitle: 'Loan Details'),
          arguments: [
            {
              'loan': value,
            },
            {
              'isDetail': true,
            }
          ],
          transition: Transition.leftToRight,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 500),
        );
      }
    });
  }

  void navigateAndRefresh() async {
    final result = await Get.to(
      () => LoanDetailsScreen(
        screenTitle: 'Create Loan',
      ),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
    if (result != null) {
      getLoanList();
    }
  }

  Future<void> handleRefresh() async {
    AppInterceptor.showLoader();
    selectedFilter.value = 0;
    getLoanList();
  }

  void onClickUpdate({required int id, String? from}) {
    AppInterceptor.showLoader();
    _loanService.getUpdateLoan(loanId: id).then((value) async {
      if (value != null) {
        AppInterceptor.hideLoader();
        final result = await Get.to(
          () => LoanDetailsScreen(
            screenTitle: 'Update Loan',
          ),
          transition: Transition.leftToRight,
          arguments: [
            {
              'loan': value,
            },
            {
              'isDetail': false,
            }
          ],
          curve: Curves.ease,
          duration: const Duration(milliseconds: 500),
        );
        if (result != null) {
          getLoanList();
        }
      }
    });
  }
}
