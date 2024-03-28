class ResultResponse {
  final bool result;
  final String message;

  ResultResponse({
    required this.message,
    required this.result,
  });

  factory ResultResponse.fromJson(Map<String, dynamic> json) {
    return ResultResponse(
      result: json['result'] as bool,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'result': result,
      'message': message,
    };
  }
}
