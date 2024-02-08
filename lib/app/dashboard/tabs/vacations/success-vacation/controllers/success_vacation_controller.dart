import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../main/screen/dashboard-screen.dart';
import '../services/success_vacation_service.dart';

class SuccessVacationController extends BaseController {
  /// SERVICES
  final SuccessVacationService _successVacationService =
      SuccessVacationService();

  /// CONTROLLERS

  /// VARIABLES

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
  onClickContinue() {
    Get.off(
      DashboardScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
    );
  }
}
