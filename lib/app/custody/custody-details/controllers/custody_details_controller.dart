import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/custody/main/models/custody.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/colors/colors.dart';
import '../../../dashboard/tabs/vacations/main/models/drop_down.dart';
import '../services/custody_details_service.dart';

class CustodyDetailsController extends BaseController {
  /// SERVICES
  final CustodyDetailsService _custodyDetailsService = CustodyDetailsService();

  /// CONTROLLERS
  final TextEditingController totalCustodyTextEditingController =
      TextEditingController();
  final TextEditingController titleCustodyTextEditingController =
      TextEditingController();
  final TextEditingController nameCustodyTextEditingController =
      TextEditingController();
  final TextEditingController topicCustodyTextEditingController =
      TextEditingController();

  /// VARIABLES

  Rx<DateTime> custodyDate = DateTime.now().obs;
  RxInt id = 0.obs;
  final List<DropDownModel> paymentTypeList = [
    DropDownModel(disabled: false, text: 'cash'.tr, value: '1'),
    DropDownModel(disabled: false, text: 'check'.tr, value: '2'),
    DropDownModel(disabled: false, text: 'bank_transfer'.tr, value: '4'),
  ];
  final List<DropDownModel> custodyTypeList = [
    DropDownModel(disabled: false, text: 'choose'.tr, value: '0'),
    DropDownModel(disabled: false, text: 'temporary'.tr, value: '1'),
    DropDownModel(disabled: false, text: 'permanent'.tr, value: '2'),
  ];
  Rx<DropDownModel> selectedPaymentType =
      DropDownModel(disabled: false, text: "", value: "").obs;
  Rx<DropDownModel> selectedCustodyType =
      DropDownModel(disabled: false, text: "", value: "").obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// INITIALISATION
  void initValues() {
    if (Get.arguments != null) {
      Custody custody = Get.arguments;
      id.value = custody.custodyId;

      selectedPaymentType.value = paymentTypeList
          .where((element) =>
              int.parse(element.value ?? "0") == custody.paymentType)
          .first;
      selectedCustodyType.value = custodyTypeList
          .where((element) =>
              int.parse(element.value ?? '0') == custody.fkCbCustodyTypeId)
          .first;
      custodyDate.value = DateTime.parse(custody.dateCustody);
      totalCustodyTextEditingController.text = custody.totalAmount.toString();
      titleCustodyTextEditingController.text = custody.subject;
      nameCustodyTextEditingController.text = custody.custodyName;
      topicCustodyTextEditingController.text = custody.description;
    } else {
      selectedCustodyType.value = custodyTypeList[0];
      selectedPaymentType.value = paymentTypeList[0];
    }
  }

  /// FUNCTIONS

  void selectDate(BuildContext context) async {
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
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != custodyDate.value) {
      custodyDate.value = pickedDate;
    }
  }

  onSelectPaymentType(DropDownModel value) {
    selectedPaymentType.value = value;
  }

  onSelectCustodyType(DropDownModel value) {
    selectedCustodyType.value = value;
  }

  onClickSubmit() {
    if (totalCustodyTextEditingController.text.isEmpty ||
        titleCustodyTextEditingController.text.isEmpty ||
        nameCustodyTextEditingController.text.isEmpty ||
        selectedCustodyType.value.value == '' ||
        topicCustodyTextEditingController.text.isEmpty) {
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
      AppInterceptor.showLoader();
      if (Get.arguments != null) {
        _custodyDetailsService
            .updateCustody(
          id: id.value,
          paymentType: int.parse(selectedPaymentType.value.value ?? '0'),
          dateCustody: custodyDate.toString(),
          totalAmount: int.parse(totalCustodyTextEditingController.value.text),
          fKCbCustodyTypeId: int.parse(selectedCustodyType.value.value ?? '0'),
          custodyName: nameCustodyTextEditingController.value.text,
          subject: titleCustodyTextEditingController.value.text,
          description: topicCustodyTextEditingController.value.text,
        )
            .then((value) {
          if (value != null) {
            Get.back(result: 'refresh');
          }
          AppInterceptor.hideLoader();
        });
      } else {
        _custodyDetailsService
            .createCustody(
          paymentType: int.parse(selectedPaymentType.value.value ?? '0'),
          dateCustody: custodyDate.toString(),
          totalAmount: int.parse(totalCustodyTextEditingController.value.text),
          fKCbCustodyTypeId: int.parse(selectedCustodyType.value.value ?? '0'),
          custodyName: nameCustodyTextEditingController.value.text,
          subject: titleCustodyTextEditingController.value.text,
          description: topicCustodyTextEditingController.value.text,
          fKHrEmployeeId: 296,
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
