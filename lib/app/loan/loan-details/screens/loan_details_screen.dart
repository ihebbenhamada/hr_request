import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:request_hr/app/loan/loan-details/controllers/loan_details_controller.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/widgets/avatar-circle/avatar_circle.dart';
import 'package:request_hr/widgets/input/input_form.dart';

import '../../../../../../config/colors/colors.dart';
import '../../main/models/loan_response.dart';

class LoanDetailsScreen extends StatelessWidget {
  final _loanDetailsController = Get.put(LoanDetailsController());
  LoanDetailsScreen({
    super.key,
    this.loanItem,
    required this.screenTitle,
  });
  final String screenTitle;
  final Loan? loanItem;

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
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 40.h,
                      width: 40.h,
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
                    screenTitle.tr,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
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
                    title: 'payment_type'.tr,
                    enabled: _loanDetailsController.isDetails != null &&
                            _loanDetailsController.isDetails == true
                        ? false
                        : true,
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
                    title: 'title'.tr,
                    inputType: 'input',
                    enabled: _loanDetailsController.isDetails != null &&
                            _loanDetailsController.isDetails == true
                        ? false
                        : true,
                    nbrLines: 1,
                    textEditingController:
                        _loanDetailsController.titleTextEditingController,
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
                      title: 'loan_date'.tr,
                      inputType: 'date',
                      enabled: _loanDetailsController.isDetails != null &&
                              _loanDetailsController.isDetails == true
                          ? false
                          : true,
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
                    title: 'total_loans'.tr,
                    inputType: 'input',
                    nbrLines: 1,
                    enabled: _loanDetailsController.isDetails != null &&
                            _loanDetailsController.isDetails == true
                        ? false
                        : true,
                    keyboardType: TextInputType.number,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(8),
                    ],
                    textEditingController:
                        _loanDetailsController.totalLoansTextEditingController,
                  ),
                ],
              ),
              15.h.verticalSpace,
              InputForm(
                height: 55.h,
                width: double.infinity,
                title: 'alternative_employee'.tr,
                inputType: 'text',
                text: 'Ahmed Mohamed Kazem',
              ),
              15.h.verticalSpace,
              InputForm(
                width: double.infinity,
                title: 'topic'.tr,
                inputType: 'input',
                nbrLines: 5,
                enabled: _loanDetailsController.isDetails != null &&
                        _loanDetailsController.isDetails == true
                    ? false
                    : true,
                textEditingController:
                    _loanDetailsController.descriptionTextEditingController,
              ),
              30.h.verticalSpace,
              _loanDetailsController.isDetails != null &&
                      _loanDetailsController.isDetails == false
                  ? Row(
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
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
