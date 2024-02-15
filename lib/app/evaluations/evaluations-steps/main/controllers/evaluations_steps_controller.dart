import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/main/controller/dashboard-controller.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/success-vacation/screens/success_vacation_screen.dart';
import 'package:request_hr/app/evaluations/evaluations-steps/steps/employee.dart';
import 'package:request_hr/app/evaluations/evaluations-steps/steps/form_a.dart';
import 'package:request_hr/app/evaluations/evaluations-steps/steps/recommendation.dart';
import 'package:request_hr/config/controllerConfig/base_controller.dart';

import '../../../../../../../config/colors/colors.dart';
import '../services/evaluations_steps_service.dart';

class EvaluationsStepsController extends BaseController
    with GetTickerProviderStateMixin {
  /// SERVICES
  final EvaluationsStepsService _evaluationsStepsService =
      EvaluationsStepsService();

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

  RxDouble jobDescSliderValue = 25.0.obs;
  RxDouble importantRoleValue = 50.0.obs;
  RxDouble managementEncourageValue = 50.0.obs;
  RxDouble memberQualifiedValue = 50.0.obs;
  RxDouble discusesJobDutiesValue = 50.0.obs;
  RxDouble helpManagingWorkValue = 50.0.obs;
  RxDouble understandManagerExpectationValue = 50.0.obs;

  //////////
  late AnimationController _animationFirstStepContainer;
  late Animation<double> firstStepContainerAnimation;

  late AnimationController _animationSecondStepContainer;
  late Animation<double> secondStepContainerAnimation;

  late List<Widget> steps;

  final List<String> paymentTypeList = ['Annual', 'Monthly', 'Weekly', 'daily'];
  RxString selectedType = 'Annual'.obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
    steps = [
      FormA(
        jobDescSliderValue: jobDescSliderValue,
        onChangeSlider: (value, type) => onChangeSlider(value, type),
        importantRoleValue: importantRoleValue,
        managementEncourageValue: managementEncourageValue,
        memberQualifiedValue: memberQualifiedValue,
        discusesJobDutiesValue: discusesJobDutiesValue,
        helpManagingWorkValue: helpManagingWorkValue,
        understandManagerExpectationValue: understandManagerExpectationValue,
      ),
      const Recommendation(),
      const Employee(),
    ];

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

  onChangeSlider(dynamic value, int type) {
    switch (type) {
      case 1:
        jobDescSliderValue.value = value;
        break;
      case 2:
        importantRoleValue.value = value;
        break;
      case 3:
        managementEncourageValue.value = value;
        break;
      case 4:
        memberQualifiedValue.value = value;
        break;
      case 5:
        discusesJobDutiesValue.value = value;
        break;
      case 6:
        helpManagingWorkValue.value = value;
        break;
      case 7:
        understandManagerExpectationValue.value = value;
        break;
      default:
        importantRoleValue.value = value;
        break;
    }
  }
}
