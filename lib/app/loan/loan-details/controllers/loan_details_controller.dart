import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/loan/loan-details/models/create_loan.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/colors/colors.dart';
import '../../../dashboard/tabs/vacations/main/models/drop_down.dart';
import '../services/loan_details_service.dart';

class LoanDetailsController extends BaseController {
  /// SERVICES
  final LoanDetailsService _loanDetailsService = LoanDetailsService();

  /// CONTROLLERS

  /// VARIABLES
  Rx<DateTime> loanDate = DateTime.now().obs;
  Rx<CreateLoan?> createLoan = CreateLoan(paymentTypes: []).obs;
  RxList<DropDownModel> paymentTypeList = <DropDownModel>[].obs;
  RxString subject = "".obs;
  Rx<DropDownModel> selectedPaymentType =
      DropDownModel(disabled: false, text: "اختر", value: "").obs;
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController descriptionTextEditingController =
      TextEditingController();
  TextEditingController totalLoansTextEditingController =
      TextEditingController();
  CreateLoan? loan;
  bool? isDetails;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  getCreateLoan() {
    AppInterceptor.showLoader();
    _loanDetailsService
        .getCreateLoan(Get.locale?.languageCode ?? 'en')
        .then((value) {
      if (value != null) {
        titleTextEditingController.text = value.subject ?? '';
        createLoan.value = value;
        paymentTypeList.value = value.paymentTypes;
        selectedPaymentType.value = value.paymentTypes[0];
        subject.value = value.subject!;
        AppInterceptor.hideLoader();
      } else {
        createLoan.value = null;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// INITIALISATION
  void initValues() {
    if (Get.arguments != null) {
      loan = Get.arguments?[0]?['loan'];
      isDetails = Get.arguments?[1]?['isDetail'];
    }

    if (loan != null) {
      createLoan.value = loan;
      paymentTypeList.value = loan!.paymentTypes;
      selectedPaymentType.value = loan!.paymentTypes
          .firstWhere((value) => loan!.paymentType.toString() == value.value);
      subject.value = loan!.subject!;
      titleTextEditingController.text = loan!.subject!;
      totalLoansTextEditingController.text = loan!.totalAmount.toString();
      descriptionTextEditingController.text = loan!.description!;
    } else {
      getCreateLoan();
    }
  }

  /// FUNCTIONS
  void selectDate(
    BuildContext context,
  ) async {
    final DateTime? pickedDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary, // header background color
              onPrimary: AppColors.white, // header text color
              onSurface: AppColors.black, // body text color
            ),
            textTheme: Theme.of(context).textTheme.copyWith(
                  bodyLarge: TextStyle(fontSize: 14.sp),
                ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.black, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != loanDate.value) {
      loanDate.value = pickedDate;
    }
  }

  onSelectPaymentType(DropDownModel value) {
    selectedPaymentType.value = value;
  }

  onClickSubmit() {
    if (selectedPaymentType.value.value == "" ||
        titleTextEditingController.text.isEmpty ||
        selectedPaymentType.value.value == "" ||
        totalLoansTextEditingController.text.isEmpty) {
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
      if (loan != null) {
        AppInterceptor.showLoader();
        _loanDetailsService
            .updateLoan(
          id: loan!.id!,
          paymentType: int.parse(selectedPaymentType.value.value ?? "0"),
          loanDate: loanDate.value.toString().substring(0, 10),
          totalAmount: double.parse(totalLoansTextEditingController.value.text),
          subject: createLoan.value!.subject!,
          description: descriptionTextEditingController.value.text,
          creationDate: createLoan.value!.creationDate!,
          lastModifiedDate: createLoan.value!.lastModifiedDate!,
          isActive: createLoan.value!.isActive!,
          isDeleted: createLoan.value!.isDeleted!,
          isGeneralManager: createLoan.value!.isGeneralManager!,
          isFinancialDirector: createLoan.value!.isFinancialDirector!,
          isGeneralDirector: createLoan.value!.isGeneralDirector!,
          fKGeneralDirectorId: createLoan.value?.fKGeneralDirectorId,
          generalDirector: createLoan.value?.generalDirector,
          employeeName: createLoan.value!.employeeName!,
          fKReqStatusId: createLoan.value!.fKReqStatusId!,
          paymentTypeName: selectedPaymentType.value.text ?? "",
        )
            .then((value) {
          if (value != null) {
            Get.back(result: 'refresh');
          }
          AppInterceptor.hideLoader();
        });
      } else {
        AppInterceptor.showLoader();
        _loanDetailsService
            .createLoan(
          paymentType: int.parse(selectedPaymentType.value.value ?? "0"),
          loanDate: loanDate.value.toString().substring(0, 10),
          totalAmount: double.parse(totalLoansTextEditingController.value.text),
          subject: titleTextEditingController.text,
          description: descriptionTextEditingController.value.text,
          creationDate: createLoan.value!.creationDate!,
          lastModifiedDate: createLoan.value!.lastModifiedDate!,
          isActive: createLoan.value!.isActive!,
          isDeleted: createLoan.value!.isDeleted!,
          isGeneralManager: createLoan.value!.isGeneralManager!,
          isFinancialDirector: createLoan.value!.isFinancialDirector!,
          isGeneralDirector: createLoan.value!.isGeneralDirector!,
          fKGeneralDirectorId: createLoan.value?.fKGeneralDirectorId,
          generalDirector: createLoan.value?.generalDirector,
          employeeName: createLoan.value!.employeeName!,
          fKReqStatusId: createLoan.value!.fKReqStatusId!,
          paymentTypeName: selectedPaymentType.value.text ?? "",
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

  onClickBack() {
    Get.back();
  }
}
