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
  /*final List<Map<String, dynamic>> listMails = [
    {
      'is_selected': false,
      'image': AppImages.profile,
      'subject': 'New plan for medical project',
      'date': '23Dec . 2024',
      'sender': 'Dina Mohamed',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and ',
    },
    {
      'is_selected': false,
      'image': AppImages.profile,
      'subject': 'New plan for medical project',
      'date': '23Dec . 2024',
      'sender': 'Dina Mohamed',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and ',
    },
    {
      'is_selected': false,
      'image': AppImages.profile,
      'subject': 'New plan for medical project',
      'date': '23Dec . 2024',
      'sender': 'Dina Mohamed',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and ',
    },
    {
      'is_selected': false,
      'image': AppImages.profile,
      'subject': 'New plan for medical project',
      'date': '23Dec . 2024',
      'sender': 'Dina Mohamed',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and ',
    },
    {
      'is_selected': false,
      'image': AppImages.profile,
      'subject': 'New plan for medical project',
      'date': '23Dec . 2024',
      'sender': 'Dina Mohamed',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and ',
    },
    {
      'is_selected': false,
      'image': AppImages.profile,
      'subject': 'New plan for medical project',
      'date': '23Dec . 2024',
      'sender': 'Dina Mohamed',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and ',
    },
    {
      'is_selected': false,
      'image': AppImages.profile,
      'subject': 'New plan for medical project',
      'date': '23Dec . 2024',
      'sender': 'Dina Mohamed',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and ',
    },
  ];*/
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
        mailList.add(
          Mail(
            id: 1,
            fKHrEmployeeId: 1,
            senderName: "hobba",
            subject: "subject",
            description: "description",
            reply: "reply",
            filePath: "https://placebear.com/g/200/200",
            fKReqStatusId: 1,
            creationDate: "2024-04-15",
            lastModifiedDate: "lastModifiedDate",
            isDeleted: false,
            isActive: true,
            isSelected: false,
          ),
        );
        mailList.add(
          Mail(
            id: 2,
            fKHrEmployeeId: 1,
            senderName: "hobba",
            subject: "subject",
            description: "description",
            reply: "reply",
            filePath: "https://placebear.com/g/200/200",
            fKReqStatusId: 1,
            creationDate: "2024-04-15",
            lastModifiedDate: "lastModifiedDate",
            isDeleted: false,
            isActive: true,
            isSelected: false,
          ),
        );
        update();
      }

      AppInterceptor.hideLoader();
    });
  }

  onClickCreateEmail() {
    Get.to(
      () => CreateMailScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  onClickMail() {
    Get.to(
      () => MailDetailsScreen(),
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

  onClickMenuMail(BuildContext context) {
    Get.bottomSheet(
      MenuMail(
        onClickSelectAll: onSelectAll,
        onClickDeselectAll: onDeselectAll,
        onClickInverse: onDeselectAll,
        onClickDelete: onDeleteMails,
        onClickReplay: onSelectAll,
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
}
