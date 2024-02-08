import 'package:dio/dio.dart';

import '../../../config/api-urls/end_points.dart';
import '../../../config/interceptor/interceptor.dart';
import '../../models/patient/patient.dart';

class AppointmentsWebServices {
  Future<Patient?> addNewAppointment(
    int patientId,
    int doctorId,
    int clinicId,
    int fkMeddoctorscheduleid,
    String medicalRegisterNo,
    DateTime appointmentDate,
    String appointmentTimeFrom,
    String appointmentTimeTo,
    int appointmentNo,
  ) async {
    Map<String, dynamic> body = {
      "patientId": patientId,
      "doctorId": doctorId,
      "clinicId": clinicId,
      "fK_MedDoctorScheduleId": fkMeddoctorscheduleid,
      "medicalRegisterNo": medicalRegisterNo,
      "appointmentDate": appointmentDate,
      "appointmentTimeFrom": appointmentTimeFrom,
      "appointmentTimeTo": appointmentTimeTo,
      "appointmentNo": appointmentNo,
    };

    Response? response = await AppInterceptor.dio
        ?.post(EndPoints.CREATE_PATIENT_APPOINTMENT, data: body);
    if (response != null && response.statusCode == 200) {
      return Patient.fromJson(response.data);
    } else {
      return null;
    }
  }
}
