import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/decisions/decision-details/screens/decisions_details_screen.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/decisions_service.dart';

class DecisionsController extends BaseController {
  /// SERVICES
  final DecisionsService _decisionsService = DecisionsService();

  /// CONTROLLERS

  /// VARIABLES
  final List<Map<String, dynamic>> decisionList = [
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'employee_position': 'project Manager',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'employee_position': 'project Manager',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'employee_position': 'Senior front end developer',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
      'editable': true,
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'employee_position': 'project Manager',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'employee_position': 'project Manager',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
      'editable': true,
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'employee_position': 'project Manager',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'employee_position': 'project Manager',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'employee_position': 'project Manager',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'employee_position': 'project Manager',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'employee_position': 'project Manager',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
    },
  ];

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
  void initValues() {}

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
