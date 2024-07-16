import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../api/requests/public_api.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../../../auth/login/models/login_response.dart';
import '../../../dashboard/tabs/vacations/main/models/drop_down.dart';
import '../services/complaint_details_service.dart';

class ComplaintDetailsController extends BaseController {
  /// SERVICES
  final ComplaintDetailsService _complaintDetailsService =
      ComplaintDetailsService();
  final PublicApiServices _publicApiServices = PublicApiServices();

  /// CONTROLLERS
  final TextEditingController subjectTextEditingController =
      TextEditingController();
  final TextEditingController descriptionTextEditingController =
      TextEditingController();

  /// VARIABLES
  RxList<DropDownModel> jobTypesList = <DropDownModel>[].obs;
  RxList<int> jobTypesIds = <int>[].obs;

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

  /// INITIALISATION
  void initValues() {
    getJobTypes();
    employee.value = Emp.fromJson(GetStorage().read('employee'));
  }

  /// FUNCTIONS

  getJobTypes() {
    AppInterceptor.showLoader();
    _complaintDetailsService.getJobTypes().then((listJobTypes) {
      if (listJobTypes != null) {
        jobTypesList.value = listJobTypes;
      }
      AppInterceptor.hideLoader();
    });
  }

  onChangeListJobs(List<DropDownModel> list) {
    jobTypesIds.value = [];
    list.forEach((element) {
      jobTypesIds.add(int.tryParse(element.value ?? '') ?? 0);
    });
  }

  Future<List<DropDownModel>> searchJobType(String value) async {
    return jobTypesList
        .where((jobType) =>
            jobType.text!.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  onClickSubmit() {
    if (subjectTextEditingController.text.isEmpty ||
        descriptionTextEditingController.text.isEmpty ||
        jobTypesIds.isEmpty) {
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
      _complaintDetailsService
          .createComplaint(
        description: descriptionTextEditingController.value.text,
        fKHrEmployeeId: employee.value.id,
        subject: subjectTextEditingController.value.text,
        jobTypesIds: jobTypesIds,
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
