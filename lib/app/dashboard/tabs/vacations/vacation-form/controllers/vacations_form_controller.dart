import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-steps/main/screens/vacations_steps_screen.dart';
import 'package:request_hr/config/colors/colors.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/vacations_form_service.dart';

class VacationsFormController extends BaseController {
  /// SERVICES
  final VacationsFormService _vacationsFormService = VacationsFormService();

  /// CONTROLLERS

  /// VARIABLES
  RxString selectedType = 'Annual'.obs;
  Rx<DateTime> dateFrom = DateTime.now().obs;
  Rx<DateTime> dateTo = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day + 1,
  ).obs;
  final List<String> vacationTypeList = [
    'Annual',
    'Monthly',
    'Weekly',
    'daily'
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
  onSelectVacationType(String value) {
    selectedType.value = value;
  }

  void selectDate(
    BuildContext context,
    String selectedDate,
  ) async {
    final DateTime? pickedDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary, // header background color
              onPrimary: AppColors.white, // header text color
              onSurface: AppColors.gray6, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.gray6, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (selectedDate == 'from') {
      if (pickedDate != null && pickedDate != dateFrom.value) {
        dateFrom.value = pickedDate;
      }
    } else {
      if (pickedDate != null && pickedDate != dateTo.value) {
        dateTo.value = pickedDate;
      }
    }
  }

  onClickSubmit() {
    Get.off(
      () => VacationsStepsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }
}
