import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/main/controller/dashboard-controller.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/success-vacation/screens/success_vacation_screen.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-steps/steps/disclaimer.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-steps/steps/final_exit_approval.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-steps/steps/ticket_exchange_request.dart';
import 'package:request_hr/config/controllerConfig/base_controller.dart';

import '../../../../../../../config/colors/colors.dart';
import '../services/vacations_steps_service.dart';

class VacationsStepsController extends BaseController
    with GetTickerProviderStateMixin {
  /// SERVICES
  final VacationsStepsService _vacationsStepsService = VacationsStepsService();

  /// CONTROLLERS
  final PageController pageController = PageController(initialPage: 0);
  final DashboardController _dashboardController =
      Get.find<DashboardController>();

  /// VARIABLES
  RxDouble animatedSecondStepBarWidth = 0.0.obs;
  RxDouble animatedThirdStepBarWidth = 0.0.obs;
  RxInt activePage = 0.obs;
  Rx<Color> secondStepTextColor = AppColors.blueDark.obs;
  Rx<Color> thirdStepTextColor = AppColors.blueDark.obs;

  //////////
  late AnimationController _animationFirstStepContainer;
  late Animation<double> firstStepContainerAnimation;

  late AnimationController _animationSecondStepContainer;
  late Animation<double> secondStepContainerAnimation;

  final List<Widget> steps = [
    const FinalExitApproval(),
    const TicketExchangeRequest(),
    const Disclaimer(),
  ];

  final List<String> paymentTypeList = ['Annual', 'Monthly', 'Weekly', 'daily'];
  RxString selectedType = 'Annual'.obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
    _animationFirstStepContainer = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animationSecondStepContainer = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    firstStepContainerAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_animationFirstStepContainer);
    secondStepContainerAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_animationSecondStepContainer);
  }

  @override
  void dispose() {
    _animationFirstStepContainer.dispose();
    _animationSecondStepContainer.dispose();
    super.dispose();
  }

  /// INITIALISATION
  void initValues() {}

  /// FUNCTIONS
  onClickNext() {
    if (activePage < steps.length - 1) {
      paginate(activePage.value + 1, true);
      if (activePage.value == 0) {
        animateSecondStep('forward');
        return;
      }
      animateThirdStep('forward');
    }
  }

  onClickBack() {
    if (activePage.value > 0) {
      paginate(activePage.value - 1, false);
      if (activePage.value == 2) {
        animateThirdStep('back');
        return;
      }
      animateSecondStep('back');
    } else {
      Get.back();
    }
  }

  onClickFinish() {
    Get.to(
      () => SuccessVacationScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  paginate(int index, bool isForward) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeIn,
    );
    Future.delayed(Duration(milliseconds: isForward ? 600 : 200), () {
      secondStepTextColor.value =
          index != 0 ? AppColors.white : AppColors.blueDark;
      thirdStepTextColor.value =
          index != 2 ? AppColors.blueDark : AppColors.white;
    });
  }

  onPageChanged(int index) {
    activePage.value = index;
  }

  onSelectPaymentType(String value) {
    selectedType.value = value;
  }

  animateSecondStep(String direction) {
    if (direction == 'forward') {
      animatedSecondStepBarWidth.value = 86.0;
      Future.delayed(const Duration(milliseconds: 400), () {
        _animationFirstStepContainer.forward();
      });
    } else {
      _animationFirstStepContainer.reverse();
      Future.delayed(const Duration(milliseconds: 400), () {
        animatedSecondStepBarWidth.value = 0.0;
      });
    }
  }

  animateThirdStep(String direction) {
    if (direction == 'forward') {
      animatedThirdStepBarWidth.value = 86.0;
      Future.delayed(const Duration(milliseconds: 400), () {
        _animationSecondStepContainer.forward();
      });
    } else {
      _animationSecondStepContainer.reverse();
      Future.delayed(const Duration(milliseconds: 400), () {
        animatedThirdStepBarWidth.value = 0.0;
      });
    }
  }
}
