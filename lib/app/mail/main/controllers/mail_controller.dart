import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:request_hr/app/mail/create-mail/screens/create_mail_screen.dart';
import 'package:request_hr/app/mail/mail-details/screens/mail_details_screen.dart';
import 'package:request_hr/app/mail/main/model/mail.dart';
import 'package:request_hr/app/mail/main/widget/search_mail_bottom_sheet.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../config/controllerConfig/base_controller.dart';
import '../../../dashboard/tabs/vacations/main/models/drop_down.dart';
import '../services/mail_service.dart';
import '../widget/menu_mail.dart';

class MailController extends BaseController {
  /// SERVICES
  final MailService _mailService = MailService();
  late GetStorage storage;

  /// CONTROLLERS

  /// VARIABLES
  Rx<DateTime> dateFrom = DateTime.now().obs;
  Rx<DateTime> dateTo = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day + 1,
  ).obs;
  List<Mail> mailList = <Mail>[];
  List<Mail> selectedEmails = <Mail>[];

  final List<DropDownModel> employeeList = [
    DropDownModel(disabled: false, text: 'Choose', value: '0'),
    DropDownModel(disabled: false, text: 'Annual', value: '1'),
    DropDownModel(disabled: false, text: 'Monthly', value: '2'),
    DropDownModel(disabled: false, text: 'Weekly', value: '3'),
    DropDownModel(disabled: false, text: 'daily', value: '4'),
  ];

  late Rx<DropDownModel> selectedEmployee;

  /// VALIDATION

  /// SCREEN LIFE CYCLE

  /// INITIALISATION
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  void initValues() {
    storage = GetStorage();
    getMails();
  }

  /// FUNCTIONS
  getMails() {
    AppInterceptor.showLoader();
    _mailService.getMailList().then((value) {
      if (value != null) {
        mailList = value;
        update();
      }

      AppInterceptor.hideLoader();
    });
  }

  onClickCreateEmail() async {
    final result = await Get.to(
      () => CreateMailScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
    if (result != null) {
      getMails();
    }
  }

  onClickMail({required Mail mail, required String from}) {
    Get.to(
      () => MailDetailsScreen(),
      arguments: [mail, from],
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  onSelectMail(int index) {
    for (int i = 0; i < mailList.length; i++) {
      if (i == index) {
        mailList[index].isSelected = !mailList[index].isSelected;
        update();
      }
    }
  }

  onSelectAll() {
    mailList.forEach((element) {
      element.isSelected = true;
    });
    update();
    Get.back();
  }

  onDeselectAll() {
    mailList.forEach((element) {
      element.isSelected = false;
    });
    update();
    Get.back();
  }

  onDeleteMails() {
    mailList.removeWhere((e) => e.isSelected == true);
    update();
    Get.back();
  }

  onClickSearch(BuildContext context) {
    Get.bottomSheet(
      SearchMailBottomSheet(
        dateFrom: dateFrom,
        dateTo: dateTo,
        selectDate: (context, value) => selectDate(context, value),
        employeeList: employeeList,
        selectedEmployee: selectedEmployee,
        onSelectEmployee: (value) => onSelectEmployee(value),
      ),
      barrierColor: AppColors.primary.withOpacity(0.54),
      isDismissible: true,
      enableDrag: true,
    );
  }

  replayEmail({bool? isMenu}) {
    int lengthSelected = mailList.where((map) => map.isSelected == true).length;
    if (lengthSelected == 1) {
      Mail mail = mailList.where((map) => map.isSelected == true).first;
      onClickMail(mail: mail, from: "replay");
    }
    if (isMenu != null) {
      Get.back();
    }
  }

  onClickMenuMail(BuildContext context) {
    Get.bottomSheet(
      MenuMail(
        onClickSelectAll: onSelectAll,
        onClickDeselectAll: onDeselectAll,
        onClickInverse: onDeselectAll,
        onClickDelete: onDeleteMails,
        onClickReplay: replayEmail,
      ),
      barrierColor: AppColors.primary.withOpacity(0.54),
      isDismissible: true,
      enableDrag: true,
    );
  }

  onSelectEmployee(DropDownModel value) {
    selectedEmployee.value = value;
  }

  void selectDate(
    BuildContext context,
    String selectedDate,
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
    if (selectedDate == 'from') {
      if (pickedDate != null && pickedDate != dateFrom.value) {
        dateFrom.value = pickedDate;
      }
    } else {
      if (pickedDate != null && pickedDate != dateTo.value) {
        dateTo.value = pickedDate;
      }
    }
  }

  Future<void> handleRefresh() async {
    getMails();
  }
}
