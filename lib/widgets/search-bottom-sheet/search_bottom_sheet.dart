import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/widgets/custom-button/custom-button.dart';
import 'package:request_hr/widgets/input/input_form.dart';

class SearchBottomSheet extends StatelessWidget {
  const SearchBottomSheet({
    super.key,
    required this.dateFrom,
    required this.dateTo,
    required this.selectDate,
    required this.companyList,
    required this.selectedCompany,
    required this.departmentsList,
    required this.selectedDepartment,
    required this.onSelectCompany,
    required this.onSelectDepartment,
  });
  final Rx<DateTime> dateFrom;
  final Rx<DateTime> dateTo;
  final void Function(BuildContext, String) selectDate;
  final void Function(String) onSelectCompany;
  final void Function(String) onSelectDepartment;
  final List<String> companyList;
  final List<String> departmentsList;
  final RxString selectedCompany;
  final RxString selectedDepartment;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(30),
        topLeft: Radius.circular(30),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
        height: 450.h,
        color: AppColors.gray2,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => InputForm(
                    height: 55.h,
                    width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                    title: 'Date From',
                    inputType: 'date',
                    text: DateFormat('dd-MM-yyyy').format(dateFrom.value),
                    onSelectDate: () => selectDate(context, 'from'),
                  ),
                ),
                10.h.verticalSpace,
                Obx(
                  () => InputForm(
                    height: 55.h,
                    width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                    title: 'Date To',
                    inputType: 'date',
                    text: DateFormat('dd-MM-yyyy').format(dateTo.value),
                    onSelectDate: () => selectDate(context, 'to'),
                  ),
                ),
              ],
            ),
            23.h.verticalSpace,
            InputForm(
              height: 55.h,
              width: double.infinity,
              title: 'Choose Company',
              inputType: 'select',
              selectedDropDownItem: selectedCompany,
              onSelect: (value) => onSelectCompany(value),
              listDropDown: companyList,
            ),
            23.h.verticalSpace,
            InputForm(
              height: 55.h,
              width: double.infinity,
              title: 'Choose departments',
              inputType: 'select',
              selectedDropDownItem: selectedDepartment,
              onSelect: (value) => onSelectDepartment(value),
              listDropDown: departmentsList,
            ),
            25.h.verticalSpace,
            CustomButton(
              text: 'Search',
              height: 50.h,
              color: AppColors.primary,
              onClick: () {},
            ),
            23.h.verticalSpace,
            CustomButton(
              text: 'Back',
              height: 50.h,
              onClick: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
