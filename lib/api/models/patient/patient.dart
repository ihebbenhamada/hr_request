class Patient {
  final int id;
  final String fullName;
  final String medicalRegisterNo;
  final String birthDateGregorian;
  final String birthDateHajiri;
  final String nationality;
  final String hawia;
  final String mobile;

  Patient({
    required this.id,
    required this.fullName,
    required this.medicalRegisterNo,
    required this.birthDateGregorian,
    required this.birthDateHajiri,
    required this.nationality,
    required this.hawia,
    required this.mobile,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      fullName: json['fullName'],
      medicalRegisterNo: json['medicalRegisterNo'],
      birthDateGregorian: json['birthDateGregorian'],
      birthDateHajiri: json['birthDateHajiri'],
      nationality: json['nationality'],
      hawia: json['hawia'],
      mobile: json['mobile'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'medicalRegisterNo': medicalRegisterNo,
      'birthDateGregorian': birthDateGregorian,
    };
  }
}
