import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/controllers/vacations_controller.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/models/drop_down.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-steps/main/screens/vacations_steps_screen.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/vacations_form_service.dart';

class VacationsFormController extends BaseController {
  /// SERVICES
  final VacationsFormService _vacationsFormService = VacationsFormService();
  VacationsController vacationController = Get.find();

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
    if (vacationController.selectedVacation != null) {
      getUpdateVacation(vacationController);
    } else {
      getCreateVacations();
    }
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
    if (selectedDate == 'from') {
      if (pickedDate != null && pickedDate.toString() != dateFrom.value) {
        dateFrom.value = pickedDate.toString().substring(0, 10);
      }
    } else {
      if (pickedDate != null && pickedDate.toString() != dateTo.value) {
        dateTo.value = pickedDate.toString().substring(0, 10);
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
        dueDate.value = value.dueDate ?? '--/--/--';
        employeesList.value = value.employees;
        selectedAlternativeToPay.value = value.employees[0];
        selectedAlternativeEmployee.value = value.employees[0];
      }
      AppInterceptor.hideLoader();
    });
  }

  getUpdateVacation(VacationsController vacationController) {
    selectedType.value = vacationController.selectedVacation!.vacationTypes
        .firstWhere((element) =>
            element.value ==
            vacationController.selectedVacation!.fKHrVacationTypeId.toString());
    vacationTypeList.value = vacationController.selectedVacation!.vacationTypes;
    dateFrom.value =
        vacationController.selectedVacation!.dateFrom.substring(0, 10);
    dateTo.value = vacationController.selectedVacation!.dateTo.substring(0, 10);
    dueDate.value =
        vacationController.selectedVacation?.dueDate.substring(0, 10) ??
            '--/--/--';

    employeesList.value = vacationController.selectedVacation!.employees;
    selectedAlternativeToPay.value =
        vacationController.selectedVacation!.employees.firstWhere(
      (element) =>
          element.value ==
          vacationController.selectedVacation?.fKAlternativeToPayingAnyDue
              .toString(),
      orElse: () => vacationController.selectedVacation!.employees[0],
    );
    selectedAlternativeEmployee.value =
        vacationController.selectedVacation!.employees.firstWhere(
      (element) =>
          element.value ==
          vacationController.selectedVacation?.fKAlternativeEmployee.toString(),
      orElse: () => vacationController.selectedVacation!.employees[0],
    );

    remarkTextEditingController.text =
        vacationController.selectedVacation!.description;
  }

  onClickSubmit() {
    AppInterceptor.showLoader();
    VacationsController vacationController = Get.find();
    if (vacationController.selectedVacation != null) {
      _vacationsFormService
          .updateVacation(
        vacationId: vacationController.selectedVacation!.vacationId,
        fKAlternativeEmployee:
            int.parse(selectedAlternativeEmployee.value.value ?? '0'),
        fKAlternativeToPayingAnyDue:
            int.parse(selectedAlternativeToPay.value.value ?? '0'),
        fKHrVacationTypeId: int.parse(selectedType.value.value ?? '0'),
        fKReqStatusId: 9,
        dateFrom: dateFrom.value,
        dateTo: dateTo.value,
        description: remarkTextEditingController.value.text,
      )
          .then((value) {
        if (value != null) {
          Get.back(result: 'refresh', id: 2);
        }
      });
    } else {
      _vacationsFormService
          .createVacation(
        fKAlternativeEmployee:
            int.parse(selectedAlternativeEmployee.value.value ?? '0'),
        fKAlternativeToPayingAnyDue:
            int.parse(selectedAlternativeToPay.value.value ?? '0'),
        fKHrVacationTypeId: int.parse(selectedType.value.value ?? '0'),
        fKReqStatusId: 9,
        dateFrom: dateFrom.value,
        dateTo: dateTo.value,
        description: remarkTextEditingController.value.text,
      )
          .then((value) {
        if (value != null) {
          Get.back(result: 'refresh', id: 2);
        }
      });
    }
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

  Future<List<DropDownModel>> searchEmployee(String value) async {
    return employeesList
        .where((employee) =>
            employee.text!.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }
}
