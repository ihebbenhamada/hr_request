import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-form/controllers/vacations_form_controller.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/config/theme/theme_controller.dart';
import 'package:request_hr/widgets/avatar-circle/avatar_circle.dart';
import 'package:request_hr/widgets/input/input_form.dart';

class VacationsFormScreen extends StatelessWidget {
  final _vacationsFormController = Get.put(VacationsFormController());
  final ThemeController _themeController = Get.find();
  VacationsFormScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray2,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
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
                  width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                  height: 55.h,
                  title: 'Vacation Type',
                  inputType: 'select',
                  selectedDropDownItem: _vacationsFormController.selectedType,
                  onSelect: (value) =>
                      _vacationsFormController.onSelectVacationType(value),
                  listDropDown: _vacationsFormController.vacationTypeList,
                ),
                10.h.verticalSpace,
                InputForm(
                  height: 55.h,
                  width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                  title: 'Due Date',
                  inputType: 'text',
                  text: '20-10-2024',
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
                    title: 'Date From',
                    inputType: 'date',
                    text: DateFormat('dd-MM-yyyy')
                        .format(_vacationsFormController.dateFrom.value),
                    onSelectDate: () =>
                        _vacationsFormController.selectDate(context, 'from'),
                  ),
                ),
                10.h.verticalSpace,
                Obx(
                  () => InputForm(
                    height: 55.h,
                    width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                    title: 'Date To',
                    inputType: 'date',
                    text: DateFormat('dd-MM-yyyy')
                        .format(_vacationsFormController.dateTo.value),
                    onSelectDate: () =>
                        _vacationsFormController.selectDate(context, 'to'),
                  ),
                ),
              ],
            ),
            15.h.verticalSpace,
            InputForm(
              height: 55.h,
              width: double.infinity,
              title: 'Alternative Employee',
              inputType: 'text',
              text: 'Ahmed Mohamed Kazem',
            ),
            15.h.verticalSpace,
            InputForm(
              height: 55.h,
              width: double.infinity,
              title: 'Alternative To Paying Any Due',
              inputType: 'text',
              text: 'Mohamed Maged Saleh',
            ),
            15.h.verticalSpace,
            InputForm(
              height: 140.h,
              width: double.infinity,
              title: 'Remark',
              inputType: 'input',
              text: 'Mohamed Maged Saleh',
            ),
            15.h.verticalSpace,
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  color: AppColors.redLight,
                ),
                child: Text(
                  'Completing the procedures',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ),
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
                  onTap: () {
                    Get.back(id: 2);
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
    );
  }
}
