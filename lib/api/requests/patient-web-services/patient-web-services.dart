import 'package:dio/dio.dart';

import '../../../config/api-urls/end_points.dart';
import '../../../config/interceptor/interceptor.dart';
import '../../models/patient/delete-patient-response.dart';
import '../../models/patient/patient.dart';

class PatientWebServices {
  Future<Patient?> getPatientByHawia(String hawia) async {
    Response? response = await AppInterceptor.dio?.get(
      EndPoints.GET_PATIENT_BY_HAWIA + hawia,
    );
    if (response != null && response.statusCode == 200) {
      return Patient.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<Patient?> getPatientByMobileNumber(String mobileNumber) async {
    Response? response = await AppInterceptor.dio?.get(
      EndPoints.GET_PATIENT_BY_MOBILE_NUMBER + mobileNumber,
    );
    if (response != null && response.statusCode == 200) {
      return Patient.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<Patient?> getPatientByMRN(String mrn) async {
    Response? response = await AppInterceptor.dio?.get(
      EndPoints.GET_PATIENT_BY_MRN + mrn,
    );
    if (response != null && response.statusCode == 200) {
      return Patient.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<DeletePatientResponse?> deletePatient(String patientId) async {
    Response? response = await AppInterceptor.dio?.delete(
      EndPoints.DELETE_PATIENT_BY_ID + patientId,
    );
    if (response != null && response.statusCode == 200) {
      return DeletePatientResponse.fromJson(response.data);
    } else {
      return null;
    }
  }
}
