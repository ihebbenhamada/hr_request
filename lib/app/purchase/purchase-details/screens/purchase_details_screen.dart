import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:request_hr/api/models/public/department.dart';
import 'package:request_hr/api/models/public/employee.dart';
import 'package:request_hr/app/purchase/purchase-details/controllers/purchase_details_controller.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/widgets/input/input_form.dart';

import '../../../../../../config/colors/colors.dart';
import '../../widgets/purchase_name_item.dart';
import '../models/category.dart';
import '../models/product.dart';

class PurchaseDetailsScreen extends StatelessWidget {
  final _purchaseDetailsController = Get.put(PurchaseDetailsController());
  PurchaseDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray2,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (MediaQuery.of(context).viewPadding.top + 20).h.verticalSpace,
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
                    ),
                  ),
                ),
              ),
              20.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                    height: 55.h,
                    padding: const EdgeInsets.only(
                      left: 11,
                      right: 11,
                      bottom: 0,
                      top: 0,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12.h),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x29000000),
                          blurRadius: 3,
                          offset: Offset(0, 3),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Department',
                          style: TextStyle(
                            color: AppColors.gray6,
                            fontSize: 14.sp,
                          ),
                        ),
                        3.verticalSpace,
                        Obx(
                          () => DropdownButtonHideUnderline(
                            child: DropdownButton<Department>(
                              isDense: true,
                              value: _purchaseDetailsController
                                  .selectedDepartment.value,
                              style: TextStyle(
                                color: AppColors.blueDark,
                                fontSize: 14.sp,
                              ),
                              isExpanded: true,
                              alignment: Alignment.bottomCenter,
                              icon: Image.asset(
                                AppImages.arrowDown,
                                height: 8.h,
                              ),
                              onChanged: (Department? newValue) =>
                                  _purchaseDetailsController.onSelectDepartment(
                                      newValue ?? Department(id: 0)),
                              items: _purchaseDetailsController.departmentList
                                  .map<DropdownMenuItem<Department>>(
                                      (Department value) {
                                return DropdownMenuItem<Department>(
                                  alignment: Alignment.centerLeft,
                                  value: value,
                                  child: Text(value.departmentNameAr ?? ""),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.h.verticalSpace,
                  Container(
                    width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                    height: 55.h,
                    padding: const EdgeInsets.only(
                      left: 11,
                      right: 11,
                      bottom: 0,
                      top: 0,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12.h),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x29000000),
                          blurRadius: 3,
                          offset: Offset(0, 3),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Responsible Person',
                          style: TextStyle(
                            color: AppColors.gray6,
                            fontSize: 14.sp,
                          ),
                        ),
                        3.verticalSpace,
                        Obx(
                          () => DropdownButtonHideUnderline(
                            child: DropdownButton<Employee>(
                              isDense: true,
                              value: _purchaseDetailsController
                                  .selectedResponsible.value,
                              style: TextStyle(
                                color: AppColors.blueDark,
                                fontSize: 14.sp,
                              ),
                              isExpanded: true,
                              alignment: Alignment.bottomCenter,
                              icon: Image.asset(
                                AppImages.arrowDown,
                                height: 8.h,
                              ),
                              onChanged: (Employee? newValue) =>
                                  _purchaseDetailsController
                                      .onSelectResponsible(
                                          newValue ?? Employee(id: 0)),
                              items: _purchaseDetailsController.responsibleList
                                  .map<DropdownMenuItem<Employee>>(
                                      (Employee value) {
                                return DropdownMenuItem<Employee>(
                                  alignment: Alignment.centerLeft,
                                  value: value,
                                  child: Text(value.fullName ?? ""),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              18.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputForm(
                    height: 55.h,
                    width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                    title: 'Purchase Order NO',
                    inputType: 'select',
                    selectedDropDownItem:
                        _purchaseDetailsController.selectedPurchaseOrderNumber,
                    onSelect: (value) =>
                        _purchaseDetailsController.onSelect(value, 2),
                    listDropDown:
                        _purchaseDetailsController.purchaseOrderNumberList,
                  ),
                  10.h.verticalSpace,
                  Obx(
                    () => InputForm(
                      height: 55.h,
                      width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                      title: 'Order Date',
                      inputType: 'date',
                      text: DateFormat('dd-MM-yyyy').format(
                        _purchaseDetailsController.orderDate.value,
                      ),
                      onSelectDate: () =>
                          _purchaseDetailsController.selectDate(context),
                    ),
                  ),
                ],
              ),
              18.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                    height: 55.h,
                    padding: const EdgeInsets.only(
                      left: 11,
                      right: 11,
                      bottom: 0,
                      top: 0,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12.h),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x29000000),
                          blurRadius: 3,
                          offset: Offset(0, 3),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Category',
                          style: TextStyle(
                            color: AppColors.gray6,
                            fontSize: 14.sp,
                          ),
                        ),
                        3.verticalSpace,
                        Obx(
                          () => DropdownButtonHideUnderline(
                            child: DropdownButton<Category>(
                              isDense: true,
                              value: _purchaseDetailsController
                                  .selectedCategory.value,
                              style: TextStyle(
                                color: AppColors.blueDark,
                                fontSize: 14.sp,
                              ),
                              isExpanded: true,
                              alignment: Alignment.bottomCenter,
                              icon: Image.asset(
                                AppImages.arrowDown,
                                height: 8.h,
                              ),
                              onChanged: (Category? newValue) =>
                                  _purchaseDetailsController
                                      .onSelectCategory(newValue!),
                              items: _purchaseDetailsController.categoryList
                                  .map<DropdownMenuItem<Category>>(
                                      (Category value) {
                                return DropdownMenuItem<Category>(
                                  alignment: Alignment.centerLeft,
                                  value: value,
                                  child: Text(value.categoryNameAr ?? ""),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.h.verticalSpace,
                  Container(
                    width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                    height: 55.h,
                    padding: const EdgeInsets.only(
                      left: 11,
                      right: 11,
                      bottom: 0,
                      top: 0,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12.h),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x29000000),
                          blurRadius: 3,
                          offset: Offset(0, 3),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Product Name',
                          style: TextStyle(
                            color: AppColors.gray6,
                            fontSize: 14.sp,
                          ),
                        ),
                        3.verticalSpace,
                        Obx(
                          () => DropdownButtonHideUnderline(
                            child: DropdownButton<Product>(
                              isDense: true,
                              value: _purchaseDetailsController
                                  .selectedProductName.value,
                              style: TextStyle(
                                color: AppColors.blueDark,
                                fontSize: 14.sp,
                              ),
                              isExpanded: true,
                              alignment: Alignment.bottomCenter,
                              icon: Image.asset(
                                AppImages.arrowDown,
                                height: 8.h,
                              ),
                              onChanged: (Product? newValue) =>
                                  _purchaseDetailsController
                                      .onSelectProduct(newValue!),
                              items: _purchaseDetailsController.productNameList
                                  .map<DropdownMenuItem<Product>>(
                                      (Product value) {
                                return DropdownMenuItem<Product>(
                                  alignment: Alignment.centerLeft,
                                  value: value,
                                  child: Text(value.productNameEn ?? ""),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              18.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputForm(
                    height: 55.h,
                    width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                    title: 'Description',
                    inputType: 'select',
                    selectedDropDownItem:
                        _purchaseDetailsController.selectedDescription,
                    onSelect: (value) =>
                        _purchaseDetailsController.onSelect(value, 5),
                    listDropDown: _purchaseDetailsController.descriptionList,
                  ),
                  10.h.verticalSpace,
                  InputForm(
                    height: 55.h,
                    width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                    title: 'Description',
                    inputType: 'select',
                    selectedDropDownItem:
                        _purchaseDetailsController.selectedDescription1,
                    onSelect: (value) =>
                        _purchaseDetailsController.onSelect(value, 6),
                    listDropDown: _purchaseDetailsController.description2List,
                  ),
                ],
              ),
              18.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputForm(
                    height: 55.h,
                    width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                    title: 'Unit',
                    inputType: 'text',
                    text: '_ _',
                  ),
                  10.h.verticalSpace,
                  InputForm(
                    height: 55.h,
                    width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                    title: 'Quantity',
                    inputType: 'text',
                    text: '_ _',
                  ),
                ],
              ),
              18.h.verticalSpace,
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: InputForm(
                      width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                      title: 'Name Not In List',
                      inputType: 'input',
                      nbrLines: 1,
                      textEditingController:
                          _purchaseDetailsController.nameTextEditingController,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: InkWell(
                      onTap: () => _purchaseDetailsController.addNames(),
                      child: Container(
                        height: 34.h,
                        width: 34.h,
                        decoration: const ShapeDecoration(
                          color: AppColors.white,
                          shape: OvalBorder(
                            side: BorderSide(
                              color: AppColors.gray2,
                              width: 3,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            AppImages.add,
                            height: 12.h,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              20.h.verticalSpace,
              Obx(
                () => ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    String name = _purchaseDetailsController.namesList[index];
                    return PurchaseNameItem(
                      name: name,
                      index: index,
                      deleteName: (index) =>
                          _purchaseDetailsController.onDeleteName(index),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return 13.h.verticalSpace;
                  },
                  itemCount: _purchaseDetailsController.namesList.length,
                ),
              ),
              30.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _purchaseDetailsController.onClickSubmit,
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
                    onTap: _purchaseDetailsController.onClickBack,
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
