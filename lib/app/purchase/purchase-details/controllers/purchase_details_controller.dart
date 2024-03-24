import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/colors/colors.dart';
import '../../../dashboard/tabs/vacations/main/models/drop_down.dart';
import '../services/purchase_details_service.dart';

class PurchaseDetailsController extends BaseController {
  /// SERVICES
  final PurchaseDetailsService _purchaseDetailsService =
      PurchaseDetailsService();

  /// CONTROLLERS

  /// VARIABLES
  Rx<DateTime> orderDate = DateTime.now().obs;

  final List<DropDownModel> departmentList = [
    DropDownModel(disabled: false, text: 'Choose', value: '0'),
    DropDownModel(disabled: false, text: 'Department1', value: '1'),
    DropDownModel(disabled: false, text: 'Department2', value: '2'),
    DropDownModel(disabled: false, text: 'Department3', value: '3'),
    DropDownModel(disabled: false, text: 'Department4', value: '4'),
  ];
  final List<DropDownModel> responsibleList = [
    DropDownModel(disabled: false, text: 'Choose', value: '0'),
    DropDownModel(disabled: false, text: 'Responsible1', value: '1'),
    DropDownModel(disabled: false, text: 'Responsible2', value: '2'),
    DropDownModel(disabled: false, text: 'Responsible3', value: '3'),
    DropDownModel(disabled: false, text: 'Responsible4', value: '4'),
  ];
  final List<DropDownModel> purchaseOrderNumberList = [
    DropDownModel(disabled: false, text: 'Choose', value: '0'),
    DropDownModel(disabled: false, text: 'Purchase1', value: '1'),
    DropDownModel(disabled: false, text: 'Purchase2', value: '2'),
    DropDownModel(disabled: false, text: 'Purchase3', value: '3'),
    DropDownModel(disabled: false, text: 'Purchase4', value: '4'),
  ];
  final List<DropDownModel> categoryList = [
    DropDownModel(disabled: false, text: 'Choose', value: '0'),
    DropDownModel(disabled: false, text: 'Category1', value: '1'),
    DropDownModel(disabled: false, text: 'Category2', value: '2'),
    DropDownModel(disabled: false, text: 'Category3', value: '3'),
    DropDownModel(disabled: false, text: 'Category4', value: '4'),
  ];
  final List<DropDownModel> productNameList = [
    DropDownModel(disabled: false, text: 'Choose', value: '0'),
    DropDownModel(disabled: false, text: 'ProductName1', value: '1'),
    DropDownModel(disabled: false, text: 'ProductName2', value: '2'),
    DropDownModel(disabled: false, text: 'ProductName3', value: '3'),
    DropDownModel(disabled: false, text: 'ProductName4', value: '4'),
  ];
  final List<DropDownModel> descriptionList = [
    DropDownModel(disabled: false, text: 'Choose', value: '0'),
    DropDownModel(disabled: false, text: 'Description1', value: '1'),
    DropDownModel(disabled: false, text: 'Description2', value: '2'),
    DropDownModel(disabled: false, text: 'Description3', value: '3'),
    DropDownModel(disabled: false, text: 'Description4', value: '4'),
  ];
  final List<DropDownModel> description2List = [
    DropDownModel(disabled: false, text: 'Choose', value: '0'),
    DropDownModel(disabled: false, text: 'Description1', value: '1'),
    DropDownModel(disabled: false, text: 'Description2', value: '2'),
    DropDownModel(disabled: false, text: 'Description3', value: '3'),
    DropDownModel(disabled: false, text: 'Description4', value: '4'),
  ];

  late Rx<DropDownModel> selectedDepartment;
  late Rx<DropDownModel> selectedResponsible;
  late Rx<DropDownModel> selectedPurchaseOrderNumber;
  late Rx<DropDownModel> selectedCategory;
  late Rx<DropDownModel> selectedProductName;
  late Rx<DropDownModel> selectedDescription;
  late Rx<DropDownModel> selectedDescription1;

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
  void initValues() {
    selectedDepartment = departmentList[0].obs;
    selectedResponsible = responsibleList[0].obs;
    selectedPurchaseOrderNumber = purchaseOrderNumberList[0].obs;
    selectedCategory = categoryList[0].obs;
    selectedProductName = productNameList[0].obs;
    selectedDescription = descriptionList[0].obs;
    selectedDescription1 = description2List[0].obs;
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

  onSelect(DropDownModel value, type) {
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
