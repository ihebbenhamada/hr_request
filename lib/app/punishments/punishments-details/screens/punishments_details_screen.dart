import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/punishments/punishments-details/controllers/punishments_details_controller.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/widgets/avatar-circle/avatar_circle.dart';
import 'package:request_hr/widgets/input/input_form.dart';

import '../../../../../../config/colors/colors.dart';
import '../../../../api/models/public/department.dart';
import '../../../../api/models/public/employee.dart';

class PunishmentsDetailsScreen extends StatelessWidget {
  final _punishmentsDetailsController = Get.put(PunishmentsDetailsController());
  PunishmentsDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray2,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            (MediaQuery.of(context).viewPadding.top + 20).h.verticalSpace,
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    height: 40.h,
                    width: 40.h,
                    margin: const EdgeInsets.only(left: 25),
                    decoration: const ShapeDecoration(
                      shape: OvalBorder(),
                      color: AppColors.primary,
                    ),
                    child: Center(
                      child: Image.asset(
                        AppImages.back,
                        height: 20.h,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                10.h.horizontalSpace,
                Text(
                  'Create Punishment',
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: SizedBox(
                height: 111.h,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      width: 360.w,
                      height: 80.h,
                      padding: const EdgeInsets.only(left: 25),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        image: DecorationImage(
                          image: AssetImage(AppImages.poster),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 20.h,
                                width: 20.h,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(20.h),
                                  border: Border.all(color: AppColors.blue1),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    AppImages.employee,
                                    height: 12.5.h,
                                    width: 12,
                                  ),
                                ),
                              ),
                              4.horizontalSpace,
                              Text(
                                _punishmentsDetailsController
                                    .employee.value.fullNameEn,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          5.h.verticalSpace,
                          Row(
                            children: [
                              Container(
                                height: 20.h,
                                width: 20.h,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(20.h),
                                  border: Border.all(color: AppColors.blue1),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    AppImages.position,
                                    height: 10.7.h,
                                    width: 13.3,
                                  ),
                                ),
                              ),
                              4.horizontalSpace,
                              Text(
                                _punishmentsDetailsController
                                    .employee.value.jobName,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          5.h.verticalSpace,
                          Row(
                            children: [
                              Container(
                                height: 20.h,
                                width: 20.h,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(20.h),
                                  border: Border.all(color: AppColors.blue1),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    AppImages.cal,
                                    height: 8.h,
                                    width: 8.h,
                                  ),
                                ),
                              ),
                              4.horizontalSpace,
                              Text(
                                _punishmentsDetailsController
                                    .employee.value.creationDate
                                    .substring(0, 10),
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: AvatarCircle(
                        image: AppImages.avatar3,
                        size: 112.h,
                        iconSize: 22.h,
                        imageSize: 95.h,
                        left: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            40.h.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
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
                              value: _punishmentsDetailsController
                                  .selectedDepartment.value,
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
                                  _punishmentsDetailsController
                                      .onSelectDepartment(newValue!),
                              items: _punishmentsDetailsController
                                  .departmentList
                                  .map<DropdownMenuItem<Department>>(
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
                          items: _punishmentsDetailsController.employeesList,
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
                          futureRequest: (value) =>
                              _punishmentsDetailsController
                                  .searchEmployee(value),
                          onChanged: (Employee? employee) {
                            _punishmentsDetailsController
                                .selectedEmployee.value = employee!;
                          },
                        ),
                      ],
                    ),
                  ),
                  13.h.verticalSpace,
                  InputForm(
                    height: 55.h,
                    width: double.infinity,
                    title: 'Punishment Amount',
                    inputType: 'input',
                    nbrLines: 1,
                    textEditingController: _punishmentsDetailsController
                        .amountTextEditingController,
                    keyboardType: TextInputType.number,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(8),
                    ],
                  ),
                  13.h.verticalSpace,
                  InputForm(
                    height: 55.h,
                    width: double.infinity,
                    title: 'Punishment Title',
                    inputType: 'input',
                    nbrLines: 1,
                    textEditingController: _punishmentsDetailsController
                        .titleTextEditingController,
                  ),
                  13.h.verticalSpace,
                  InputForm(
                    width: double.infinity,
                    title: 'Remark',
                    inputType: 'input',
                    textEditingController: _punishmentsDetailsController
                        .remarkTextEditingController,
                  ),
                  30.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _punishmentsDetailsController.onClickSubmit,
                        child: Container(
                          height: 50.h,
                          width: 50.h,
                          decoration: const ShapeDecoration(
                            color: AppColors.primary,
                            shape: OvalBorder(),
                          ),
                          child: Center(
                            child: Image.asset(
                              AppImages.tick,
                              color: AppColors.white,
                              height: 30.h,
                            ),
                          ),
                        ),
                      ),
                      23.horizontalSpace,
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 50.h,
                          width: 50.h,
                          decoration: const ShapeDecoration(
                            color: AppColors.blueDark,
                            shape: OvalBorder(),
                          ),
                          child: Center(
                            child: Image.asset(
                              AppImages.x,
                              color: AppColors.white,
                              height: 20.h,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
