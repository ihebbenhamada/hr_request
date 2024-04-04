class EndPoints {
  /// BASE URL
  static const String BASE_URL = 'http://46.235.91.228:8087';

  /// LOGIN
  static const String LOGIN_URL = '/Authentication/Login';
  static const String GET_EMPLOYEE_VACATIONS_URL =
      '/ReqVacation/GetEmployeeVacations';
  static const String GET_ALL_VACATION_SENT_URL = '/ReqVacation/GetAllSent';
  static const String CREATE_VACATION_URL = '/ReqVacation/Create';
  static const String GET_CREATE_VACATION_URL = '/ReqVacation/GetCreate';

  /// FIRST STEP VACATION
  static const String GET_CREATE_FIRST_STEP_URL =
      '/ReqFinalExitAPI/GetFirstStep?employeeId=';
  static const String CREATE_FIRST_STEP_URL =
      '/ReqFinalExitAPI/CreateFirstStep';

  /// GET DECISIONS
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

  static const String GET_DEPARTMENTS_URL =
      '/PurchaseOrderAPI/GetAllDepartmentForDDList?lang=';

  static const String GET_EMPLOYEES_URL =
      '/ReqMeetingsAPI/GetEmployeeDetails?lang=';

  static String GET_EMPLOYEES_BY_DEPARTMENT_URL(String id, String lang) =>
      '/PurchaseOrderAPI/GetEmployeeByDepartmentForDDL?id=$id&lang=$lang';
}
