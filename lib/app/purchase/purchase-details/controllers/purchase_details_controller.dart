import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/colors/colors.dart';
import '../services/purchase_details_service.dart';

class PurchaseDetailsController extends BaseController {
  /// SERVICES
  final PurchaseDetailsService _purchaseDetailsService =
      PurchaseDetailsService();

  /// CONTROLLERS

  /// VARIABLES
  Rx<DateTime> orderDate = DateTime.now().obs;

  RxString selectedDepartment = 'Department1'.obs;
  RxString selectedResponsible = 'Responsible1'.obs;
  RxString selectedPurchaseOrderNumber = 'Purchase1'.obs;
  RxString selectedCategory = 'Category1'.obs;
  RxString selectedProductName = 'ProductName1'.obs;
  RxString selectedDescription = 'Description1'.obs;
  RxString selectedDescription1 = 'Description1'.obs;

  final List<String> departmentList = [
    'Department1',
    'Department2',
    'Department3',
    'Department4'
  ];
  final List<String> responsibleList = [
    'Responsible1',
    'Responsible2',
    'Responsible3',
    'Responsible4'
  ];
  final List<String> purchaseOrderNumberList = [
    'Purchase1',
    'Purchase2',
    'Purchase3',
    'Purchase4'
  ];
  final List<String> categoryList = [
    'Category1',
    'Category2',
    'Category3',
    'Category4'
  ];
  final List<String> productNameList = [
    'ProductName1',
    'ProductName2',
    'ProductName3',
    'ProductName4'
  ];
  final List<String> descriptionList = [
    'Description1',
    'Description2',
    'Description3',
    'Description4'
  ];
  final List<String> description2List = [
    'Description1',
    'Description2',
    'Description3',
    'Description4'
  ];

  RxList<String> namesList = <String>[].obs;
  final TextEditingController nameTextEditingController =
      TextEditingController(text: '');

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
  void initValues() {}

  /// FUNCTIONS
  void selectDate(BuildContext context) async {
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
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != orderDate.value) {
      orderDate.value = pickedDate;
    }
  }

  onSelect(String value, type) {
    switch (type) {
      case 0:
        selectedDepartment.value = value;
        break;
      case 1:
        selectedResponsible.value = value;
        break;
      case 2:
        selectedPurchaseOrderNumber.value = value;
        break;
      case 3:
        selectedCategory.value = value;
        break;
      case 4:
        selectedProductName.value = value;
        break;
      case 5:
        selectedDescription.value = value;
        break;
      case 6:
        selectedDescription1.value = value;
        break;
      default:
        null;
    }
  }

  onClickSubmit() {
    Get.back();
  }

  onClickBack() {
    Get.back();
  }

  addNames() {
    if (nameTextEditingController.value.text.isNotEmpty) {
      namesList.add(
          '${namesList.length + 1}- ${nameTextEditingController.value.text}');
      nameTextEditingController.clear();
    }
  }

  onDeleteName(int index) {
    namesList.removeAt(index);
  }
}
