import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/models/drop_down.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-steps/main/screens/vacations_steps_screen.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/vacations_form_service.dart';

class VacationsFormController extends BaseController {
  /// SERVICES
  final VacationsFormService _vacationsFormService = VacationsFormService();

  /// CONTROLLERS

  /// VARIABLES
  Rx<DropDownModel> selectedType =
      DropDownModel(disabled: false, text: 'اختر', value: '0').obs;
  Rx<DropDownModel> selectedAlternativeEmployee =
      DropDownModel(disabled: false, text: 'اختر', value: '0').obs;
  Rx<DropDownModel> selectedAlternativeToPay =
      DropDownModel(disabled: false, text: 'اختر', value: '0').obs;

  RxString dateFrom = "".obs;
  RxString dateTo = "".obs;
  RxString dueDate = "".obs;
  RxList<DropDownModel> vacationTypeList = <DropDownModel>[].obs;
  RxList<DropDownModel> employeesList = <DropDownModel>[].obs;
  RxBool isProcedureCompleted = false.obs;
  TextEditingController remarkTextEditingController = TextEditingController();

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  /// INITIALISATION
  void initValues() {
    getCreateVacations();
  }

  /// FUNCTIONS
  onSelectVacationType(DropDownModel value) {
    selectedType.value = value;
  }

  onSelectAlternativeEmployee(DropDownModel value) {
    selectedAlternativeEmployee.value = value;
  }

  onSelectAlternativeToPay(DropDownModel value) {
    selectedAlternativeToPay.value = value;
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
              onSurface: AppColors.black, // body text color
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
    if (selectedDate == 'from') {
      if (pickedDate != null && pickedDate.toString() != dateFrom.value) {
        dateFrom.value = pickedDate.toString().substring(0, 10);
        dueDate.value = DateTime.parse(dateTo.value)
            .difference(DateTime.parse(dateFrom.value))
            .inDays
            .toString();
      }
    } else {
      if (pickedDate != null && pickedDate.toString() != dateTo.value) {
        dateTo.value = pickedDate.toString().substring(0, 10);
        dueDate.value = DateTime.parse(dateTo.value)
            .difference(DateTime.parse(dateFrom.value))
            .inDays
            .toString();
      }
    }
  }

  getCreateVacations() {
    AppInterceptor.showLoader();
    _vacationsFormService.getCreateVacations().then((value) {
      if (value != null) {
        selectedType.value = value.vacationTypes[0];
        vacationTypeList.value = value.vacationTypes;
        dateFrom.value = value.dateFrom.substring(0, 10);
        dateTo.value = value.dateTo.substring(0, 10);
        dueDate.value = DateTime.parse(dateTo.value)
            .difference(DateTime.parse(dateFrom.value))
            .inDays
            .toString();
        employeesList.value = value.employees;
        selectedAlternativeToPay.value = value.employees[0];
        selectedAlternativeEmployee.value = value.employees[0];
      }
      AppInterceptor.hideLoader();
    });
  }

  onClickSubmit() {
    AppInterceptor.showLoader();
    _vacationsFormService
        .createVacation(
      fKAlternativeEmployee: int.parse(selectedAlternativeEmployee.value.value),
      fKAlternativeToPayingAnyDue:
          int.parse(selectedAlternativeToPay.value.value),
      fKHrVacationTypeId: int.parse(selectedType.value.value),
      fKReqStatusId: 9,
      dateFrom: dateFrom.value,
      dateTo: dateTo.value,
      description: remarkTextEditingController.value.text,
    )
        .then((value) {
      if (value != null) {
        Get.back(result: 'refresh', id: 2);
      }
      AppInterceptor.hideLoader();
    });
  }

  onClickBack() {
    Get.back(id: 2);
  }

  onClickCompleteProcedures() {
    Get.to(
      () => VacationsStepsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }
}
