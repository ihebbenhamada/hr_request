class DeletePatientResponse {
  final int patientId;
  final bool result;
  final String resultMessage;

  DeletePatientResponse({
    required this.patientId,
    required this.result,
    required this.resultMessage,
  });

  factory DeletePatientResponse.fromJson(Map<String, dynamic> json) {
    return DeletePatientResponse(
      patientId: json['patientId'],
      result: json['result'],
      resultMessage: json['resultMessage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'patientId': patientId,
      'result': result,
      'resultMessage': resultMessage,
    };
  }
}
