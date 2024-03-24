class DropDownModel {
  final bool disabled;
  final String text;
  final String value;

  DropDownModel({
    required this.disabled,
    required this.text,
    required this.value,
  });

  factory DropDownModel.fromJson(Map<String, dynamic> json) {
    return DropDownModel(
      disabled: json['disabled'] as bool,
      text: json['text'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'disabled': disabled,
      'text': text,
      'value': value,
    };
  }
}
