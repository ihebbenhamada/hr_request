import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:request_hr/app/ticket/ticket-details/controllers/ticket_details_controller.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/widgets/input/input_form.dart';

import '../../../../../../config/colors/colors.dart';

class TicketDetailsScreen extends StatelessWidget {
  final _ticketDetailsController = Get.put(TicketDetailsController());
  TicketDetailsScreen({super.key});
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
              Container(
                width: double.infinity,
                height: 44.h,
                padding: EdgeInsets.all(3.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: AppColors.primary,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x29000000),
                      blurRadius: 3,
                      offset: Offset(0, 3),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      height: 38.h,
                      width: 38.h,
                      decoration: const ShapeDecoration(
                        shape: OvalBorder(),
                        color: AppColors.white,
                      ),
                      child: Center(
                        child: Image.asset(
                          AppImages.add,
                          color: AppColors.primary,
                          height: 12.h,
                        ),
                      ),
                    ),
                    10.horizontalSpace,
                    Text(
                      'Travel Data Not Completed',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              19.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputForm(
                    height: 55.h,
                    width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                    title: 'Payment Type',
                    inputType: 'select',
                    selectedDropDownItem: _ticketDetailsController.selectedType,
                    onSelect: (value) =>
                        _ticketDetailsController.onSelectPaymentType(value),
                    listDropDown: _ticketDetailsController.paymentTypeList,
                  ),
                  10.h.verticalSpace,
                  Obx(
                    () => InputForm(
                      height: 55.h,
                      width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                      title: 'Due Date',
                      inputType: 'date',
                      text: DateFormat('dd-MM-yyyy')
                          .format(_ticketDetailsController.dueDate.value),
                      onSelectDate: () =>
                          _ticketDetailsController.selectDate(context, 0),
                    ),
                  ),
                ],
              ),
              15.h.verticalSpace,
              const InputForm(
                width: double.infinity,
                title: 'Note',
                inputType: 'input',
                nbrLines: 3,
              ),
              15.h.verticalSpace,
              //--------------------------
              Container(
                width: double.infinity,
                height: 44.h,
                padding: EdgeInsets.only(
                    top: 3.h, bottom: 3.h, left: 3.h, right: 21),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: AppColors.primary,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x29000000),
                      blurRadius: 3,
                      offset: Offset(0, 3),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 38.h,
                          width: 38.h,
                          decoration: const ShapeDecoration(
                            shape: OvalBorder(),
                            color: AppColors.white,
                          ),
                          child: Center(
                            child: Image.asset(
                              AppImages.add,
                              color: AppColors.primary,
                              height: 12.h,
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        Text(
                          'Contracted',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30,
                      height: 10.h,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Switch(
                          value: true,
                          activeColor: AppColors.blueDark,
                          onChanged: (value) {},
                          activeTrackColor: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              15.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputForm(
                    height: 55.h,
                    width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                    title: 'Name',
                    inputType: 'text',
                    text: 'Moahmed Ahmed',
                  ),
                  10.h.verticalSpace,
                  Obx(
                    () => InputForm(
                      height: 55.h,
                      width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                      title: 'Birth Date',
                      inputType: 'date',
                      text: DateFormat('dd-MM-yyyy').format(
                          _ticketDetailsController.employeeBirthDate.value),
                      onSelectDate: () =>
                          _ticketDetailsController.selectDate(context, 1),
                    ),
                  ),
                ],
              ),
              15.h.verticalSpace,
              const InputForm(
                width: double.infinity,
                title: 'Note',
                inputType: 'input',
                nbrLines: 3,
              ),
              //---------------------------
              15.h.verticalSpace,
              Container(
                width: double.infinity,
                height: 44.h,
                padding: EdgeInsets.only(
                    top: 3.h, bottom: 3.h, left: 3.h, right: 21),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: AppColors.primary,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x29000000),
                      blurRadius: 3,
                      offset: Offset(0, 3),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 38.h,
                          width: 38.h,
                          decoration: const ShapeDecoration(
                            shape: OvalBorder(),
                            color: AppColors.white,
                          ),
                          child: Center(
                            child: Image.asset(
                              AppImages.add,
                              color: AppColors.primary,
                              height: 12.h,
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        Text(
                          'Wife',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30,
                      height: 10.h,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Switch(
                          value: true,
                          activeColor: AppColors.blueDark,
                          onChanged: (value) {},
                          activeTrackColor: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              15.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputForm(
                    height: 55.h,
                    width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                    title: 'Name',
                    inputType: 'text',
                    text: 'Dina Ahmed',
                  ),
                  10.h.verticalSpace,
                  Obx(
                    () => InputForm(
                      height: 55.h,
                      width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                      title: 'Birth Date',
                      inputType: 'date',
                      text: DateFormat('dd-MM-yyyy').format(
                          _ticketDetailsController.employeeWifeBirthDate.value),
                      onSelectDate: () =>
                          _ticketDetailsController.selectDate(context, 2),
                    ),
                  ),
                ],
              ),
              15.h.verticalSpace,
              const InputForm(
                width: double.infinity,
                title: 'Note',
                inputType: 'input',
                nbrLines: 3,
              ),
              15.h.verticalSpace,
              //-----------------------------
              Container(
                width: double.infinity,
                height: 44.h,
                padding: EdgeInsets.only(
                    top: 3.h, bottom: 3.h, left: 3.h, right: 21),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: AppColors.primary,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x29000000),
                      blurRadius: 3,
                      offset: Offset(0, 3),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 38.h,
                          width: 38.h,
                          decoration: const ShapeDecoration(
                            shape: OvalBorder(),
                            color: AppColors.white,
                          ),
                          child: Center(
                            child: Image.asset(
                              AppImages.add,
                              color: AppColors.primary,
                              height: 12.h,
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        Text(
                          'son is less than 12 Years old',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30,
                      height: 10.h,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Switch(
                          value: true,
                          activeColor: AppColors.blueDark,
                          onChanged: (value) {},
                          activeTrackColor: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              15.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputForm(
                    height: 55.h,
                    width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                    title: 'Name',
                    inputType: 'text',
                    text: 'Moahmed Ahmed',
                  ),
                  10.h.verticalSpace,
                  Obx(
                    () => InputForm(
                      height: 55.h,
                      width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                      title: 'Birth Date',
                      inputType: 'date',
                      text: DateFormat('dd-MM-yyyy').format(
                          _ticketDetailsController
                              .employeeSonUnderTwelveBirthDate.value),
                      onSelectDate: () =>
                          _ticketDetailsController.selectDate(context, 3),
                    ),
                  ),
                ],
              ),
              15.h.verticalSpace,
              const InputForm(
                width: double.infinity,
                title: 'Note',
                inputType: 'input',
                nbrLines: 3,
              ),
              //---------------------------
              15.h.verticalSpace,
              Container(
                width: double.infinity,
                height: 44.h,
                padding: EdgeInsets.only(
                    top: 3.h, bottom: 3.h, left: 3.h, right: 21),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: AppColors.primary,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x29000000),
                      blurRadius: 3,
                      offset: Offset(0, 3),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 38.h,
                          width: 38.h,
                          decoration: const ShapeDecoration(
                            shape: OvalBorder(),
                            color: AppColors.white,
                          ),
                          child: Center(
                            child: Image.asset(
                              AppImages.add,
                              color: AppColors.primary,
                              height: 12.h,
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        Text(
                          'The second son is less than 18 Years old',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30,
                      height: 10.h,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Switch(
                          value: true,
                          activeColor: AppColors.blueDark,
                          onChanged: (value) {},
                          activeTrackColor: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              15.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputForm(
                    height: 55.h,
                    width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                    title: 'Name',
                    inputType: 'text',
                    text: 'Moahmed Ahmed',
                  ),
                  10.h.verticalSpace,
                  Obx(
                    () => InputForm(
                      height: 55.h,
                      width: MediaQuery.of(context).size.width * 0.485 - 25.0,
                      title: 'Birth Date',
                      inputType: 'date',
                      text: DateFormat('dd-MM-yyyy').format(
                          _ticketDetailsController
                              .employeeSecondSonBirthDate.value),
                      onSelectDate: () =>
                          _ticketDetailsController.selectDate(context, 4),
                    ),
                  ),
                ],
              ),
              15.h.verticalSpace,
              const InputForm(
                width: double.infinity,
                title: 'Note',
                inputType: 'input',
                nbrLines: 3,
              ),
              30.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _ticketDetailsController.onClickSubmit,
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
                    onTap: _ticketDetailsController.onClickBack,
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
