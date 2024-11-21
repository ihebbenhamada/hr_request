import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/config/theme/theme_controller.dart';
import 'package:request_hr/widgets/avatar-circle/avatar_circle.dart';
import 'package:request_hr/widgets/input/input_form.dart';

import '../../main/models/drop_down.dart';
import '../controllers/vacations_form_controller.dart';

class VacationsFormScreen extends StatelessWidget {
  final _vacationsFormController = Get.put(VacationsFormController());
  final ThemeController _themeController = Get.find();
  VacationsFormScreen({
    super.key,
    this.from,
  });
  final String? from;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.gray2,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                from == 'showAll'
                    ? (MediaQuery.of(context).viewPadding.top).h.verticalSpace
                    : 0.h.verticalSpace,
                Center(
                  child: AvatarCircle(
                    image: AppImages.profile,
                    icon: AppImages.innTechDark,
                    size: 111.h,
                    iconSize: 22.h,
                    imageSize: 95.h,
                    left: 13,
                  ),
                ),
                30.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InputForm(
                      height: 55.h,
                      width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                      title: 'vacation_type'.tr,
                      inputType: 'select',
                      selectedDropDownItem:
                          _vacationsFormController.selectedType,
                      onSelect: (value) =>
                          _vacationsFormController.onSelectVacationType(value),
                      listDropDown: _vacationsFormController.vacationTypeList,
                    ),
                    10.h.verticalSpace,
                    InputForm(
                      height: 55.h,
                      width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                      title: 'due_date'.tr,
                      isDynamicText: true,
                      dynamicText: _vacationsFormController.dueDate,
                      inputType: 'text',
                    ),
                  ],
                ),
                15.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => InputForm(
                        height: 55.h,
                        width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                        title: 'date_from'.tr,
                        inputType: 'date',
                        text: _vacationsFormController.dateFrom.value,
                        onSelectDate: () => _vacationsFormController.selectDate(
                            context, 'from'),
                      ),
                    ),
                    10.h.verticalSpace,
                    Obx(
                      () => InputForm(
                        height: 55.h,
                        width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                        title: 'date_to'.tr,
                        inputType: 'date',
                        text: _vacationsFormController.dateTo.value,
                        onSelectDate: () =>
                            _vacationsFormController.selectDate(context, 'to'),
                      ),
                    ),
                  ],
                ),
                15.h.verticalSpace,
                Container(
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
                        "alternative_employee".tr,
                        style: TextStyle(
                          color: AppColors.gray6,
                          fontSize: 14.sp,
                        ),
                      ),
                      CustomDropdown<DropDownModel>.searchRequest(
                        items: _vacationsFormController.employeesList,
                        hintText: "select_employee".tr,
                        closedHeaderPadding: EdgeInsets.only(bottom: 10.h),
                        listItemBuilder:
                            (context, employee, isSelected, onItemSelect) {
                          return Text(
                            employee.text ?? "",
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          );
                        },
                        headerBuilder: (context, employee, isTrue) {
                          return Text(employee.text ?? "");
                        },
                        overlayHeight: MediaQuery.of(context).size.height * 0.4,
                        decoration: CustomDropdownDecoration(
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                          ),
                          closedSuffixIcon: Image.asset(
                            AppImages.arrowDown,
                            height: 8.h,
                            color: AppColors.blueDark,
                          ),
                        ),
                        onChanged: (DropDownModel? employee) {
                          _vacationsFormController
                              .selectedAlternativeEmployee.value = employee!;
                        },
                        initialItem: _vacationsFormController
                            .selectedAlternativeEmployee.value,
                        futureRequest: (value) =>
                            _vacationsFormController.searchEmployee(value),
                      ),
                    ],
                  ),
                ),
                15.h.verticalSpace,
                Container(
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
                        "alternative_paying_due".tr,
                        style: TextStyle(
                          color: AppColors.gray6,
                          fontSize: 14.sp,
                        ),
                      ),
                      CustomDropdown<DropDownModel>.searchRequest(
                        items: _vacationsFormController.employeesList,
                        hintText: "select_employee".tr,
                        closedHeaderPadding: EdgeInsets.only(bottom: 10.h),
                        listItemBuilder:
                            (context, employee, isSelected, onItemSelect) {
                          return Text(
                            employee.text ?? '0',
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          );
                        },
                        headerBuilder: (context, employee, isTrue) {
                          return Text(employee.text ?? '0');
                        },
                        overlayHeight: MediaQuery.of(context).size.height * 0.3,
                        decoration: CustomDropdownDecoration(
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                          ),
                          closedSuffixIcon: Image.asset(
                            AppImages.arrowDown,
                            height: 8.h,
                            color: AppColors.blueDark,
                          ),
                        ),
                        onChanged: (DropDownModel? employee) {
                          _vacationsFormController
                              .selectedAlternativeToPay.value = employee!;
                        },
                        initialItem: _vacationsFormController
                            .selectedAlternativeToPay.value,
                        futureRequest: (value) =>
                            _vacationsFormController.searchEmployee(value),
                      ),
                    ],
                  ),
                ),
                15.h.verticalSpace,
                InputForm(
                  textEditingController:
                      _vacationsFormController.remarkTextEditingController,
                  width: double.infinity,
                  title: 'remark'.tr,
                  inputType: 'input',
                  text: 'Mohamed Maged Saleh',
                ),
                30.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _vacationsFormController.onClickSubmit,
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
                      onTap: () => _vacationsFormController.onClickBack(from),
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
        ),
      ),
    );
  }
}
