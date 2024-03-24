class VacationSent {
  final String resultMessage;
  final bool resultStatus;
  final List<dynamic> data;

  VacationSent({
    required this.resultMessage,
    required this.resultStatus,
    required this.data,
  });

  factory VacationSent.fromJson(Map<String, dynamic> json) {
    return VacationSent(
      resultMessage: json['resultMessage'] as String,
      resultStatus: json['resultStatus'] as bool,
      data: json['data'] as List<dynamic>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resultMessage': resultMessage,
      'resultStatus': resultStatus,
      'data': data,
    };
  }
}
