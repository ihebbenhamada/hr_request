class PatientAppointmentResponse {
  final int patientId;
  final int appointmentId;
  final String mobile;
  final String hawia;
  final String medicalRegisterNo;
  final String patientName;
  final String clinicID;
  final String clinicName;
  final String doctorID;
  final String doctorName;
  final DateTime appointmentDate;
  final String appointmenTime;
  final String appointmenNo;

  PatientAppointmentResponse({
    required this.patientId,
    required this.appointmentId,
    required this.mobile,
    required this.hawia,
    required this.medicalRegisterNo,
    required this.patientName,
    required this.clinicID,
    required this.clinicName,
    required this.doctorID,
    required this.doctorName,
    required this.appointmentDate,
    required this.appointmenTime,
    required this.appointmenNo,
  });

  factory PatientAppointmentResponse.fromJson(Map<String, dynamic> json) {
    return PatientAppointmentResponse(
      patientId: json['patientId'],
      appointmentId: json['appointmentId'],
      mobile: json['mobile'],
      hawia: json['hawia'],
      medicalRegisterNo: json['medicalRegisterNo'],
      patientName: json['patientName'],
      clinicID: json['clinicID'],
      clinicName: json['clinicName'],
      doctorID: json['doctorID'],
      doctorName: json['doctorName'],
      appointmentDate: json['appointmentDate'],
      appointmenTime: json['appointmenTime'],
      appointmenNo: json['appointmenNo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'patientId': patientId,
      'appointmentId': appointmentId,
      'mobile': mobile,
      'hawia': hawia,
      'medicalRegisterNo': medicalRegisterNo,
      'patientName': patientName,
      'clinicID': clinicID,
      'clinicName': clinicName,
      'doctorID': doctorID,
      'doctorName': doctorName,
      'appointmentDate': appointmentDate,
      'appointmenTime': appointmenTime,
      'appointmenNo': appointmenNo,
    };
  }
}
