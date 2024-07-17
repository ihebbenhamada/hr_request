import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/api/models/public/department.dart';
import 'package:request_hr/api/models/public/employee.dart';
import 'package:request_hr/api/requests/public_api.dart';
import 'package:request_hr/app/purchase/purchase-details/models/product.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../../../dashboard/tabs/vacations/main/models/drop_down.dart';
import '../models/category.dart';
import '../services/purchase_details_service.dart';

class PurchaseDetailsController extends BaseController {
  /// SERVICES
  final PurchaseDetailsService _purchaseDetailsService =
      PurchaseDetailsService();
  final PublicApiServices _publicApiServices = PublicApiServices();

  /// CONTROLLERS

  /// VARIABLES
  Rx<DateTime> orderDate = DateTime.now().obs;

  final RxList<Department> departmentList = <Department>[].obs;
  final RxList<Employee> responsibleList = <Employee>[].obs;
  final RxList<Category> categoryList = <Category>[].obs;
  final RxList<Product> productNameList = <Product>[].obs;

  final List<DropDownModel> purchaseOrderNumberList = [
    DropDownModel(disabled: false, text: 'Choose', value: '0'),
    DropDownModel(disabled: false, text: 'Purchase1', value: '1'),
    DropDownModel(disabled: false, text: 'Purchase2', value: '2'),
    DropDownModel(disabled: false, text: 'Purchase3', value: '3'),
    DropDownModel(disabled: false, text: 'Purchase4', value: '4'),
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

  Rx<Department> selectedDepartment = Department(id: 0).obs;
  Rx<Employee> selectedResponsible = Employee(id: 0).obs;
  Rx<Category> selectedCategory = Category(
    id: 0,
    categoryCode: "",
    categoryNameAr: "",
    categoryNameEn: "",
    isDiscountable: false,
    isService: false,
  ).obs;
  Rx<Product> selectedProductName = Product(
    id: 0,
    productCode: "",
    productName: "",
    productNameEn: "",
    codeAndName: false,
    imagePath: "",
    fkStMainCategoryId: 0,
    fkStCategoryId: 0,
    fkStBrandId: 0,
    fkStUnitId: 0,
    fkTaxesId: 0,
    fkStManufacturingCountryId: 0,
    fkStManufacturerId: 0,
    fkStItemLocationId: 0,
    orderLimit: 20,
    description: "",
  ).obs;

  late Rx<DropDownModel> selectedPurchaseOrderNumber;
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
    getDepartments();
    getCategories();
    selectedPurchaseOrderNumber = purchaseOrderNumberList[0].obs;
    selectedDescription = descriptionList[0].obs;
    selectedDescription1 = description2List[0].obs;
  }

  /// FUNCTIONS
  getDepartments() {
    AppInterceptor.showLoader();
    _publicApiServices
        .getDepartments(lang: Get.locale?.languageCode ?? 'en')
        .then((listDepartments) {
      if (listDepartments != null) {
        departmentList.value = listDepartments;
        selectedDepartment.value = listDepartments[0];
        getEmployeesByDepartment(id: listDepartments[0].id.toString());
      }
    });
  }

  getEmployeesByDepartment({required String id}) {
    _publicApiServices.getEmployeesByDepartment(id: id).then((listEmployees) {
      if (listEmployees != null) {
        responsibleList.value = listEmployees;
        selectedResponsible.value = listEmployees[0];
      }
      AppInterceptor.hideLoader();
    });
  }

  getCategories() {
    AppInterceptor.showLoader();
    _purchaseDetailsService.getCategories().then((listCategories) {
      if (listCategories != null) {
        categoryList.value = listCategories;

        if (listCategories.isNotEmpty) {
          selectedCategory.value = listCategories[0];
          getProductsByCategoryId(id: listCategories[0].id.toString());
        }
      }
    });
  }

  getProductsByCategoryId({required String id}) {
    _purchaseDetailsService
        .getProductsByCategoryId(id: id)
        .then((listProducts) {
      if (listProducts != null) {
        productNameList.value = listProducts;
        selectedProductName.value = listProducts[0];
      }
      AppInterceptor.hideLoader();
    });
  }

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
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != orderDate.value) {
      orderDate.value = pickedDate;
    }
  }

  onSelectDepartment(Department department) {
    selectedDepartment.value = department;
    AppInterceptor.showLoader();
    getEmployeesByDepartment(id: department.id.toString());
  }

  onSelectResponsible(Employee employee) {
    selectedResponsible.value = employee;
  }

  onSelectCategory(Category category) {
    selectedCategory.value = category;
    AppInterceptor.showLoader();
    getProductsByCategoryId(id: category.id.toString());
  }

  onSelectProduct(Product product) {
    selectedProductName.value = product;
  }

  onSelect(DropDownModel value, type) {
    switch (type) {
      case 2:
        selectedPurchaseOrderNumber.value = value;
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
    AppInterceptor.showLoader();
    _purchaseDetailsService.createPurchase(
      serialPrefix: 'serialPrefix',
      serialNumber: 1,
      orderDate: DateTime.now().toString().substring(0, 10),
      fkHrDepartmentId: 1,
      status: 'status',
      employeeName: selectedResponsible.value.fullName ?? '',
      description: 'description',
      purchaseOrderDetailList: [],
    ).then(
      (value) {
        if (value != null) {}
      },
    );
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
