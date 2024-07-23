import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:request_hr/app/alert/alert-details/controllers/alert_details_controller.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/widgets/avatar-circle/avatar_circle.dart';
import 'package:request_hr/widgets/input/input_form.dart';

import '../../../../../../config/colors/colors.dart';
import '../../../../api/models/public/department.dart';
import '../../../../api/models/public/employee.dart';

class AlertDetailsScreen extends StatelessWidget {
  final _alertDetailsController = Get.put(AlertDetailsController());
  AlertDetailsScreen({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
                      margin: EdgeInsets.only(
                        left: Get.locale?.languageCode == 'en' ? 25 : 0,
                        right: Get.locale?.languageCode == 'ar' ? 25 : 0,
                      ),
                      decoration: const ShapeDecoration(
                        shape: OvalBorder(),
                        color: AppColors.primary,
                      ),
                      child: Center(
                        child: Image.asset(
                          AppImages.back,
                          height: 20.h,
                          color: AppColors.white,
                          matchTextDirection: true,
                        ),
                      ),
                    ),
                  ),
                  10.h.horizontalSpace,
                  Text(
                    title.tr,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              _alertDetailsController.alertItem.value.id != 0
                  ? Padding(
                      padding: EdgeInsets.only(
                        right: Get.locale?.languageCode == 'en' ? 25.0 : 0,
                        left: Get.locale?.languageCode == 'ar' ? 25.0 : 0,
                      ),
                      child: SizedBox(
                        height: 111.h,
                        width: double.infinity,
                        child: Stack(
                          alignment: Get.locale?.languageCode == 'en'
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          children: [
                            Container(
                              width: 360.w,
                              height: 80.h,
                              padding: EdgeInsets.only(
                                left: Get.locale?.languageCode == 'en' ? 25 : 0,
                                right:
                                    Get.locale?.languageCode == 'ar' ? 25 : 0,
                              ),
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                image: DecorationImage(
                                  image: AssetImage(AppImages.poster),
                                  fit: BoxFit.cover,
                                  matchTextDirection: true,
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
                                          borderRadius:
                                              BorderRadius.circular(20.h),
                                          border: Border.all(
                                              color: AppColors.blue1),
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
                                        Get.locale?.languageCode == 'en'
                                            ? _alertDetailsController.alertItem
                                                    .value.byAssigneeName ??
                                                ''
                                            : _alertDetailsController.alertItem
                                                    .value.byAssigneeName ??
                                                '',
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
                                          borderRadius:
                                              BorderRadius.circular(20.h),
                                          border: Border.all(
                                            color: AppColors.blue1,
                                          ),
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
                                        Get.locale?.languageCode == 'en'
                                            ? _alertDetailsController.alertItem
                                                    .value.byAssigneeName ??
                                                ''
                                            : _alertDetailsController.alertItem
                                                    .value.byAssigneeName ??
                                                '',
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
                                          borderRadius:
                                              BorderRadius.circular(20.h),
                                          border: Border.all(
                                              color: AppColors.blue1),
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
                                        _alertDetailsController
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
                              right:
                                  Get.locale?.languageCode == 'en' ? 0 : null,
                              left: Get.locale?.languageCode == 'ar' ? 0 : null,
                              child: AvatarCircle(
                                image: AppImages.profile,
                                size: 112.h,
                                iconSize: 22.h,
                                imageSize: 95.h,
                                left: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
              40.h.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    GetStorage().read('isAdmin') == true
                        ? Container(
                            height: 55.h,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 11,
                              vertical: 0,
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
                                  "depart".tr,
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
                                      value: _alertDetailsController
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
                                          _alertDetailsController
                                              .onSelectDepartment(newValue!),
                                      items: _alertDetailsController
                                          .departmentList
                                          .map<DropdownMenuItem<Department>>(
                                              (Department value) {
                                        return DropdownMenuItem<Department>(
                                          alignment:
                                              Get.locale?.languageCode == 'en'
                                                  ? Alignment.centerLeft
                                                  : Alignment.centerRight,
                                          value: value,
                                          child: Text(
                                            (Get.locale?.languageCode == 'en'
                                                    ? value.departmentNameEn
                                                    : value.departmentNameAr) ??
                                                '',
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
                          )
                        : const SizedBox(),
                    GetStorage().read('isAdmin') == true
                        ? 13.h.verticalSpace
                        : const SizedBox(),
                    GetStorage().read('isAdmin') == true
                        ? Container(
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
                                  "choose_employee".tr,
                                  style: TextStyle(
                                    color: AppColors.gray6,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Obx(
                                  () => CustomDropdown<Employee>.searchRequest(
                                    items:
                                        _alertDetailsController.employeesList,
                                    hintText: "select_employee".tr,
                                    closedHeaderPadding:
                                        EdgeInsets.only(bottom: 10.h),
                                    listItemBuilder: (context, employee,
                                        isSelected, onItemSelect) {
                                      return Text(employee.fullName ?? "");
                                    },
                                    headerBuilder: (context, emp, isTrue) {
                                      return Text(_alertDetailsController
                                              .selectedEmployee
                                              .value
                                              .fullName ??
                                          "");
                                    },
                                    initialItem: _alertDetailsController
                                        .selectedEmployee.value,
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
                                        _alertDetailsController
                                            .searchEmployee(value),
                                    onChanged: (Employee? employee) {
                                      _alertDetailsController
                                          .selectedEmployee.value = employee!;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                    13.h.verticalSpace,
                    InputForm(
                      height: 55.h,
                      width: double.infinity,
                      title: 'alert_title'.tr,
                      inputType: 'input',
                      enabled: _alertDetailsController.alertItem.value.id == 0,
                      nbrLines: 1,
                      textEditingController:
                          _alertDetailsController.titleTextEditingController,
                    ),
                    13.h.verticalSpace,
                    InputForm(
                      width: double.infinity,
                      title: 'remark'.tr,
                      enabled: _alertDetailsController.alertItem.value.id == 0,
                      inputType: 'input',
                      textEditingController:
                          _alertDetailsController.remarkTextEditingController,
                    ),
                    30.h.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _alertDetailsController.alertItem.value.id == 0
                            ? GestureDetector(
                                onTap: _alertDetailsController.onClickSubmit,
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
                              )
                            : const SizedBox(),
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
      ),
    );
  }
}
