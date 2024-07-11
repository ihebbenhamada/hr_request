import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/widgets/avatar-circle/avatar_circle.dart';
import 'package:request_hr/widgets/custom-button/custom-button.dart';

import '../../../../api/models/public/department.dart';
import '../../../../api/models/public/employee.dart';
import '../../../../config/image_urls/image_urls.dart';
import '../controllers/create_mail_controller.dart';

class CreateMailScreen extends StatelessWidget {
  final _createMailController = Get.put(CreateMailController());

  CreateMailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          MediaQuery.of(context).viewPadding.top.verticalSpace,
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 25.0,
                right: 25,
                bottom: 230.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: AvatarCircle(
                      image: AppImages.profile,
                      circleColor: AppColors.white,
                      size: 111.h,
                      iconSize: 22.h,
                      imageSize: 95.h,
                      left: 13,
                      icon: AppImages.innTechDark,
                    ),
                  ),
                  19.h.verticalSpace,
                  Container(
                    height: 55.h,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 11,
                      vertical: 0,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.h),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "depart".tr,
                          style: TextStyle(
                            color: AppColors.white.withOpacity(0.56),
                            fontSize: 14.sp,
                          ),
                        ),
                        3.verticalSpace,
                        Obx(
                          () => DropdownButtonHideUnderline(
                            child: DropdownButton<Department>(
                              isDense: true,
                              value: _createMailController
                                  .selectedDepartment.value,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14.sp,
                              ),
                              menuMaxHeight:
                                  MediaQuery.of(context).size.height * .8,
                              isExpanded: true,
                              alignment: Alignment.bottomCenter,
                              dropdownColor: AppColors.primary,
                              icon: Image.asset(
                                AppImages.arrowDown,
                                height: 8.h,
                                color: AppColors.white,
                              ),
                              onChanged: (Department? newValue) =>
                                  _createMailController
                                      .onSelectDepartment(newValue!),
                              items: _createMailController.departmentList
                                  .map<DropdownMenuItem<Department>>(
                                      (Department value) {
                                return DropdownMenuItem<Department>(
                                  alignment: Get.locale?.languageCode == 'en'
                                      ? Alignment.centerLeft
                                      : Alignment.centerRight,
                                  value: value,
                                  child: Text(
                                    Get.locale?.languageCode == 'en'
                                        ? value.departmentNameEn!
                                        : value.departmentNameAr!,
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
                  19.h.verticalSpace,
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          left: 11,
                          right: 11,
                          bottom: 18,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12.h),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            5.h.verticalSpace,
                            Text(
                              "send_to".tr,
                              style: TextStyle(
                                color: AppColors.white.withOpacity(0.56),
                                fontSize: 14.sp,
                              ),
                            ),
                            GetBuilder<CreateMailController>(
                              builder: (_) => CustomDropdown<
                                  Employee>.multiSelectSearchRequest(
                                items: _createMailController.employeeList,
                                hintText: "select_employees".tr,
                                closedHeaderPadding:
                                    EdgeInsets.only(bottom: 10.h),
                                visibility: (value) => _createMailController
                                    .changeTextColor(value),
                                listItemBuilder: (context, employee, isSelected,
                                    onItemSelect) {
                                  return Text(
                                    Get.locale?.languageCode == 'en'
                                        ? employee.fullNameEn ??
                                            employee.fullName!
                                        : employee.fullName ?? '',
                                    style: TextStyle(
                                      color: isSelected
                                          ? AppColors.white
                                          : AppColors.blueDark,
                                    ),
                                  );
                                },
                                overlayHeight:
                                    MediaQuery.of(context).size.height * 0.6,
                                decoration: CustomDropdownDecoration(
                                  closedFillColor:
                                      AppColors.white.withOpacity(0),
                                  headerStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.blueDark,
                                  ),
                                  listItemDecoration: const ListItemDecoration(
                                    selectedColor: AppColors.primary,
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.white.withOpacity(0.56),
                                  ),
                                  closedSuffixIcon: Image.asset(
                                    AppImages.arrowDown,
                                    height: 8.h,
                                    color: AppColors.white,
                                  ),
                                ),
                                headerListBuilder:
                                    (context, employees, isTrue) {
                                  String listEmployees = "";
                                  employees.forEach((e) {
                                    listEmployees =
                                        '$listEmployees${Get.locale?.languageCode == 'en' && e.fullNameEn != null ? e.fullNameEn : e.fullName!}${Get.locale?.languageCode == 'en' ? ',' : '،'} ';
                                  });
                                  return Text(
                                    listEmployees,
                                    style: TextStyle(
                                      color:
                                          _createMailController.isSearchOpened
                                              ? AppColors.blueDark
                                              : AppColors.white,
                                    ),
                                  );
                                },
                                onListChanged: (List<Employee> list) =>
                                    _createMailController
                                        .onChangeListEmployee(list),
                                futureRequest: (value) =>
                                    _createMailController.searchEmployee(value),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Obx(
                        () => Container(
                          height: 26.h,
                          padding: EdgeInsets.only(right: 8.0, bottom: 6.h),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: _createMailController.imageList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 20.h,
                                width: 20.h,
                                decoration: const ShapeDecoration(
                                  shape: OvalBorder(
                                    side: BorderSide(color: AppColors.gray3),
                                  ),
                                ),
                                child: Center(
                                  child: Image.asset(AppImages.profile),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  19.h.verticalSpace,
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 11.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.white.withOpacity(0.1),
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _createMailController
                              .subjectMessageTextEditingController,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.white,
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: 1,
                          cursorColor: AppColors.gray1,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            hintText: 'subject_here'.tr,
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white.withOpacity(0.56),
                            ),
                          ),
                          autocorrect: false,
                          enableSuggestions: false,
                          enabled: true,
                          enableInteractiveSelection: true,
                        ),
                        5.h.verticalSpace,
                        const Divider(
                          height: 1,
                          color: AppColors.white,
                          thickness: 1,
                        ),
                        10.h.verticalSpace,
                        TextFormField(
                          controller: _createMailController
                              .bodyMessageTextEditingController,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.white,
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: 8,
                          cursorColor: AppColors.gray1,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            hintText: 'message_here'.tr,
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white.withOpacity(0.56),
                            ),
                          ),
                          autocorrect: false,
                          enableSuggestions: false,
                          enabled: true,
                          enableInteractiveSelection: true,
                        ),
                        const Divider(
                          height: 1,
                          color: AppColors.white,
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                  20.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 88.h,
                        height: 88.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.h),
                          color: AppColors.white.withOpacity(0.1),
                        ),
                        child: Column(
                          children: [
                            10.h.verticalSpace,
                            Text(
                              'upload_file'.tr,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.white,
                              ),
                            ),
                            13.h.verticalSpace,
                            Image.asset(
                              AppImages.upload,
                              height: 29,
                            )
                          ],
                        ),
                      ),
                      15.horizontalSpace,
                      Container(
                        width: 88.h,
                        height: 88.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.h),
                          color: AppColors.white.withOpacity(0.1),
                        ),
                        child: Column(
                          children: [
                            10.h.verticalSpace,
                            Text(
                              'print'.tr,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.white,
                              ),
                            ),
                            13.h.verticalSpace,
                            Image.asset(
                              AppImages.print,
                              height: 29,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
          color: AppColors.primary,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              18.h.verticalSpace,
              CustomButton(
                text: 'send'.tr,
                onClick: _createMailController.onClickSend,
              ),
              18.h.verticalSpace,
              CustomButton(
                text: 'back'.tr,
                onClick: _createMailController.onClickBack,
                isPrimary: false,
              ),
              18.h.verticalSpace,
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
