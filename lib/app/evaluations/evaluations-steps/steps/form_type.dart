import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/models/drop_down.dart';
import 'package:request_hr/app/evaluations/evaluations-steps/main/services/evaluations_steps_service.dart';
import 'package:request_hr/config/colors/colors.dart';

import '../../../../api/models/public/department.dart';
import '../../../../api/models/public/employee.dart';
import '../../../../api/requests/public_api.dart';
import '../../../../config/image_urls/image_urls.dart';
import '../../../../config/interceptor/interceptor.dart';

class FormType extends StatefulWidget {
  const FormType({
    super.key,
    required this.evaluationsStepsService,
    required this.onSelect,
    required this.onSelectDep,
    required this.onSelectEmp,
  });
  final EvaluationsStepsService evaluationsStepsService;
  final Function(DropDownModel) onSelect;
  final Function(Department) onSelectDep;
  final Function(Employee) onSelectEmp;
  @override
  State<FormType> createState() => _FormTypeState();
}

class _FormTypeState extends State<FormType> {
  RxList<DropDownModel> evalFormTypes = <DropDownModel>[].obs;
  Rx<DropDownModel> selectedEvalForm = DropDownModel().obs;
  RxList<Department> departmentList = <Department>[].obs;
  RxList<Employee> employeesList = <Employee>[].obs;
  Rx<Department> selectedDepartment = Department(id: 0).obs;
  Rx<Employee> selectedEmployee = Employee(id: 0).obs;
  final PublicApiServices _publicApiServices = PublicApiServices();

  @override
  void initState() {
    getFormTypes();
    super.initState();
  }

  getFormTypes() {
    AppInterceptor.showLoader();
    widget.evaluationsStepsService.getFormTypes().then((value) {
      if (value != null) {
        evalFormTypes.value = value;
        selectedEvalForm.value = value[0];
      }
      getDepartments();
    });
  }

  onSelectEvalForm(DropDownModel value) {
    selectedEvalForm.value = value;
    widget.onSelect(value);
  }

  onSelectDepartment(Department value) {
    AppInterceptor.showLoader();
    selectedDepartment.value = value;
    widget.onSelectDep(value);
    getEmployeesByDepartment(id: value.id.toString());
  }

  getDepartments() {
    _publicApiServices.getDepartments().then((listDepartments) {
      if (listDepartments != null) {
        departmentList.value = listDepartments;
        selectedDepartment.value = listDepartments[0];
        widget.onSelectDep(listDepartments[0]);
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

  onSelectEmployee(Employee value) {
    selectedEmployee.value = value;
    widget.onSelectEmp(value);
  }

  Future<List<Employee>> searchEmployee(String value) async {
    return employeesList
        .where((employee) =>
            employee.fullName!.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 55.h,
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: 11,
              right: 11,
              bottom: 0,
              top: 0,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.h),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x29000000),
                  blurRadius: 3,
                  offset: Offset(0, 3),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Depart",
                  style: TextStyle(
                    color: AppColors.gray6,
                    fontSize: 14.sp,
                  ),
                ),
                3.verticalSpace,
                Obx(
                  () => DropdownButtonHideUnderline(
                    child: DropdownButton<Department>(
                      isDense: true,
                      dropdownColor: AppColors.white,
                      value: selectedDepartment.value,
                      style: TextStyle(
                        color: AppColors.blueDark,
                        fontSize: 14.sp,
                      ),
                      isExpanded: true,
                      alignment: Alignment.bottomCenter,
                      icon: Image.asset(
                        AppImages.arrowDown,
                        height: 8.h,
                      ),
                      onChanged: (Department? newValue) =>
                          onSelectDepartment(newValue!),
                      items: departmentList.map<DropdownMenuItem<Department>>(
                          (Department value) {
                        return DropdownMenuItem<Department>(
                          alignment: Alignment.centerLeft,
                          value: value,
                          child: Text(
                            value.departmentNameEn ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
          13.h.verticalSpace,
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 11),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.h),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x29000000),
                  blurRadius: 3,
                  offset: Offset(0, 3),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                5.h.verticalSpace,
                Text(
                  "Choose Employee",
                  style: TextStyle(
                    color: AppColors.gray6,
                    fontSize: 14.sp,
                  ),
                ),
                CustomDropdown<Employee>.searchRequest(
                  items: employeesList,
                  hintText: "Select employee",
                  closedHeaderPadding: EdgeInsets.only(bottom: 10.h),
                  listItemBuilder:
                      (context, employee, isSelected, onItemSelect) {
                    return Text(employee.fullName ?? "");
                  },
                  headerBuilder: (context, emp, isTrue) {
                    return Text(emp.fullName ?? "");
                  },
                  decoration: CustomDropdownDecoration(
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                      ),
                      closedSuffixIcon: Image.asset(
                        AppImages.arrowDown,
                        height: 8.h,
                        color: AppColors.blueDark,
                      )),
                  futureRequest: (value) => searchEmployee(value),
                  onChanged: (Employee? employee) =>
                      onSelectEmployee(employee!),
                ),
              ],
            ),
          ),
          13.h.verticalSpace,
          Container(
            height: 55.h,
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: 11,
              right: 11,
              bottom: 0,
              top: 0,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.h),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x29000000),
                  blurRadius: 3,
                  offset: Offset(0, 3),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Evaluation form model',
                  style: TextStyle(
                    color: AppColors.gray6,
                    fontSize: 14.sp,
                  ),
                ),
                3.verticalSpace,
                Obx(
                  () => DropdownButtonHideUnderline(
                    child: DropdownButton<DropDownModel>(
                      isDense: true,
                      dropdownColor: AppColors.white,
                      value: selectedEvalForm.value,
                      style: TextStyle(
                        color: AppColors.blueDark,
                        fontSize: 14.sp,
                      ),
                      isExpanded: true,
                      alignment: Alignment.bottomCenter,
                      icon: Image.asset(
                        AppImages.arrowDown,
                        height: 8.h,
                        color: AppColors.blueDark,
                      ),
                      onChanged: (DropDownModel? newValue) =>
                          onSelectEvalForm(newValue!),
                      items: evalFormTypes.map<DropdownMenuItem<DropDownModel>>(
                          (DropDownModel value) {
                        return DropdownMenuItem<DropDownModel>(
                          alignment: Alignment.centerLeft,
                          value: value,
                          child: Text(
                            value.text ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          13.h.verticalSpace,
        ],
      ),
    );
  }
}
