import 'dart:core';

class CreateDecisionResponse {
  final bool result;

  CreateDecisionResponse({
    required this.result,
  });

  factory CreateDecisionResponse.fromJson(Map<String, dynamic> json) {
    return CreateDecisionResponse(
      result: json['result'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'result': result,
    };
  }
}
