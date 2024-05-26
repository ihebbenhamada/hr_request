import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:request_hr/app/dashboard/tabs/decisions/decision-details/screens/decisions_details_screen.dart';
import 'package:request_hr/app/dashboard/tabs/decisions/main/model/get_decisions_response.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/decisions_service.dart';

class DecisionsController extends BaseController {
  /// SERVICES
  final DecisionsService _decisionsService = DecisionsService();

  /// CONTROLLERS

  /// VARIABLES
  RxList<DecisionsResponse> decisionList = <DecisionsResponse>[].obs;
  GetStorage storage = GetStorage();
  bool isAdmin = false;

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

  getListDecisions() {
    _decisionsService.getDecisions().then((value) {
      if (value != null) {
        decisionList.value = value;
      }
      AppInterceptor.hideLoader();
    });
  }

  /// INITIALISATION
  void initValues() {
    if (storage.read('isAdmin') != null) {
      isAdmin = storage.read('isAdmin');
    }

    getListDecisions();
  }

  /// FUNCTIONS
  onClickDecision(DecisionsResponse decisionsResponse) {
    Get.to(
      id: 1,
      () => DecisionsDetailsScreen(decisionsResponse: decisionsResponse),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  void navigateAndRefresh() async {
    final result = await Get.to(
      id: 1,
      () => DecisionsDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    ); //or use default navigation
    if (result != null) {
      getListDecisions(); // call your own function here to refresh screen
    }
  }
}
