import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../../../dashboard/tabs/vacations/main/models/drop_down.dart';
import '../services/alert_details_service.dart';

class AlertDetailsController extends BaseController {
  /// SERVICES
  final AlertDetailsService _alertDetailsService = AlertDetailsService();

  /// CONTROLLERS
  final TextEditingController titleTextEditingController =
      TextEditingController();
  final TextEditingController remarkTextEditingController =
      TextEditingController();

  /// VARIABLES
  final List<DropDownModel> employeesList = [
    DropDownModel(disabled: false, text: 'Choose', value: '0'),
    DropDownModel(disabled: false, text: 'Mohamed Ahmed', value: '1'),
    DropDownModel(disabled: false, text: 'Iheb Ben Hamada', value: '2'),
    DropDownModel(disabled: false, text: 'Mohamed malki', value: '3'),
    DropDownModel(disabled: false, text: 'Mohamed ayed', value: '4'),
  ];

  late Rx<DropDownModel> selectedEmployee;

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
    selectedEmployee = employeesList[0].obs;
  }

  /// FUNCTIONS
  onClickSubmit() {
    AppInterceptor.showLoader();
    _alertDetailsService
        .createAlert(
      fKAssigneeId: 1,
      fKHrDepartmentId: 4,
      departmentsIds: [1, 2],
      assignees: [1, 2],
      hrDepartments: [
        {"Value": "1", "Text": "text"}
      ],
      isActive: true,
      lastModifiedDate: "2024-04-04",
      description: remarkTextEditingController.value.text,
      creationDate: DateTime.now().toString().substring(0, 10),
      fKHrEmployeeId: 4010,
      subject: titleTextEditingController.value.text,
      isDeleted: false,
    )
        .then((value) {
      if (value != null) {
        Get.back(result: 'refresh');
      }
      AppInterceptor.hideLoader();
    });
  }

  onSelectEmployee(DropDownModel value) {
    selectedEmployee.value = value;
  }
}
