class CreateVacation {
  final String result;
  final String message;

  CreateVacation({
    required this.message,
    required this.result,
  });

  factory CreateVacation.fromJson(Map<String, dynamic> json) {
    return CreateVacation(
      result: json['Result'] as String,
      message: json['Message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Result': result,
      'Message': message,
    };
  }
}
