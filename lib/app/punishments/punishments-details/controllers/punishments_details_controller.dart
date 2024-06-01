import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../../../auth/login/models/login_response.dart';
import '../../../dashboard/tabs/vacations/main/models/drop_down.dart';
import '../services/punishments_details_service.dart';

class PunishmentsDetailsController extends BaseController {
  /// SERVICES
  final PunishmentsDetailsService _punishmentsDetailsService =
      PunishmentsDetailsService();

  /// CONTROLLERS
  final TextEditingController amountTextEditingController =
      TextEditingController();
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
  Rx<Emp> employee = Emp(
    id: 0,
    code: "",
    fullName: "",
    fullNameEn: "",
    idNumber: "",
    fKDefBranchId: 0,
    fKHrManagementId: 0,
    fKHrDepartmentId: 0,
    birthDate: "",
    fKHrBloodTypeId: 0,
    gender: 0,
    placeOfBirth: "",
    fKNationalityId: 0,
    fKDefReligionId: 0,
    fKSocialStatusId: 0,
    hasAirlineTicket: false,
    contractDueDate: "",
    branchName: "",
    contractStartDate: "",
    fKGeneralManagerId: 0,
    fKManagingDirectorId: 0,
    fKHumanResourcesManagerId: 0,
    fKDepartmentManagerId: 0,
    fKDirectorGeneralId: 0,
    jobName: "",
    issuerName: "",
    isActive: true,
    creationDate: "",
    isDeleted: false,
    isDeveloper: false,
    fKCostcenterId: 0,
    fKCreatorId: 0,
    fKModifiedById: 0,
    lastModifiedDate: "",
  ).obs;

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
    employee.value = Emp.fromJson(GetStorage().read('employee'));

    selectedEmployee = employeesList[0].obs;
  }

  /// FUNCTIONS
  onSelectEmployee(DropDownModel value) {
    selectedEmployee.value = value;
  }

  onClickSubmit() {
    AppInterceptor.showLoader();
    _punishmentsDetailsService
        .createPunishment(
      amount: double.parse(amountTextEditingController.value.text),
      description: remarkTextEditingController.value.text,
      id: null,
      amountType: 1,
      assignees: [1, 2],
      departmentsIds: [1, 2],
      employeeReceive: 2,
      creationDate: DateTime.now().toString().substring(0, 10),
      fKHrEmployeeId: 1,
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
}
