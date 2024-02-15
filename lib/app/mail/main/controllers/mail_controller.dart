import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:request_hr/app/mail/create-mail/screens/create_mail_screen.dart';
import 'package:request_hr/app/mail/mail-details/screens/mail_details_screen.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

import '../../../../../config/controllerConfig/base_controller.dart';
import '../services/mail_service.dart';
import '../widget/menu_mail.dart';
import '../widget/search_bottom_sheet.dart';

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
  final List<Map<String, dynamic>> listMails = [
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
  ];
  final List<String> employeeList = ['Annual', 'Monthly', 'Weekly', 'daily'];
  RxString selectedEmployee = 'Annual'.obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE

  /// INITIALISATION
  void initValues() {
    storage = GetStorage();
  }

  /// FUNCTIONS
  onClickCreateEmail() {
    Get.to(
      () => CreateMailScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  onItemSelected() {
    Get.to(
      () => MailDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  onClickSearch(BuildContext context) {
    Get.bottomSheet(
      SearchBottomSheet(
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
      const MenuMail(),
      barrierColor: AppColors.primary.withOpacity(0.54),
      isDismissible: true,
      enableDrag: true,
    );
  }

  onSelectEmployee(String value) {
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
              onSurface: AppColors.gray6, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.gray6, // button text color
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
