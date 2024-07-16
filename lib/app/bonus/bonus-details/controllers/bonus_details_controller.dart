import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:request_hr/api/models/public/employee.dart';
import 'package:request_hr/app/auth/login/models/login_response.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../api/models/public/department.dart';
import '../../../../api/requests/public_api.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../services/bonus_details_service.dart';

class BonusDetailsController extends BaseController {
  /// SERVICES
  final BonusDetailsService _bonusDetailsService = BonusDetailsService();
  final PublicApiServices _publicApiServices = PublicApiServices();

  /// CONTROLLERS
  final TextEditingController amountTextEditingController =
      TextEditingController();
  final TextEditingController titleTextEditingController =
      TextEditingController();
  final TextEditingController remarkTextEditingController =
      TextEditingController();

  /// VARIABLES
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
  GetStorage storage = GetStorage();

  RxList<Department> departmentList = <Department>[].obs;
  RxList<Employee> employeesList = <Employee>[].obs;
  Rx<Department> selectedDepartment = Department(id: 0).obs;
  Rx<Employee> selectedEmployee = Employee(id: 0).obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  onSelectDepartment(Department value) {
    AppInterceptor.showLoader();
    selectedDepartment.value = value;
    getEmployeesByDepartment(id: value.id.toString());
  }

  getDepartments() {
    AppInterceptor.showLoader();
    _publicApiServices
        .getDepartments(lang: Get.locale?.languageCode ?? 'en')
        .then((listDepartments) {
      if (listDepartments != null) {
        departmentList.value = listDepartments;
        selectedDepartment.value = listDepartments[0];
        getEmployeesByDepartment(id: listDepartments[0].id.toString());
      }
    });
  }

  getEmployeesByDepartment({required String id}) {
    _publicApiServices.getEmployeesByDepartment(id: id).then((listEmployees) {
      if (listEmployees != null) {
        employeesList.value = listEmployees;
        selectedEmployee.value = listEmployees[0];
      }
      AppInterceptor.hideLoader();
    });
  }

  /// INITIALISATION
  void initValues() {
    employee.value = Emp.fromJson(GetStorage().read('employee'));
    getDepartments();
  }

  /// FUNCTIONS
  onSelectEmployee(Employee value) {
    selectedEmployee.value = value;
  }

  Future<List<Employee>> searchEmployee(String value) async {
    return employeesList
        .where((employee) =>
            employee.fullName!.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  onClickSubmit() {
    if (amountTextEditingController.text.isEmpty ||
        titleTextEditingController.text.isEmpty ||
        remarkTextEditingController.text.isEmpty ||
        selectedDepartment.value.id == 0 ||
        selectedEmployee.value.id == 0) {
      Fluttertoast.showToast(
        msg: "fill_credentials_toast".tr,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.redLight,
        textColor: AppColors.white,
        fontSize: 16.0.sp,
      );
    } else {
      AppInterceptor.showLoader();
      _bonusDetailsService
          .createBonus(
        amount: double.parse(amountTextEditingController.value.text),
        description: remarkTextEditingController.value.text,
        bonusType: 1,
        creationDate: DateTime.now().toString().substring(0, 10),
        fKHrEmployeeId: employee.value.id,
        subject: titleTextEditingController.value.text,
        assignees: [selectedEmployee.value.id],
        departmentsIds: [selectedDepartment.value.id],
        fKAssigneeId: selectedEmployee.value.id,
        fKHrDepartmentId: selectedDepartment.value.id,
        hrDepartments: [
          {
            "Value": selectedDepartment.value.id.toString(),
            "Text": selectedDepartment.value.departmentNameEn
          }
        ],
        isActive: true,
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
}
