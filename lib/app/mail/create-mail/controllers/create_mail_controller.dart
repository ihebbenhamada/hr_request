import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../config/controllerConfig/base_controller.dart';
import '../../../../api/models/public/department.dart';
import '../../../../api/models/public/employee.dart';
import '../../../../api/requests/public_api.dart';
import '../../../../config/image_urls/image_urls.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../services/create_mail_service.dart';

class CreateMailController extends BaseController {
  /// SERVICES
  final CreateMailService _createMailService = CreateMailService();
  final PublicApiServices _publicApiServices = PublicApiServices();

  /// CONTROLLERS
  final TextEditingController subjectMessageTextEditingController =
      TextEditingController();
  final TextEditingController bodyMessageTextEditingController =
      TextEditingController();
  SingleSelectController<Employee?>? controller =
      SingleSelectController<Employee?>(null);

  /// VARIABLES
  RxList<Department> departmentList = <Department>[].obs;
  RxList<Employee> employeeList = <Employee>[].obs;
  Rx<Department> selectedDepartment = Department(id: 0).obs;
  RxList<Employee> selectedEmployees = <Employee>[].obs;
  RxList<String> imageList = <String>[].obs;
  RxList<int> assigneesList = <int>[].obs;
  bool isSearchOpened = false;
  late GetStorage storage;

  /// VALIDATION

  /// SCREEN LIFE CYCLE

  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  /// INITIALISATION
  void initValues() {
    storage = GetStorage();
    getDepartments();
  }

  /// FUNCTIONS
  onClickSend() {
    AppInterceptor.showLoader();
    _createMailService
        .sendMessage(
      fkParentId: 1,
      fkHrEmployeeId: 1,
      subject: subjectMessageTextEditingController.text,
      description: bodyMessageTextEditingController.text,
      reply: null,
      assignees: assigneesList,
      departmentIds: [],
      filePath: "",
      fKReqStatusId: 1,
      assigneeName: "",
      byAssigneeName: "",
      jobName: "",
      fKCreatorId: 1,
      parentId: null,
      assigneeByImagePath: '',
      assigneeImagePath: '',
      creationDate: DateTime.now().toString().substring(0, 10),
      lastModifiedDate: DateTime.now().toString().substring(0, 10),
      isActive: true,
      isDeleted: false,
      receiver: 1,
      receivers: '',
      file: null,
      assigneesList: [],
      departments: [],
    )
        .then((value) {
      if (value != null) {
        Get.back(result: 'refresh');
      }
      AppInterceptor.hideLoader();
    });
  }

  onClickBack() {
    Get.back();
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

  onSelectDepartment(Department value) {
    AppInterceptor.showLoader();
    selectedDepartment.value = value;
    employeeList.value = [];
    selectedEmployees.value = [];
    getEmployeesByDepartment(id: value.id.toString());
  }

  getEmployeesByDepartment({required String id}) {
    _publicApiServices
        .getEmployeesByDepartment(
            id: id, lang: Get.locale?.languageCode ?? 'en')
        .then((listEmployees) {
      if (listEmployees != null) {
        employeeList.value = listEmployees;
        selectedEmployees.value = [listEmployees[0]];
      }
      AppInterceptor.hideLoader();
    });
  }

  Future<List<Employee>> searchEmployee(String value) async {
    return employeeList
        .where((employee) =>
            employee.fullName!.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  onChangeListEmployee(List<Employee> list) {
    imageList.value = [];
    assigneesList.value = [];
    list.forEach((element) {
      assigneesList.add(element.id);
      if (element.imagePath != null) {
        imageList.add(element.imagePath!);
      } else {
        imageList.add(AppImages.profile);
      }
    });
  }

  changeTextColor(bool value) {
    isSearchOpened = value;
    update();
  }
}
