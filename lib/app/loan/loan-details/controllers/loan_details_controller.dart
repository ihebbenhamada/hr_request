import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/colors/colors.dart';
import '../../../dashboard/tabs/vacations/main/models/drop_down.dart';
import '../services/loan_details_service.dart';

class LoanDetailsController extends BaseController {
  /// SERVICES
  final LoanDetailsService _loanDetailsService = LoanDetailsService();

  /// CONTROLLERS

  /// VARIABLES
  Rx<DateTime> loanDate = DateTime.now().obs;
  final List<DropDownModel> paymentTypeList = [
    DropDownModel(disabled: false, text: 'Choose', value: '0'),
    DropDownModel(disabled: false, text: 'Cash', value: '1'),
    DropDownModel(disabled: false, text: 'Credit card', value: '2'),
    DropDownModel(disabled: false, text: 'Visa', value: '3'),
    DropDownModel(disabled: false, text: 'Rajhi', value: '4'),
  ];

  late Rx<DropDownModel> selectedPaymentType;

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
    selectedPaymentType = paymentTypeList[0].obs;
  }

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
    if (pickedDate != null && pickedDate != loanDate.value) {
      loanDate.value = pickedDate;
    }
  }

  onSelectPaymentType(DropDownModel value) {
    selectedPaymentType.value = value;
  }

  onClickSubmit() {
    Get.back();
  }

  onClickBack() {
    Get.back();
  }
}
