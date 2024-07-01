import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/ticket/ticket-details/models/ticket_details.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/colors/colors.dart';
import '../../../dashboard/tabs/vacations/main/models/drop_down.dart';
import '../models/get_create_ticket.dart';
import '../services/ticket_details_service.dart';

class TicketDetailsController extends BaseController {
  /// SERVICES
  final TicketDetailsService _ticketDetailsService = TicketDetailsService();

  /// CONTROLLERS
  TextEditingController firstNoteTextEditingController =
      TextEditingController();
  TextEditingController employeeNameTextEditingController =
      TextEditingController();
  TextEditingController employeeNoteTextEditingController =
      TextEditingController();
  TextEditingController wifeNameTextEditingController = TextEditingController();
  TextEditingController wifeNoteTextEditingController = TextEditingController();
  TextEditingController firstChildNameTextEditingController =
      TextEditingController();
  TextEditingController firstChildNoteTextEditingController =
      TextEditingController();
  TextEditingController secondChildNameTextEditingController =
      TextEditingController();
  TextEditingController secondChildNoteTextEditingController =
      TextEditingController();

  /// VARIABLES
  Rx<DateTime> dueDate = DateTime.now().obs;
  Rx<DateTime> employeeBirthDate = DateTime.now().obs;
  Rx<DateTime> employeeWifeBirthDate = DateTime.now().obs;
  Rx<DateTime> employeeSonUnderTwelveBirthDate = DateTime.now().obs;
  Rx<DateTime> employeeSecondSonBirthDate = DateTime.now().obs;
  Rx<GetCreateTicketResponse> getCreateTicketResponse = GetCreateTicketResponse(
    id: null,
    fKHrEmployeeId: null,
    employeeName: null,
    employeeBirthDate: null,
    employeeTicket: null,
    hasAirlineTicket: null,
    dueDate: null,
    wifeName: null,
    wifeBirthDate: null,
    ticketForWife: null,
    child1Name: null,
    child1BirthDate: null,
    ticketForChild1: null,
    child2Name: null,
    child2BirthDate: null,
    ticketForChild2: null,
  ).obs;

  final RxList<DropDownModel> paymentTypeList = <DropDownModel>[].obs;

  Rx<DropDownModel> selectedPaymentType = DropDownModel(
    disabled: false,
    text: "text",
    value: "value",
  ).obs;

  RxBool hasEmployeeTicket = false.obs;
  RxBool hasTicketForWife = false.obs;
  RxBool hasTicketForChild1 = false.obs;
  RxBool hasTicketForChild2 = false.obs;

  TicketDetails data = TicketDetails(
    id: 0,
    fKHrEmployeeId: 1,
    dueDate: "",
    paymentType: "",
    employeeTicket: true,
    employeeNote: "",
    employeeName: "",
    employeeBirthDate: "",
    ticketForWife: false,
    wifeNote: "",
    wifeName: "",
    wifeBirthDate: "",
    ticketForChild1: false,
    child1Note: "",
    child1Name: "",
    child1BirthDate: "",
    ticketForChild2: false,
    child2Note: "",
    child2Name: "",
    child2BirthDate: "",
    creationDate: "",
    lastModifiedDate: "",
    description: "",
    isActive: true,
    isDeleted: false,
    hasAirlineTicket: false,
    fKReqStatusId: 0,
    status: null,
    imagePath: null,
    employeeJob: "",
    creatorJobTypeId: 0,
    hrEmployeeName: "",
    paymentTypeName: "",
    managingDirectorSignature: null,
    managingDirectorLastActivity: null,
    hrManagerSignature: null,
    hrManagerLastActivity: null,
    employeeType: 0,
    activities: [],
  );
  bool isEnabled = true;

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
  void initValues() async {
    if (Get.arguments == null) {
      getCreateTicket();
    }

    getPaymentTypes();
    if (Get.arguments != null) {
      isEnabled = false;
    }
  }

  /// FUNCTIONS
  fillData() {
    if (Get.arguments != null) {
      data = Get.arguments;
      selectedPaymentType.value =
          paymentTypeList.where((p0) => p0.text == data.paymentTypeName).first;
      dueDate.value = DateTime.parse(data.dueDate);
      employeeNameTextEditingController.text = data.employeeName ?? "";
      employeeBirthDate.value =
          DateTime.parse(data.employeeBirthDate ?? DateTime.now().toString());
      firstNoteTextEditingController.text = data.description;
      employeeNoteTextEditingController.text = data.employeeNote ?? "";
      wifeNoteTextEditingController.text = data.wifeNote ?? "";
      firstChildNoteTextEditingController.text = data.child1Note ?? "";
      secondChildNoteTextEditingController.text = data.child2Note ?? "";
      hasEmployeeTicket.value = data.employeeTicket;
      wifeNameTextEditingController.text = data.wifeName ?? "";
      employeeWifeBirthDate.value =
          DateTime.parse(data.wifeBirthDate ?? DateTime.now().toString());
      hasTicketForWife.value = data.ticketForWife;
      firstChildNameTextEditingController.text = data.child1Name ?? "";
      employeeSonUnderTwelveBirthDate.value =
          DateTime.parse(data.child1BirthDate ?? DateTime.now().toString());
      hasTicketForChild1.value = data.ticketForChild1;
      secondChildNameTextEditingController.text = data.child2Name ?? "";
      employeeSecondSonBirthDate.value =
          DateTime.parse(data.child2BirthDate ?? DateTime.now().toString());
      hasTicketForChild2.value = data.ticketForChild2;
    }
  }

  onSwitch({required String name, required bool value}) {
    switch (name) {
      case "employee":
        hasEmployeeTicket.value = value;
        break;
      case "wife":
        hasTicketForWife.value = value;
        break;
      case "child1":
        hasTicketForChild1.value = value;
        break;
      case "child2":
        hasTicketForChild2.value = value;
        break;
      default:
        hasEmployeeTicket.value = value;
        break;
    }
  }

  getCreateTicket() {
    AppInterceptor.showLoader();
    _ticketDetailsService.getCreateTickets().then((value) {
      if (value != null) {
        getCreateTicketResponse.value = value;
        hasEmployeeTicket.value = value.employeeTicket!;
        hasTicketForWife.value = value.ticketForWife!;
        hasTicketForChild1.value = value.ticketForChild1!;
        hasTicketForChild2.value = value.ticketForChild2!;
      }
    });
  }

  getPaymentTypes() {
    _ticketDetailsService.getPaymentTypes().then((value) {
      if (value != null) {
        paymentTypeList.value = value;
        selectedPaymentType.value = paymentTypeList[0];
        fillData();
      }
      AppInterceptor.hideLoader();
    });
  }

  void selectDate(BuildContext context, int type) async {
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
    switch (type) {
      case 0:
        if (pickedDate != null && pickedDate != dueDate.value) {
          dueDate.value = pickedDate;
        }
        break;
      case 1:
        if (pickedDate != null && pickedDate != employeeBirthDate.value) {
          employeeBirthDate.value = pickedDate;
        }
        break;
      case 2:
        if (pickedDate != null && pickedDate != employeeWifeBirthDate.value) {
          employeeWifeBirthDate.value = pickedDate;
        }
        break;
      case 3:
        if (pickedDate != null &&
            pickedDate != employeeSonUnderTwelveBirthDate.value) {
          employeeSonUnderTwelveBirthDate.value = pickedDate;
        }
        break;
      case 4:
        if (pickedDate != null &&
            pickedDate != employeeSecondSonBirthDate.value) {
          employeeSecondSonBirthDate.value = pickedDate;
        }
        break;
      default:
        null;
    }
  }

  onSelectPaymentType(DropDownModel value) {
    selectedPaymentType.value = value;
  }

  onClickSubmit() {
    AppInterceptor.showLoader();
    _ticketDetailsService
        .createTicket(
      fKHrEmployeeId: getCreateTicketResponse.value.fKHrEmployeeId,
      dueDate: dueDate.value.toString().substring(0, 10),
      paymentType: selectedPaymentType.value.text ?? '0',
      employeeTicket: hasEmployeeTicket.value,
      employeeNote: employeeNoteTextEditingController.value.text,
      employeeName: employeeNameTextEditingController.value.text,
      employeeBirthDate: employeeBirthDate.value.toString().substring(0, 10),
      ticketForWife: hasTicketForWife.value,
      wifeNote: wifeNoteTextEditingController.value.text,
      wifeName: wifeNameTextEditingController.value.text,
      wifeBirthDate: employeeWifeBirthDate.value.toString().substring(0, 10),
      ticketForChild1: hasTicketForChild1.value,
      child1Note: firstChildNoteTextEditingController.value.text,
      child1Name: firstChildNameTextEditingController.value.text,
      child1BirthDate:
          employeeSonUnderTwelveBirthDate.value.toString().substring(0, 10),
      ticketForChild2: hasTicketForChild2.value,
      child2Note: secondChildNoteTextEditingController.value.text,
      child2Name: secondChildNameTextEditingController.value.text,
      child2BirthDate:
          employeeSecondSonBirthDate.value.toString().substring(0, 10),
      creationDate: DateTime.now().toString().substring(0, 10),
      lastModifiedDate: DateTime.now().toString().substring(0, 10),
      description: "",
      isActive: true,
      isDeleted: false,
      hasAirlineTicket: getCreateTicketResponse.value.hasAirlineTicket ?? true,
      fKReqStatusId: 0,
      status: "RequestTicketInProgress",
      employeeJob: "",
    )
        .then((value) {
      if (value != null) {
        Get.back(result: 'refresh');
      }
      AppInterceptor.hideLoader();
    });
  }

  onClickBack() {
    Get.back();
  }
}
