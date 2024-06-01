import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/main/controller/dashboard-controller.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/models/drop_down.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/success-vacation/screens/success_vacation_screen.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-steps/main/model/get_create_second_step.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-steps/main/model/get_create_third_step.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-steps/steps/disclaimer.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-steps/steps/final_exit_approval.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-steps/steps/ticket_exchange_request.dart';
import 'package:request_hr/config/controllerConfig/base_controller.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../../../config/colors/colors.dart';
import '../model/get_create_first_step.dart';
import '../services/vacations_steps_service.dart';

class VacationsStepsController extends BaseController
    with GetTickerProviderStateMixin {
  /// SERVICES
  final VacationsStepsService _vacationsStepsService = VacationsStepsService();

  /// CONTROLLERS
  final PageController pageController = PageController(initialPage: 0);
  final DashboardController _dashboardController =
      Get.find<DashboardController>();

  /// VARIABLES
  RxDouble animatedSecondStepBarWidth = 0.0.obs;
  RxDouble animatedThirdStepBarWidth = 0.0.obs;
  RxInt activePage = 0.obs;
  Rx<Color> secondStepTextColor = AppColors.blueDark.obs;
  Rx<Color> thirdStepTextColor = AppColors.blueDark.obs;
  RxString endWorkingDate = DateTime.now().toString().substring(0, 10).obs;
  RxString adoptedFromDate = DateTime.now().toString().substring(0, 10).obs;
  RxString lastWorkingDateThirdStep =
      DateTime.now().toString().substring(0, 10).obs;
  //////////
  late AnimationController _animationFirstStepContainer;
  late Animation<double> firstStepContainerAnimation;

  late AnimationController _animationSecondStepContainer;
  late Animation<double> secondStepContainerAnimation;

  final Rx<GetCreateFirstStep> firstStepData = GetCreateFirstStep(
          creationDate: DateTime.now().toString(),
          lastWorkingDayDate: DateTime.now().toString())
      .obs;
  final Rx<GetCreateSecondStep> secondStepData = GetCreateSecondStep(
    id: 0,
    fKHrEmployeeId: 0,
    dateDue: "",
    totalDeservedAmount: 0.0,
    totalExtaraTicketsValue: 0.0,
    ticketPath: "",
    description: "",
    isFromRequests: false,
    requestRefrenceId: 0,
    fKCreatorId: 0,
    creationDate: "",
    lastModifiedDate: "",
    isActive: true,
    isDeleted: false,
    imagePath: "",
    employeeName: "",
    fKDefBranchId: 0,
    fKHrManagementId: 0,
    fKHrDepartmentId: 0,
    employeeCode: "",
    hrDepartments: [],
    hrManagements: [],
    defBranches: [],
    kinshipType: [],
    paymentTypes: 0,
    paymentType: [],
    details: [],
  ).obs;
  final Rx<GetCreateThirdStep> thirdStepData = GetCreateThirdStep(
    id: 0,
    fKHrEmployeeId: 0,
    employeeName: "",
    departmentName: "",
    jobName: "",
    reason: "",
    lastWorkingDayDate: "",
    fKReqFinalExitId: 0,
    fKRequestVacationId: 0,
    isFinalHandOver: false,
    fileName: "",
    handOverCommitmentFilePath: "",
    fKHrCreatorId: 1,
    creationDate: "",
    lastModifiedDate: "",
    isActive: true,
    isDeleted: false,
    reviewer: "",
    defBranchVm: null,
  ).obs;

  late List<Widget> steps = [];
  late Rx<DateTime> initialDate;

  /// first step variable
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController mobileTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();
  TextEditingController employeeNameTextEditingController =
      TextEditingController();

  /// second step variable
  final RxList<DropDownModel> paymentTypeList = <DropDownModel>[].obs;

  late Rx<DropDownModel> selectedPaymentType;
  RxString dueDate = DateTime.now().toString().substring(0, 10).obs;
  TextEditingController descriptionTextEditingController =
      TextEditingController();

  /// third step variables
  TextEditingController reasonTextEditingController = TextEditingController();
  TextEditingController jobNameTextEditingController = TextEditingController();

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
    _animationFirstStepContainer = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animationSecondStepContainer = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    firstStepContainerAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_animationFirstStepContainer);
    secondStepContainerAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_animationSecondStepContainer);
    getFirstStep();
    getSecondStep();
    getThirdStep();
  }

  @override
  void dispose() {
    _animationFirstStepContainer.dispose();

    _animationSecondStepContainer.dispose();
    super.dispose();
  }

  /// INITIALISATION
  void initValues() {
    initialDate = DateTime.now().obs;
    steps = [
      FinalExitApproval(
        vacationsStepsController: this,
      ),
      TicketExchangeRequest(
        vacationsStepsController: this,
      ),
      Disclaimer(
        vacationsStepsController: this,
      ),
    ];
  }

  /// FUNCTIONS
  onClickNext() {
    if (activePage < steps.length - 1) {
      if (activePage.value == 0) {
        if (employeeNameTextEditingController.value.text.isNotEmpty &&
            phoneTextEditingController.value.text.isNotEmpty &&
            mobileTextEditingController.value.text.isNotEmpty &&
            addressTextEditingController.value.text.isNotEmpty) {
          createFirstStep();
        } else {
          Fluttertoast.showToast(
            msg: 'Please fill all fields',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColors.redLight,
            textColor: AppColors.white,
            fontSize: 16.0.sp,
          );
        }
        return;
      } else if (activePage.value == 1) {
        createSecondStep();
      } else {
        paginate(activePage.value + 1, true);
      }
      animateThirdStep('forward');
    }
    initialDate.value = DateTime.now();
  }

  onClickBack() {
    if (activePage.value > 0) {
      paginate(activePage.value - 1, false);
      if (activePage.value == 2) {
        animateThirdStep('back');
        return;
      }
      animateSecondStep('back');
    } else {
      Get.back();
    }
    initialDate.value = DateTime.now();
  }

  onClickFinish() {
    createThirdStep();
  }

  paginate(int index, bool isForward) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeIn,
    );
    Future.delayed(Duration(milliseconds: isForward ? 600 : 200), () {
      secondStepTextColor.value =
          index != 0 ? AppColors.white : AppColors.blueDark;
      thirdStepTextColor.value =
          index != 2 ? AppColors.blueDark : AppColors.white;
    });
  }

  onPageChanged(int index) {
    activePage.value = index;
  }

  void selectDate(BuildContext context, String selectedDate) async {
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
      initialDate: initialDate.value,
      lastDate: DateTime(2030),
      firstDate: DateTime(1996),
    );

    if (selectedDate == 'end') {
      if (pickedDate != null && pickedDate.toString() != endWorkingDate.value) {
        endWorkingDate.value = pickedDate.toString().substring(0, 10);
        initialDate.value = DateTime.parse(endWorkingDate.value);
      }
    } else if (selectedDate == 'secondStep') {
      if (pickedDate != null && pickedDate.toString() != dueDate.value) {
        dueDate.value = pickedDate.toString().substring(0, 10);
        initialDate.value = DateTime.parse(dueDate.value);
      }
    } else if (selectedDate == 'thirdStep') {
      if (pickedDate != null &&
          pickedDate.toString() != lastWorkingDateThirdStep.value) {
        lastWorkingDateThirdStep.value = pickedDate.toString().substring(0, 10);
        initialDate.value = DateTime.parse(lastWorkingDateThirdStep.value);
      }
    } else {
      if (pickedDate != null &&
          pickedDate.toString() != adoptedFromDate.value) {
        adoptedFromDate.value = pickedDate.toString().substring(0, 10);
        initialDate.value = DateTime.parse(adoptedFromDate.value);
      }
    }
  }

  /// FIRST STEP
  getFirstStep() {
    AppInterceptor.showLoader();
    _vacationsStepsService.getCreateFirstStep().then((value) {
      if (value != null) {
        firstStepData.value = value;
      }
      AppInterceptor.hideLoader();
    });
  }

  createFirstStep() {
    AppInterceptor.showLoader();
    _vacationsStepsService
        .createFinalExitApproval(
      fKHrEmployeeId: firstStepData.value.fKHrEmployeeId,
      fKReqFinalExitId: firstStepData.value.fKReqFinalExitId,
      employeeName: firstStepData.value.employeeName,
      creationDate: firstStepData.value.creationDate ?? "",
      quitDate: firstStepData.value.quitDate,
      lastWorkingDayDate: firstStepData.value.lastWorkingDayDate,
      hasCommitment: firstStepData.value.hasCommitment,
      phone: phoneTextEditingController.value.text.toString(),
      mobile: mobileTextEditingController.value.text.toString(),
      address: addressTextEditingController.value.text,
      lastModifiedDate: firstStepData.value.lastModifiedDate ?? "",
      isActive: firstStepData.value.isActive,
      isDeleted: firstStepData.value.isDeleted,
    )
        .then((value) {
      if (value != null) {
        AppInterceptor.hideLoader();
        animateSecondStep('forward');
        paginate(activePage.value + 1, true);
      }
    });
  }

  /// SECOND STEP
  getSecondStep() {
    AppInterceptor.showLoader();
    _vacationsStepsService.getCreateSecondStep().then((value) {
      if (value != null) {
        secondStepData.value = value;
        paymentTypeList.value = value.paymentType;
        selectedPaymentType = value.paymentType[0].obs;
      }
      AppInterceptor.hideLoader();
    });
  }

  createSecondStep() {
    AppInterceptor.showLoader();
    _vacationsStepsService
        .createTicketExchange(
      id: secondStepData.value.id,
      fKHrEmployeeId: secondStepData.value.fKHrEmployeeId,
      dateDue: dueDate.value,
      totalDeservedAmount: secondStepData.value.totalDeservedAmount,
      isFromRequests: secondStepData.value.isFromRequests,
      fKCreatorId: secondStepData.value.fKCreatorId,
      creationDate: secondStepData.value.creationDate,
      lastModifiedDate: secondStepData.value.lastModifiedDate,
      isActive: secondStepData.value.isActive,
      isDeleted: secondStepData.value.isDeleted,
      hrDepartments: secondStepData.value.hrDepartments,
      hrManagements: secondStepData.value.hrManagements,
      defBranches: secondStepData.value.defBranches,
      kinshipType: secondStepData.value.kinshipType,
      paymentType: secondStepData.value.paymentType,
      details: secondStepData.value.details,
      imagePath: secondStepData.value.imagePath,
      description: descriptionTextEditingController.value.text,
      employeeCode: secondStepData.value.employeeCode,
      employeeName: secondStepData.value.employeeName,
      fKDefBranchId: secondStepData.value.fKDefBranchId,
      fKHrDepartmentId: secondStepData.value.fKHrDepartmentId,
      fKHrManagementId: secondStepData.value.fKHrManagementId,
      paymentTypes: int.parse(selectedPaymentType.value.value),
      requestRefrenceId: secondStepData.value.requestRefrenceId,
      ticketPath: secondStepData.value.ticketPath,
      totalExtaraTicketsValue: secondStepData.value.totalExtaraTicketsValue,
    )
        .then((value) {
      if (value != null) {
        AppInterceptor.hideLoader();
        animateSecondStep('forward');
        paginate(activePage.value + 1, true);
      }
    });
  }

  onSelectPaymentType(DropDownModel value) {
    selectedPaymentType.value = value;
  }

  /// THIRD STEP
  getThirdStep() {
    AppInterceptor.showLoader();
    _vacationsStepsService.getCreateThirdStep().then((value) {
      if (value != null) {
        thirdStepData.value = value;
        if (value.reason != null) {
          jobNameTextEditingController.text = value.reason!;
        }
      }
      AppInterceptor.hideLoader();
    });
  }

  createThirdStep() {
    _vacationsStepsService
        .createDisclaimer(
      id: thirdStepData.value.id,
      fKHrEmployeeId: thirdStepData.value.fKHrEmployeeId,
      employeeName: thirdStepData.value.employeeName,
      departmentName: thirdStepData.value.departmentName,
      jobName: thirdStepData.value.jobName,
      reason: reasonTextEditingController.value.text,
      lastWorkingDayDate: lastWorkingDateThirdStep.value,
      fKReqFinalExitId: thirdStepData.value.fKReqFinalExitId,
      fKRequestVacationId: thirdStepData.value.fKRequestVacationId,
      isFinalHandOver: thirdStepData.value.isFinalHandOver,
      fileName: thirdStepData.value.fileName,
      handOverCommitmentFilePath:
          thirdStepData.value.handOverCommitmentFilePath,
      fKHrCreatorId: thirdStepData.value.fKHrCreatorId,
      creationDate: thirdStepData.value.creationDate,
      lastModifiedDate: thirdStepData.value.lastModifiedDate,
      isActive: thirdStepData.value.isActive,
      isDeleted: thirdStepData.value.isDeleted,
      reviewer: thirdStepData.value.reviewer,
      defBranchVm: thirdStepData.value.defBranchVm,
    )
        .then((value) {
      Get.offAll(
        () => SuccessVacationScreen(),
        transition: Transition.leftToRight,
        curve: Curves.ease,
        duration: const Duration(milliseconds: 500),
      );
      animateThirdStep('forward');
      paginate(activePage.value + 1, true);
    });
  }

  animateSecondStep(String direction) {
    if (direction == 'forward') {
      animatedSecondStepBarWidth.value = 86.0;
      Future.delayed(const Duration(milliseconds: 400), () {
        _animationFirstStepContainer.forward();
      });
    } else {
      _animationFirstStepContainer.reverse();
      Future.delayed(const Duration(milliseconds: 400), () {
        animatedSecondStepBarWidth.value = 0.0;
      });
    }
  }

  /// THIRD STEP
  animateThirdStep(String direction) {
    if (direction == 'forward') {
      animatedThirdStepBarWidth.value = 86.0;
      Future.delayed(const Duration(milliseconds: 400), () {
        _animationSecondStepContainer.forward();
      });
    } else {
      _animationSecondStepContainer.reverse();
      Future.delayed(const Duration(milliseconds: 400), () {
        animatedThirdStepBarWidth.value = 0.0;
      });
    }
  }
}
