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
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 50.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          width:
                              MediaQuery.of(context).size.width * 0.485 - 25.0,
                          title: 'Payment Type',
                          inputType: 'select',
                          enabled: _ticketDetailsController.isEnabled,
                          selectedDropDownItem:
                              _ticketDetailsController.selectedPaymentType,
                          onSelect: (value) => _ticketDetailsController
                              .onSelectPaymentType(value),
                          listDropDown:
                              _ticketDetailsController.paymentTypeList,
                        ),
                        10.h.verticalSpace,
                        Obx(
                          () => InputForm(
                            height: 55.h,
                            width: MediaQuery.of(context).size.width * 0.485 -
                                25.0,
                            title: 'Due Date',
                            inputType: 'date',
                            enabled: _ticketDetailsController.isEnabled,
                            text: DateFormat('dd-MM-yyyy')
                                .format(_ticketDetailsController.dueDate.value),
                            onSelectDate: () =>
                                _ticketDetailsController.selectDate(context, 0),
                          ),
                        ),
                      ],
                    ),
                    15.h.verticalSpace,
                    InputForm(
                      width: double.infinity,
                      title: 'Note',
                      enabled: _ticketDetailsController.isEnabled,
                      inputType: 'input',
                      nbrLines: 3,
                      textEditingController: _ticketDetailsController
                          .firstNoteTextEditingController,
                    ),
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
                                'Contracted',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                          _ticketDetailsController.isEnabled
                              ? Obx(
                                  () => SizedBox(
                                    width: 30,
                                    height: 10.h,
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Switch(
                                        value: _ticketDetailsController
                                            .hasEmployeeTicket.value,
                                        activeColor: AppColors.blueDark,
                                        onChanged: (value) =>
                                            _ticketDetailsController.onSwitch(
                                          name: "employee",
                                          value: !_ticketDetailsController
                                              .hasEmployeeTicket.value,
                                        ),
                                        activeTrackColor: AppColors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                    15.h.verticalSpace,
                    Obx(
                      () => AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        clipBehavior: Clip.hardEdge,
                        color: AppColors.white.withOpacity(0),
                        height: _ticketDetailsController.hasEmployeeTicket.value
                            ? 160.h
                            : 0,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InputForm(
                                  height: 55.h,
                                  width: MediaQuery.of(context).size.width *
                                          0.485 -
                                      25.0,
                                  title: 'Name',
                                  inputType: 'input',
                                  enabled: _ticketDetailsController.isEnabled,
                                  nbrLines: 1,
                                  textEditingController:
                                      _ticketDetailsController
                                          .employeeNameTextEditingController,
                                ),
                                10.h.verticalSpace,
                                InputForm(
                                  height: 55.h,
                                  width: MediaQuery.of(context).size.width *
                                          0.485 -
                                      25.0,
                                  title: 'Birth Date',
                                  inputType: 'date',
                                  enabled: _ticketDetailsController.isEnabled,
                                  text: DateFormat('dd-MM-yyyy').format(
                                      _ticketDetailsController
                                          .employeeBirthDate.value),
                                  onSelectDate: () => _ticketDetailsController
                                      .selectDate(context, 1),
                                ),
                              ],
                            ),
                            15.h.verticalSpace,
                            InputForm(
                              width: double.infinity,
                              title: 'Note',
                              inputType: 'input',
                              enabled: _ticketDetailsController.isEnabled,
                              nbrLines: 3,
                              textEditingController: _ticketDetailsController
                                  .employeeNoteTextEditingController,
                            ),
                          ],
                        ),
                      ),
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
                          _ticketDetailsController.isEnabled
                              ? Obx(
                                  () => SizedBox(
                                    width: 30,
                                    height: 10.h,
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Switch(
                                        value: _ticketDetailsController
                                            .hasTicketForWife.value,
                                        activeColor: AppColors.blueDark,
                                        onChanged: (value) =>
                                            _ticketDetailsController.onSwitch(
                                          name: "wife",
                                          value: !_ticketDetailsController
                                              .hasTicketForWife.value,
                                        ),
                                        activeTrackColor: AppColors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                    15.h.verticalSpace,
                    Obx(
                      () => AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        clipBehavior: Clip.hardEdge,
                        color: AppColors.white.withOpacity(0),
                        height: _ticketDetailsController.hasTicketForWife.value
                            ? 160.h
                            : 0,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InputForm(
                                  height: 55.h,
                                  width: MediaQuery.of(context).size.width *
                                          0.485 -
                                      25.0,
                                  title: 'Name',
                                  inputType: 'input',
                                  enabled: _ticketDetailsController.isEnabled,
                                  nbrLines: 1,
                                  textEditingController:
                                      _ticketDetailsController
                                          .wifeNameTextEditingController,
                                ),
                                10.h.verticalSpace,
                                InputForm(
                                  height: 55.h,
                                  width: MediaQuery.of(context).size.width *
                                          0.485 -
                                      25.0,
                                  title: 'Birth Date',
                                  inputType: 'date',
                                  enabled: _ticketDetailsController.isEnabled,
                                  text: DateFormat('dd-MM-yyyy').format(
                                      _ticketDetailsController
                                          .employeeWifeBirthDate.value),
                                  onSelectDate: () => _ticketDetailsController
                                      .selectDate(context, 2),
                                ),
                              ],
                            ),
                            15.h.verticalSpace,
                            InputForm(
                              width: double.infinity,
                              title: 'Note',
                              inputType: 'input',
                              nbrLines: 3,
                              enabled: _ticketDetailsController.isEnabled,
                              textEditingController: _ticketDetailsController
                                  .wifeNoteTextEditingController,
                            ),
                          ],
                        ),
                      ),
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
                          _ticketDetailsController.isEnabled
                              ? Obx(
                                  () => SizedBox(
                                    width: 30,
                                    height: 10.h,
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Switch(
                                        value: _ticketDetailsController
                                            .hasTicketForChild1.value,
                                        activeColor: AppColors.blueDark,
                                        onChanged: (value) =>
                                            _ticketDetailsController.onSwitch(
                                          name: "child1",
                                          value: !_ticketDetailsController
                                              .hasTicketForChild1.value,
                                        ),
                                        activeTrackColor: AppColors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                    15.h.verticalSpace,
                    Obx(
                      () => AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        clipBehavior: Clip.hardEdge,
                        color: AppColors.white.withOpacity(0),
                        height:
                            _ticketDetailsController.hasTicketForChild1.value
                                ? 160.h
                                : 0,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InputForm(
                                  height: 55.h,
                                  width: MediaQuery.of(context).size.width *
                                          0.485 -
                                      25.0,
                                  title: 'Name',
                                  inputType: 'input',
                                  nbrLines: 1,
                                  enabled: _ticketDetailsController.isEnabled,
                                  textEditingController:
                                      _ticketDetailsController
                                          .firstChildNameTextEditingController,
                                ),
                                10.h.verticalSpace,
                                InputForm(
                                  height: 55.h,
                                  width: MediaQuery.of(context).size.width *
                                          0.485 -
                                      25.0,
                                  title: 'Birth Date',
                                  inputType: 'date',
                                  enabled: _ticketDetailsController.isEnabled,
                                  text: DateFormat('dd-MM-yyyy').format(
                                      _ticketDetailsController
                                          .employeeSonUnderTwelveBirthDate
                                          .value),
                                  onSelectDate: () => _ticketDetailsController
                                      .selectDate(context, 3),
                                ),
                              ],
                            ),
                            15.h.verticalSpace,
                            InputForm(
                              width: double.infinity,
                              title: 'Note',
                              inputType: 'input',
                              nbrLines: 3,
                              enabled: _ticketDetailsController.isEnabled,
                              textEditingController: _ticketDetailsController
                                  .firstChildNoteTextEditingController,
                            ),
                          ],
                        ),
                      ),
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
                          _ticketDetailsController.isEnabled
                              ? Obx(
                                  () => SizedBox(
                                    width: 30,
                                    height: 10.h,
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Switch(
                                        value: _ticketDetailsController
                                            .hasTicketForChild2.value,
                                        activeColor: AppColors.blueDark,
                                        onChanged: (value) =>
                                            _ticketDetailsController.onSwitch(
                                          name: "child2",
                                          value: !_ticketDetailsController
                                              .hasTicketForChild2.value,
                                        ),
                                        activeTrackColor: AppColors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                    15.h.verticalSpace,
                    Obx(
                      () => AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        clipBehavior: Clip.hardEdge,
                        color: AppColors.white.withOpacity(0),
                        height:
                            _ticketDetailsController.hasTicketForChild2.value
                                ? 160.h
                                : 0,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InputForm(
                                  height: 55.h,
                                  width: MediaQuery.of(context).size.width *
                                          0.485 -
                                      25.0,
                                  title: 'Name',
                                  inputType: 'input',
                                  nbrLines: 1,
                                  enabled: _ticketDetailsController.isEnabled,
                                  textEditingController:
                                      _ticketDetailsController
                                          .secondChildNameTextEditingController,
                                ),
                                10.h.verticalSpace,
                                Obx(
                                  () => InputForm(
                                    height: 55.h,
                                    width: MediaQuery.of(context).size.width *
                                            0.485 -
                                        25.0,
                                    title: 'Birth Date',
                                    inputType: 'date',
                                    enabled: _ticketDetailsController.isEnabled,
                                    text: DateFormat('dd-MM-yyyy').format(
                                        _ticketDetailsController
                                            .employeeSecondSonBirthDate.value),
                                    onSelectDate: () => _ticketDetailsController
                                        .selectDate(context, 4),
                                  ),
                                ),
                              ],
                            ),
                            15.h.verticalSpace,
                            InputForm(
                              width: double.infinity,
                              title: 'Note',
                              inputType: 'input',
                              nbrLines: 3,
                              enabled: _ticketDetailsController.isEnabled,
                              textEditingController: _ticketDetailsController
                                  .secondChildNoteTextEditingController,
                            ),
                          ],
                        ),
                      ),
                    ),
                    30.h.verticalSpace,
                    _ticketDetailsController.isEnabled
                        ? Row(
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
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
