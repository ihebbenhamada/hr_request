import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/main/controller/dashboard-controller.dart';
import 'package:request_hr/app/dashboard/main/screen/dashboard-screen.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/success_vacation_service.dart';

class SuccessVacationController extends BaseController {
  /// SERVICES
  final SuccessVacationService _successVacationService =
      SuccessVacationService();

  /// CONTROLLERS
  final DashboardController _dashboardController = Get.find();

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
    Get.offAll(
      () => DashboardScreen(
        from: 'reload',
      ),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }
}
