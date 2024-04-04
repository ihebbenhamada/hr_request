class Employee {
  final int id;
  final String? code;
  final String? fullName;
  final String? fullNameEn;
  final String? idNumber;
  final String? imagePath;
  final String? jobName;
  final String? mobile;

  Employee({
    required this.id,
    this.code,
    this.fullName,
    this.fullNameEn,
    this.idNumber,
    this.imagePath,
    this.jobName,
    this.mobile,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] as int,
      code: json['code'] as String?,
      fullName: json['fullName'] as String?,
      fullNameEn: json['fullNameEn'] as String?,
      idNumber: json['idNumber'] as String?,
      imagePath: json['imagePath'] as String?,
      jobName: json['jobName'] as String?,
      mobile: json['mobile'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'fullName': fullName,
      'fullNameEn': fullNameEn,
      'idNumber': idNumber,
      'imagePath': imagePath,
      'jobName': jobName,
      'mobile': mobile,
    };
  }
}
