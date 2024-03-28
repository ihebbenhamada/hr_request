import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/decisions/decision-details/screens/decisions_details_screen.dart';
import 'package:request_hr/app/dashboard/tabs/decisions/main/model/get_decisions_response.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/decisions_service.dart';

class DecisionsController extends BaseController {
  /// SERVICES
  final DecisionsService _decisionsService = DecisionsService();

  /// CONTROLLERS

  /// VARIABLES
  RxList<DecisionsResponse> decisionList = <DecisionsResponse>[].obs;

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
    _decisionsService.getDecisions().then((value) {
      if (value != null) {
        decisionList.value = value;
      }
    });
  }

  /// FUNCTIONS
  onClickDecision() {
    Get.to(
      id: 1,
      () => DecisionsDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }
}
