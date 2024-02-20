import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/colors/colors.dart';
import '../services/custody_details_service.dart';

class CustodyDetailsController extends BaseController {
  /// SERVICES
  final CustodyDetailsService _custodyDetailsService = CustodyDetailsService();

  /// CONTROLLERS

  /// VARIABLES
  RxString selectedPaymentType = 'Cash'.obs;
  RxString selectedCustodyType = 'Custody1'.obs;

  Rx<DateTime> custodyDate = DateTime.now().obs;

  final List<String> paymentTypeList = ['Cash', 'Credit card', 'Visa', 'Rajhi'];
  final List<String> custodyTypeList = [
    'Custody1',
    'Custody2',
    'Custody3',
    'Custody4'
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
  void selectDate(BuildContext context) async {
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
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != custodyDate.value) {
      custodyDate.value = pickedDate;
    }
  }

  onSelectPaymentType(String value) {
    selectedPaymentType.value = value;
  }

  onSelectCustodyType(String value) {
    selectedCustodyType.value = value;
  }

  onClickSubmit() {
    Get.back();
  }

  onClickBack() {
    Get.back();
  }
}
