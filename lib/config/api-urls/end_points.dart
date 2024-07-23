class EndPoints {
  /// BASE URL
  static const String BASE_URL = 'http://46.235.91.230:8087';

  /// LOGIN
  static const String LOGIN_URL = '/Authentication/Login';

  /// VACATION
  static const String GET_EMPLOYEE_VACATIONS_URL =
      '/ReqVacation/GetEmployeeVacations';

  static const String GET_ALL_VACATION_SENT_URL = '/ReqVacation/GetAllSent';
  static const String CREATE_VACATION_URL = '/ReqVacation/Create';
  static String GET_CREATE_VACATION_URL(String lang) =>
      '/ReqVacation/GetCreate?lang=$lang';
  static const String UPDATE_VACATION_URL = '/ReqVacation/Update';
  static String GET_UPDATE_VACATION_URL(String vacationId) =>
      '/ReqVacation/GetUpdate?id=$vacationId';

  /// FINAL EXIT
  static const String CREATE_FINAL_EXIT_HANDOVER_URL =
      '/ReqVacationCommitment/CreateFinalExitHandover';
  static const String UPDATE_FINAL_EXIT_HANDOVER_URL =
      '/ReqVacationCommitment/UpdateFinalExitHandover';
  static const String IS_VACATION_COMMETMENT_REQUESTED_URL =
      '/ReqVacationCommitment/IsVacationCommetmentRequested?vacationId=# int';
  static const String IS_FINAL_EXIT_CREATED_ASYNC_URL =
      '/ReqVacationCommitment/IsFinalExitCreatedAsync?vacationId=# int';
  static const String GET_COMMITMED_VACATION_URL =
      '/ReqVacationCommitment/GetCommitedVacation?vacationId=# int';
  static const String GET_FIRST_STEP_URL = '/ReqFinalExitAPI/GetFirstStep';
  static const String CREATE_FIRST_STEP_URL =
      '/ReqFinalExitAPI/CreateFirstStep';
  static String GET_SECOND_STEP_URL(String lang) =>
      '/ReqFinalExitAPI/GetSecondStep?lang=$lang';
  static const String CREATE_SECOND_STEP_URL =
      '/ReqFinalExitAPI/CreateSecondStep';
  static const String GET_THIRD_STEP_URL = '/ReqFinalExitAPI/GetThirdStep';
  static const String CREATE_THIRD_STEP_URL =
      '/ReqFinalExitAPI/CreateThirdStep';

  /// DECISIONS
  static const String GET_DECISIONS_URL = '/ReqDecisionAPI/GetDecisions';
  static const String CREATE_DECISIONS_URL = '/ReqDecisionAPI/Create';

  /// MEETING
  static const String GET_ALL_MEETINGS_URL = '/ReqMeetingsAPI/GetAllMeetings';

  static const String GET_MEETING_BY_STATUS_URL =
      '/ReqMeetingsAPI/GetMeetings?meetingStatus=';

  static const String CREATE_MEETING_URL = '/ReqMeetingsAPI/Create';

  static const String GET_INCOMING_MEETINGS_URL =
      '/ReqMeetingsAPI/GetIncomingMeetings';

  static const String GET_INCOMING_MEETING_BY_ID_URL =
      '/ReqMeetingsAPI/GetIncomingMeetingsById?id=';

  static const String APPROVE_MEETING_URL = '/ReqMeetingsAPI/Approve?id=';

  static String APOLOGY_MEETING_URL(String id, String reason) =>
      '/ReqMeetingsAPI/Apology?id=$id&reason=$reason';
  static String GET_MEETING_BY_ID_URL(String id) =>
      '/ReqMeetingsAPI/GetMeetingById?id=$id';

  /// PUBLIC
  static const String GET_DEPARTMENTS_URL =
      '/ReqBonusAPI/GetAllDepartments?lang=';

  static const String GET_EMPLOYEES_URL =
      '/ReqMeetingsAPI/GetEmployeeDetails?lang=';

  static String GET_EMPLOYEES_BY_DEPARTMENT_URL(String id, String lang) =>
      '/ReqBonusAPI/GetEmployeesByDepartment?departmnetId=$id&lang=$lang';

  static String GET_EMPLOYEE_BY_ID_URL(String id) =>
      '/HrEmployeeEvaluationAPI/GetEmployeeById?id=$id';

  /// EVALUATION
  static const String GET_EVALUATIONS_URL = '/HrEmployeeEvaluationAPI/Index';

  static const String GET_EVALUATED_EMPLOYEE_EVALUATIONS_URL =
      '/HrEmployeeEvaluationAPI/GetEvaluatedEmployeeEvaluations';

  static String GET_CREATE_EVALUATION_URL(String fileId) =>
      '/HrEmployeeEvaluationAPI/Create?fileId=$fileId';

  static const String CREATE_EVALUATION_URL = '/HrEmployeeEvaluationAPI/Create';
  static const String GET_EVALUATION_FORM_TYPE_URL =
      '/HrEvaluationFormAPI/GetAllEvaluationFormForDDList';

  static String GET_UPDATE_EVALUATION_URL(
          String? fileId, String empId, String empEvalId) =>
      '/HrEmployeeEvaluationAPI/Edit?fileId=$fileId&empId=$empId&FK_HrEmployeeEvaluationId=$empEvalId';
  static const String UPDATE_EVALUATION_URL = '/HrEmployeeEvaluationAPI/Edit';

  /// LOAN
  static const String GET_EMP_LOANS_URL = '/ReqLoanAPI/GetEmployeeLoans';
  static String GET_CREATE_LOAN_URL(String lang) =>
      '/ReqLoanAPI/Create?lang=$lang';
  static String GET_UPDATE_LOAN_URL(String loanId) =>
      '/ReqLoanAPI/Edit?id=$loanId';
  static const String CREATE_LOAN_URL = '/ReqLoanAPI/Create';
  static const String UPDATE_LOAN_URL = '/ReqLoanAPI/Edit';
  static String GET_LOAN_BY_ID_URL(String id) => '/ReqLoanAPI/Details?id=$id';

  /// BONUS
  static String GET_ALL_BONUS_URL = '/ReqBonusAPI/GetAllBonus';
  static const String GET_BONUS_COUNT_URL = '/ReqBonusAPI/GetBonusCount';
  static const String GET_BONUS_CHART_URL = '/ReqBonusAPI/GetBonusChart';
  static const String CREATE_BONUS_URL = '/ReqBonusAPI/CreateBonus';

  /// PUNISHMENT
  static const String GET_ALL_PUNISHMENTS_URL =
      '/ReqPunishmentAPI/GetAllPunishment';
  static const String GET_PUNISHMENTS_COUNT_URL =
      '/ReqPunishmentAPI/GetPunishmentsCount';
  static const String GET_PUNISHMENTS_CHART_URL =
      '/ReqPunishmentAPI/GetPunishmentsChart';
  static const String CREATE_PUNISHMENTS_URL =
      '/ReqPunishmentAPI/CreatePunishments';

  /// ALERT
  static const String GET_ALL_ALERTS_URL = '/ReqAlertAPI/GetAllAlerts';
  static const String GET_ALERTS_COUNT_URL = '/ReqAlertAPI/GetAlertsCount';
  static const String GET_ALERTS_CHART_URL = '/ReqAlertAPI/GetAlertsChart';
  static const String CREATE_ALERTS_URL = '/ReqAlertAPI/CreateAlerts';

  /// TICKETS
  static const String GET_EMPLOYEE_REQUEST_TICKETS_URL =
      '/ReqTicket/GetEmployeeRequestTickets';
  static const String GET_CREATE_TICKET_URL = '/ReqTicket/GetDataCreate';
  static const String GET_TICKET_PAYMENT_TYPE_URL =
      '/ReqTicket/GetAllPaymentTypeForDDList';
  static const String GET_TICKET_DETAILS_URL = '/ReqTicket/Details?id=';
  static const String CREATE_TICKET_URL = '/ReqTicket/Create';
  static const String APPROVE_TICKET_REQUEST_URL =
      '/ReqTicket/ApproveRequest?id=';
  static String GET_TICKET_MANAGER_DETAILS_URL(String id, String userType) =>
      '/ReqTicket/ManagerDetails?id=$id&userType=$userType';
  static String REJECT_TICKET_URL(String id, String reason) =>
      '/ReqTicket/RejectRequest?id=$id&reason=$reason';

  /// NOTIFICATIONS
  static const String INDEX_NOTIFICATIONS_URL = '/NotificationAPI/Index';
  static const String GET_NOTIFICATIONS_URL =
      '/NotificationAPI/GetNotifications';
  static const String GET_NOTIFICATIONS_COUNTER_URL =
      '/NotificationAPI/GetCounters';

  /// SIGN IN & SIGN OUT
  static const String GET_SIGNIN_SIGNOUT_URL =
      '/ReqSignInOutAPI/GetListSignInOut';
  static const String GET_CREATE_SIGNIN_SIGNOUT_URL = '/ReqSignInOutAPI/Create';
  static const String CREATE_SIGNIN_SIGNOUT_URL = '/ReqSignInOutAPI/Create';

  /// COMPLAINTS
  static const String GET_ALL_JOB_TYPES_URL = '/ReqComplaintAPI/GetAllJobTypes';
  static const String GET_EMPLOYEE_COMPLAINTS_DETAILS_URL =
      '/ReqComplaintAPI/GetEmployeeDetails?lang=';
  static const String GET_COMPLAINTS_HOME_PAGE_URL =
      '/ReqComplaintAPI/GetHomePage?lang=';
  static const String CREATE_COMPLAINT_URL = '/ReqComplaintAPI/Create';
  static const String CREATE_COMPLAINT_DETAILS_URL =
      '/ReqComplaintAPI/CreateComplaintDetails';

  /// PURCHASE ORDER
  static const String GET_ALL_PURCHASE_ORDER_URL =
      '/PurchaseOrderAPI/GetPurchaseOrders';
  static const String GET_CREATE_PURCHASE_URL =
      '/PurchaseOrderAPI/GetForCreate';
  static const String GET_PURCHASE_DEPARTMENTS_URL =
      '/PurchaseOrderAPI/GetAllDepartmentForDDList?lang=';
  static String GET_PURCHASE_EMPLOYEES_BY_DEPARTMENT_URL(
          String id, String lang) =>
      '/PurchaseOrderAPI/GetEmployeeByDepartmentForDDL?id=$id&lang=$lang';
  static String GET_ALL_ST_PRODUCTS_FOR_DDLIST_WITH_IMAGES_BY_CATEGORY_ID_URL(
          String id, String lang) =>
      '/PurchaseOrderAPI/GetAllStProductsForDDListWithImagesByCatId?id=$id&lang=$lang';
  static String GET_PURCHASE_PRODUCT_DATA_URL(String id) =>
      '/PurchaseOrderAPI/GetProductData?id=$id';
  static String GET_ALL_ST_ITEM_BY_PRODUCT_ID_FOR_DDL_URL(
          String id, String lang) =>
      '/PurchaseOrderAPI/GetAllStItemByProductIdForDDl?id=$id&lang=$lang';
  static const String GET_ALL_PURCHASE_CATEGORIES_URL =
      '/PurchaseOrderAPI/GetAllCategories?lang=';
  static const String GET_ALL_ST_STATUS_URL =
      '/PurchaseOrderAPI/GetAllStStatus';
  static const String CREATE_PURCHASE_URL = '/PurchaseOrderAPI/Create';
  static String SEARCH_PURCHASE_URL(
    String dateFrom,
    String dateTo,
    String statusId,
    String serialNumber,
    String departmentId,
    String employeeId,
  ) =>
      '/PurchaseOrderAPI/GetAll?dateFrom=$dateFrom&dateTo=$dateTo&statusId=$statusId&serialNumber=$serialNumber&departId=$departmentId&empId=$employeeId';

  static String GET_FOR_REJECT_PURCHASE_URL(String id) =>
      '/PurchaseOrderAPI/GetForReject?id=$id';
  static String GET_FOR_APPROVE_PURCHASE_URL(String id) =>
      '/PurchaseOrderAPI/GetForApprove?id=$id';
  static String GET_PURCHASE_DETAILS_BY_ID_URL(String id) =>
      '/PurchaseOrderAPI/GetDetailsById?id=$id';
  static String REJECT_PURCHASE_URL(String id, String reason) =>
      '/PurchaseOrderAPI/Reject?id=$id&reason=$reason';
  static String APPROVE_PURCHASE_URL(String id) =>
      '/PurchaseOrderAPI/Approve?id=$id&detailApprovedIds'; //{"Ids" : Return value: {int32[9, 10, etc]}

  /// CUSTODY
  static const String GET_ALL_CUSTODIES_URL = '/RequestCustody/GetAll';
  static const String CREATE_CUSTODY_URL = '/RequestCustody/Create';
  static const String UPDATE_CUSTODY_URL = '/RequestCustody/Update';

  /// MESSAGE
  static String GET_ALL_MESSAGES_URL(String? empId) {
    if (empId != null) {
      return '/ReqMessagesAPI/GetAllMessages?employeeId=$empId';
    } else {
      return '/ReqMessagesAPI/GetAllMessages';
    }
  }

  static String GET_MESSAGES_DETAILS_URL(String empId) =>
      ' /ReqMessagesAPI/GetMessageDetails?employeeId=$empId';
  static String GET_DELETE_SEND_MESSAGE_URL(String empId) =>
      '/ReqMessagesAPI/DeleteSendAsync?id=$empId';
  static const String GET_ALL_MESSAGES_TYPE_URL =
      '/ReqMessagesAPI/GetAllMessageType';
  static const String SEND_MESSAGE_URL = '/ReqMessagesAPI/SendMessage';
  static const String REPLY_MESSAGE_URL = '/ReqMessagesAPI/ReplyMessage';
}
