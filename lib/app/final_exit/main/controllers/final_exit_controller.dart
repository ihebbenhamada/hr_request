import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/main/controller/dashboard-controller.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/models/drop_down.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/success-vacation/screens/success_vacation_screen.dart';
import 'package:request_hr/config/controllerConfig/base_controller.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../../../config/colors/colors.dart';
import '../../steps/disclaimer.dart';
import '../../steps/final_exit_approval.dart';
import '../../steps/ticket_exchange_request.dart';
import '../model/get_create_first_step.dart';
import '../model/get_create_second_step.dart';
import '../model/get_create_third_step.dart';
import '../services/final_exit_service.dart';

class FinalExitController extends BaseController
    with GetTickerProviderStateMixin {
  /// SERVICES
  final FinalExitService _finalExitService = FinalExitService();

  /// CONTROLLERS
  final PageController pageController = PageController(initialPage: 0);
  final DashboardController _dashboardController =
      Get.find<DashboardController>();

  /// VARIABLES
  final RxDouble animatedFirstStepBarWidth = 0.0.obs;
  final RxDouble animatedSecondStepBarWidth = 0.0.obs;

  RxInt activePage = 0.obs;
  final Rx<Color> firstStepTextColor = AppColors.blueDark.obs;
  final Rx<Color> secondStepTextColor = AppColors.blueDark.obs;

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
    lastWorkingDayDate: DateTime.now().toString(),
  ).obs;
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
  }

  @override
  void dispose() {
    _animationFirstStepContainer.dispose();

    _animationSecondStepContainer.dispose();
    super.dispose();
  }

  /// INITIALISATION
  void initValues() {
    _animationFirstStepContainer = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animationSecondStepContainer = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    firstStepContainerAnimation = Tween(
            begin: Get.locale?.languageCode == 'en' ? 0.0 : 1.0,
            end: Get.locale?.languageCode == 'en' ? 1.0 : 0.0)
        .animate(_animationFirstStepContainer);
    secondStepContainerAnimation = Tween(
            begin: Get.locale?.languageCode == 'en' ? 0.0 : 1.0,
            end: Get.locale?.languageCode == 'en' ? 1.0 : 0.0)
        .animate(_animationSecondStepContainer);
    getFirstStep();
    getSecondStep();
    getThirdStep();
    initialDate = DateTime.now().obs;
    steps = [
      FinalExitApproval(
        finalExitController: this,
      ),
      TicketExchangeRequest(
        finalExitController: this,
      ),
      Disclaimer(
        finalExitController: this,
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
            msg: 'fill_credentials_toast'.tr,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColors.redLight,
            textColor: AppColors.white,
            fontSize: 16.0.sp,
          );
        }
        return;
      }
      if (activePage.value == 1) {
        createSecondStep();
      }
    }
    initialDate.value = DateTime.now();
  }

  onClickBack() {
    if (activePage.value > 0) {
      paginate(activePage.value - 1, false);
      if (activePage.value == 2) {
        animateSecondStep('back');
        return;
      }
      animateFirstStep('back');
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
      firstStepTextColor.value =
          index != 0 ? AppColors.white : AppColors.blueDark;
      secondStepTextColor.value =
          index != 1 && index != 0 ? AppColors.white : AppColors.blueDark;
    });
  }

  animateFirstStep(String direction) {
    if (direction == 'forward') {
      animatedFirstStepBarWidth.value = 86;
      Future.delayed(const Duration(milliseconds: 400), () {
        _animationFirstStepContainer.forward();
      });
    } else {
      _animationFirstStepContainer.reverse();
      Future.delayed(const Duration(milliseconds: 400), () {
        animatedFirstStepBarWidth.value = 0.0;
      });
    }
  }

  animateSecondStep(String direction) {
    if (direction == 'forward') {
      animatedSecondStepBarWidth.value = 86;
      Future.delayed(const Duration(milliseconds: 400), () {
        _animationSecondStepContainer.forward();
      });
    } else {
      _animationSecondStepContainer.reverse();
      Future.delayed(const Duration(milliseconds: 400), () {
        animatedSecondStepBarWidth.value = 0.0;
      });
    }
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
    _finalExitService.getCreateFirstStep().then((value) {
      if (value != null) {
        firstStepData.value = value;
        employeeNameTextEditingController.text = value.employeeName ?? '';
        phoneTextEditingController.text = value.phone ?? '';
        mobileTextEditingController.text = value.mobile ?? '';
        addressTextEditingController.text = value.address ?? '';
      }
      AppInterceptor.hideLoader();
    });
  }

  createFirstStep() {
    if (phoneTextEditingController.text.isEmpty ||
        mobileTextEditingController.text.isEmpty ||
        addressTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "fill_credentials_toast".tr,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.redLight,
        textColor: AppColors.white,
        fontSize: 16.0.sp,
      );
    } else {
      AppInterceptor.showLoader();
      _finalExitService
          .createFinalExitApproval(
        fKHrEmployeeId: firstStepData.value.fKHrEmployeeId,
        fKReqFinalExitId: firstStepData.value.fKReqFinalExitId,
        employeeName: employeeNameTextEditingController.text,
        creationDate: firstStepData.value.creationDate ?? "",
        quitDate: endWorkingDate.value,
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
          paginate(activePage.value + 1, true);
          animateFirstStep('forward');
        }
      });
    }
  }

  /// SECOND STEP
  getSecondStep() {
    AppInterceptor.showLoader();
    _finalExitService.getCreateSecondStep().then((value) {
      if (value != null) {
        secondStepData.value = value;
        dueDate.value = value.dateDue;
        paymentTypeList.value = value.paymentType;
        selectedPaymentType = value.paymentType[0].obs;
        descriptionTextEditingController.text = value.description ?? '';
      }
      AppInterceptor.hideLoader();
    });
  }

  createSecondStep() {
    if (descriptionTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "fill_credentials_toast".tr,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.redLight,
        textColor: AppColors.white,
        fontSize: 16.0.sp,
      );
    } else {
      AppInterceptor.showLoader();
      _finalExitService
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
        paymentType: [selectedPaymentType.value],
        details: secondStepData.value.details,
        imagePath: secondStepData.value.imagePath,
        description: descriptionTextEditingController.value.text,
        employeeCode: secondStepData.value.employeeCode,
        employeeName: secondStepData.value.employeeName,
        fKDefBranchId: secondStepData.value.fKDefBranchId,
        fKHrDepartmentId: secondStepData.value.fKHrDepartmentId,
        fKHrManagementId: secondStepData.value.fKHrManagementId,
        paymentTypes: int.parse(selectedPaymentType.value.value ?? '0'),
        requestRefrenceId: secondStepData.value.requestRefrenceId,
        ticketPath: secondStepData.value.ticketPath,
        totalExtaraTicketsValue: secondStepData.value.totalExtaraTicketsValue,
      )
          .then((value) {
        if (value != null) {
          AppInterceptor.hideLoader();
          paginate(activePage.value + 1, true);
          animateSecondStep('forward');
        }
      });
    }
  }

  onSelectPaymentType(DropDownModel value) {
    selectedPaymentType.value = value;
  }

  /// THIRD STEP
  getThirdStep() {
    AppInterceptor.showLoader();
    _finalExitService.getCreateThirdStep().then((value) {
      if (value != null) {
        thirdStepData.value = value;
        jobNameTextEditingController.text = value.jobName ?? '';
        reasonTextEditingController.text = value.reason ?? '';
        employeeNameTextEditingController.text = value.employeeName;
      }
      AppInterceptor.hideLoader();
    });
  }

  createThirdStep() {
    if (reasonTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "fill_credentials_toast".tr,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.redLight,
        textColor: AppColors.white,
        fontSize: 16.0.sp,
      );
    } else {
      AppInterceptor.showLoader();
      _finalExitService
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
        AppInterceptor.hideLoader();
        Get.offAll(
          () => SuccessVacationScreen(),
          transition: Transition.leftToRight,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 500),
        );
        animateSecondStep('forward');
        paginate(activePage.value + 1, true);
      });
    }
  }
}
