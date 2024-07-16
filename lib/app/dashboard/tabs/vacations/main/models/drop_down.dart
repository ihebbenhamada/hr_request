import 'dart:convert';

String dropDownModelToJson(DropDownModel data) => json.encode(data.toJson());

class DropDownModel {
  final bool? disabled;
  final String? text;
  final String? value;

  DropDownModel({
    this.disabled,
    this.text,
    this.value,
  });

  factory DropDownModel.fromJson(Map<String, dynamic> json) {
    return DropDownModel(
      disabled: json['disabled'] as bool?,
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
