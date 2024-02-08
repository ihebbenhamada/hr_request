class EndPoints {
  /// BASE URL
  static const String BASE_URL = 'http://46.235.91.228:8086';

  /// LOGIN
  static const String LOGIN_URL = '/api/Authentication/token';

  /// GET PATIENT
  static const String GET_PATIENT_BY_MOBILE_NUMBER =
      '/bot/Patient/GetPatientByMobile?mobile=';

  static const String GET_PATIENT_BY_HAWIA =
      '/bot/Patient/GetPatientByHawia?hawia=';

  static const String GET_PATIENT_BY_MRN =
      '/bot/Patient/GetPatientByMRN?medicalRegisterNo=';

  /// CREATE PATIENT
  static const String CREATE_PATENT = '/bot/Patient/CreatePatient';

  /// DELETE PATIENT
  static const String DELETE_PATIENT_BY_ID =
      '/bot/Patient/DeletePatient?patientId=';

  /// CREATE APPOINTMENT
  static const String CREATE_PATIENT_APPOINTMENT =
      '/bot/Patient/CreatePatientAppointment';

  /// GET PATIENT APPOINTMENTS
  static const String GET_PATIENT_APPOINTMENTS_BY_HAWIA =
      '/bot/Patient/GetPatientAppointmentsByHawia?hawia =';

  static const String GET_PATIENT_APPOINTMENTS_BY_MOBILE_NUMBER =
      '/bot/Patient/GetPatientAppointmentsByMobile?mobile =';

  static const String GET_PATIENT_APPOINTMENTS_BY_MRN =
      '/bot/Patient/GetPatientAppointmentsByMRN?medicalRegisterNo=';

  static const String GET_PATIENT_APPOINTMENTS_BY_PATIENT_ID =
      '/bot/Patient/GetPatientAppointmentsByPatientId?id =';

  /// CANCEL APPOINTMENT
  static const String CANCEL_PATIENT_APPOINTMENT_BY_APPOINTMENT_ID =
      '/bot/patient/CancelByAppointmentId?patient AppointmentId=';

  static const String CANCEL_PATIENT_APPOINTMENTS_BY_PATIENT_ID =
      '/bot/patient/CancelAllByAppointmentsByPatientID?patientId=';

  static const String CANCEL_PATIENT_APPOINTMENTS_BY_CLINIC_PATIENT_DATE =
      '/bot/patient/CancelPatientAppointments';

  /// UPDATE APPOINTMENT
  static const String UPDATE_PATIENT_APPOINTMENT =
      '/bot/patient/UpdatePatientAppointment';

  /// GET CLINICS
  static const String GET_ALL_CLINICS = '/bot/patient/GetAllClinics';

  /// GET DOCTORS BY CLINIC
  static const String GET_ALL_DOCTORS_BY_CLINIC_ID =
      '/bot/patient/GetAllDoctorsByClinicId?clinicId=';

  /// GET DOCTOR SCHEDULE
  static const String GET_DOCTOR_SCHEDULE_BY_DOCTOR_ID =
      '/bot/patient/GetDoctorSchedule?doctorId=';

  static const String GET_DOCTOR_SCHEDULE_DATE =
      '/bot/patient/GetDoctorScheduleByDate';

  /// GET DOCTOR APPOINTMENTS
  static const String GET_DOCTOR_NEAREST_FIVE_APPOINTMENTS =
      '/bot/patient/GetDoctorNearestFiveAppointments?doctorId=';
}
