import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:request_hr/api/models/public/department.dart';
import 'package:request_hr/api/models/public/employee.dart';
import 'package:request_hr/api/models/public/meeting_point.dart';
import 'package:request_hr/api/requests/public_api.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../../../config/interceptor/interceptor.dart';
import '../../../../../auth/login/models/login_response.dart';
import '../services/meetings_details_service.dart';

class MeetingsDetailsController extends BaseController {
  /// SERVICES
  final MeetingsDetailsService _meetingsDetailsService =
      MeetingsDetailsService();
  final PublicApiServices _publicApiServices = PublicApiServices();

  /// CONTROLLERS

  /// VARIABLES
  RxList<MeetingPoint> meetingPointList = <MeetingPoint>[].obs;

  final TextEditingController meetingPointTextEditingController =
      TextEditingController(text: '');
  final TextEditingController meetingTitleTextEditingController =
      TextEditingController(text: '');
  final TextEditingController meetingSubjectTextEditingController =
      TextEditingController(text: '');

  RxList<File> files = <File>[].obs;
  RxString meetingDate = "".obs;
  RxList<Department> departmentList = <Department>[].obs;
  RxList<Employee> employeeList = <Employee>[].obs;
  Rx<Department> selectedDepartment = Department(id: 0).obs;
  RxList<Employee> selectedEmployees = <Employee>[].obs;
  RxList<String> imageList = <String>[].obs;
  RxList<int> assigneesList = <int>[].obs;

  final GetStorage storage = GetStorage();

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
    meetingDate.value = DateTime.now().toString().substring(0, 10);
    getDepartments();
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
        employeeList.value = listEmployees;
        selectedEmployees.value = [listEmployees[0]];
      }
      AppInterceptor.hideLoader();
    });
  }

  /// FUNCTIONS
  addMeetingPoint() {
    if (meetingPointTextEditingController.value.text.isNotEmpty) {
      meetingPointList.add(
        MeetingPoint(
          pointText: (meetingPointTextEditingController.value.text),
        ),
      );

      meetingPointTextEditingController.clear();
    }
  }

  uploadAttachment() {
    FilePicker.platform.pickFiles(allowMultiple: true).then((result) {
      if (result != null) {
        files.value = result.paths.map((path) => File(path!)).toList();
      } else {
        // User canceled the picker
      }
    });
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
    meetingDate.value = pickedDate.toString().substring(0, 10);
  }

  onSelectDepartment(Department value) {
    AppInterceptor.showLoader();
    selectedDepartment.value = value;
    getEmployeesByDepartment(id: value.id.toString());
  }

  onClickDone() {
    if (assigneesList.isEmpty ||
        meetingTitleTextEditingController.text.isEmpty ||
        meetingSubjectTextEditingController.text.isEmpty ||
        meetingPointList.isEmpty) {
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
      _meetingsDetailsService
          .createMeeting(
        subject: meetingSubjectTextEditingController.value.text,
        meetingDate: meetingDate.value,
        meetingTitle: meetingTitleTextEditingController.value.text,
        submitType: "send",
        fkCreatorId: Emp.fromJson(GetStorage().read('employee')).fKCreatorId,
        meetingPoints: meetingPointList.value,
        assignees: assigneesList,
      )
          .then((value) {
        if (value != null) {
          Get.back(result: 'refresh', id: 4);
        }
        AppInterceptor.hideLoader();
      });
    }
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
}
