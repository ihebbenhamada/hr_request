import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:request_hr/app/purchase/purchase-details/controllers/purchase_details_controller.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/widgets/input/input_form.dart';

import '../../../../../../config/colors/colors.dart';
import '../../widgets/purchase_name_item.dart';

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
            children: [
              (MediaQuery.of(context).viewPadding.top + 20).h.verticalSpace,
              //-------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputForm(
                    height: 55.h,
                    width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                    title: 'Department',
                    inputType: 'select',
                    selectedDropDownItem:
                        _purchaseDetailsController.selectedDepartment,
                    onSelect: (value) =>
                        _purchaseDetailsController.onSelect(value, 0),
                    listDropDown: _purchaseDetailsController.departmentList,
                  ),
                  10.h.verticalSpace,
                  InputForm(
                    height: 55.h,
                    width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                    title: 'Responsible Person',
                    inputType: 'select',
                    selectedDropDownItem:
                        _purchaseDetailsController.selectedResponsible,
                    onSelect: (value) =>
                        _purchaseDetailsController.onSelect(value, 1),
                    listDropDown: _purchaseDetailsController.responsibleList,
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
                  InputForm(
                    height: 55.h,
                    width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                    title: 'Category',
                    inputType: 'select',
                    selectedDropDownItem:
                        _purchaseDetailsController.selectedCategory,
                    onSelect: (value) =>
                        _purchaseDetailsController.onSelect(value, 3),
                    listDropDown: _purchaseDetailsController.categoryList,
                  ),
                  10.h.verticalSpace,
                  InputForm(
                    height: 55.h,
                    width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                    title: 'Product Name',
                    inputType: 'select',
                    selectedDropDownItem:
                        _purchaseDetailsController.selectedProductName,
                    onSelect: (value) =>
                        _purchaseDetailsController.onSelect(value, 4),
                    listDropDown: _purchaseDetailsController.productNameList,
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
