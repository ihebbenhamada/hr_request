import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:request_hr/app/loan/loan-details/controllers/loan_details_controller.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/widgets/avatar-circle/avatar_circle.dart';
import 'package:request_hr/widgets/input/input_form.dart';

import '../../../../../../config/colors/colors.dart';

class LoanDetailsScreen extends StatelessWidget {
  final _loanDetailsController = Get.put(LoanDetailsController());
  LoanDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray2,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              (MediaQuery.of(context).viewPadding.top + 20).h.verticalSpace,
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
                    title: 'Payment Type',
                    inputType: 'select',
                    selectedDropDownItem:
                        _loanDetailsController.selectedPaymentType,
                    onSelect: (value) =>
                        _loanDetailsController.onSelectPaymentType(value),
                    listDropDown: _loanDetailsController.paymentTypeList,
                  ),
                  10.h.verticalSpace,
                  InputForm(
                    height: 55.h,
                    width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                    title: 'Title',
                    inputType: 'text',
                    text: 'Loan Request',
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
                      title: 'Loan Date',
                      inputType: 'date',
                      text: DateFormat('dd-MM-yyyy')
                          .format(_loanDetailsController.loanDate.value),
                      onSelectDate: () =>
                          _loanDetailsController.selectDate(context),
                    ),
                  ),
                  10.h.verticalSpace,
                  InputForm(
                    height: 55.h,
                    width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                    title: 'Total Loans',
                    inputType: 'text',
                    text: '2000',
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
              const InputForm(
                width: double.infinity,
                title: 'Topic',
                inputType: 'input',
                nbrLines: 5,
                text: 'Loan Request Date: 20 - 12 - 2023 Value: 7000',
              ),
              30.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _loanDetailsController.onClickSubmit,
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
                    onTap: _loanDetailsController.onClickBack,
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
    );
  }
}
