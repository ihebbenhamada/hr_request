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
  static const String GET_CREATE_FIRST_STEP_URL =
      '/ReqFinalExitAPI/GetFirstStep?employeeId=';
}
