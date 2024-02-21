import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/sign-in-out/sign-in-out-details/screens/sign_in_out_details_screen.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/sign_in_out_service.dart';

class SignInOutController extends BaseController {
  /// SERVICES
  final SignInOutService _signInOutService = SignInOutService();

  /// CONTROLLERS

  /// VARIABLES
  final List<Map<String, dynamic>> signInOutList = [
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'work_place': 'Yanbu',
      'type': 0,
      'date': '13-2-2024',
      'time': '09:00',
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'work_place': 'Al Riyadh',
      'type': 1,
      'date': '13-2-2024',
      'time': '09:00',
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'work_place': 'Yanbu',
      'type': 0,
      'date': '13-2-2024',
      'tome': '09:00',
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'work_place': 'Yanbu',
      'type': 1,
      'date': '13-2-2024',
      'time': '09:00',
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'work_place': 'Al madina',
      'type': 0,
      'date': '13-2-2024',
      'time': '09:00',
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'work_place': 'Al Riyadh',
      'type': 1,
      'date': '13-2-2024',
      'time': '09:00',
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'work_place': 'Yanbu',
      'type': 0,
      'date': '13-2-2024',
      'time': '09:00',
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'work_place': 'Yanbu',
      'type': 1,
      'date': '13-2-2024',
      'time': '09:00',
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'work_place': 'Yanbu',
      'type': 0,
      'date': '13-2-2024',
      'time': '09:00',
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'work_place': 'Yanbu',
      'type': 1,
      'date': '13-2-2024',
      'time': '09:00',
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
  onClickSignInOutItem() {
    Get.to(
      () => SignInOutDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  onClickCreateSignInOut() {
    Get.to(
      () => SignInOutDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }
}
