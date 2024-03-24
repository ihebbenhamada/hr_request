import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/colors/colors.dart';
import '../../../dashboard/tabs/vacations/main/models/drop_down.dart';
import '../services/ticket_details_service.dart';

class TicketDetailsController extends BaseController {
  /// SERVICES
  final TicketDetailsService _ticketDetailsService = TicketDetailsService();

  /// CONTROLLERS

  /// VARIABLES
  Rx<DateTime> dueDate = DateTime.now().obs;
  Rx<DateTime> employeeBirthDate = DateTime.now().obs;
  Rx<DateTime> employeeWifeBirthDate = DateTime.now().obs;
  Rx<DateTime> employeeSonUnderTwelveBirthDate = DateTime.now().obs;
  Rx<DateTime> employeeSecondSonBirthDate = DateTime.now().obs;

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
  void selectDate(BuildContext context, int type) async {
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
    switch (type) {
      case 0:
        if (pickedDate != null && pickedDate != dueDate.value) {
          dueDate.value = pickedDate;
        }
        break;
      case 1:
        if (pickedDate != null && pickedDate != employeeBirthDate.value) {
          employeeBirthDate.value = pickedDate;
        }
        break;
      case 2:
        if (pickedDate != null && pickedDate != employeeWifeBirthDate.value) {
          employeeWifeBirthDate.value = pickedDate;
        }
        break;
      case 3:
        if (pickedDate != null &&
            pickedDate != employeeSonUnderTwelveBirthDate.value) {
          employeeSonUnderTwelveBirthDate.value = pickedDate;
        }
        break;
      case 4:
        if (pickedDate != null &&
            pickedDate != employeeSecondSonBirthDate.value) {
          employeeSecondSonBirthDate.value = pickedDate;
        }
        break;
      default:
        null;
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
