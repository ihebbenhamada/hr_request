import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/colors/colors.dart';
import '../services/sign_in_out_details_service.dart';

class SignInOutDetailsController extends BaseController {
  /// SERVICES
  final SignInOutDetailsService _signInOutDetailsService =
      SignInOutDetailsService();

  /// CONTROLLERS

  /// VARIABLES
  RxInt selectedType = 0.obs;

  Rx<DateTime> signDate = DateTime.now().obs;

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
  void selectDate(
    BuildContext context,
  ) async {
    final DateTime? pickedDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary, // header background color
              onPrimary: AppColors.white, // header text color
              onSurface: AppColors.black, // body text color
            ),
            textTheme: Theme.of(context).textTheme.copyWith(
                  bodyLarge: TextStyle(fontSize: 14.sp),
                ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.black, // button text color
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
    if (pickedDate != null && pickedDate != signDate.value) {
      signDate.value = pickedDate;
    }
  }

  onSelectType(int value) {
    selectedType.value = value;
  }

  onClickSubmit() {
    Get.back();
  }

  onClickBack() {
    Get.back();
  }
}
