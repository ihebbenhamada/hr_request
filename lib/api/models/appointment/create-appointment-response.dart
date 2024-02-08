class CreateAppointmentResponse {
  final int appointmentId;
  final String patientFullName;
  final String doctorName;
  final String clinicName;
  final String medicalRegisterNo;
  final DateTime appointmentDate;
  final String appointmentTimeFrom;
  final String appointmentTimeTo;
  final int appointmentNo;
  final bool isInserted;
  final String resultMessage;
  final int fKMedDoctorScheduleId;

  CreateAppointmentResponse({
    required this.appointmentId,
    required this.patientFullName,
    required this.doctorName,
    required this.clinicName,
    required this.medicalRegisterNo,
    required this.appointmentDate,
    required this.appointmentTimeFrom,
    required this.appointmentTimeTo,
    required this.appointmentNo,
    required this.isInserted,
    required this.resultMessage,
    required this.fKMedDoctorScheduleId,
  });

  factory CreateAppointmentResponse.fromJson(Map<String, dynamic> json) {
    return CreateAppointmentResponse(
      appointmentId: json['appointmentId'],
      patientFullName: json['patientFullName'],
      doctorName: json['doctorName'],
      clinicName: json['clinicName'],
      medicalRegisterNo: json['medicalRegisterNo'],
      appointmentDate: json['appointmentDate'],
      appointmentTimeFrom: json['appointmentTimeFrom'],
      appointmentTimeTo: json['appointmentTimeTo'],
      appointmentNo: json['appointmentNo'],
      isInserted: json['isInserted'],
      resultMessage: json['resultMessage'],
      fKMedDoctorScheduleId: json['fK_MedDoctorScheduleId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appointmentId': appointmentId,
      'patientFullName': patientFullName,
      'doctorName': doctorName,
      'clinicName': clinicName,
      'medicalRegisterNo': medicalRegisterNo,
      'appointmentDate': appointmentDate,
      'appointmentTimeFrom': appointmentTimeFrom,
      'appointmentTimeTo': appointmentTimeTo,
      'appointmentNo': appointmentNo,
      'isInserted': isInserted,
      'resultMessage': resultMessage,
      'fK_MedDoctorScheduleId': fKMedDoctorScheduleId,
    };
  }
}
