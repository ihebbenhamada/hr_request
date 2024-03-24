class Vacation {
  final int vacationId;
  final int fKHrEmployeeId;
  final String? employeeNameAr;
  final String? employeeNameEn;
  final int fKAlternativeEmployee;
  final String? alternativeEmployeeNameAr;
  final String? alternativeEmployeeNameEn;
  final int fKAlternativeToPayingAnyDue;
  final String? alternativeToPayingEmployeeNameAr;
  final String? alternativeToPayingEmployeeNameEn;
  final int fKHrVacationTypeId;
  final DateTime dateFrom;
  final DateTime dateTo;
  final double consideredDays;
  final int year;
  final String description;
  final DateTime creationDate;
  final DateTime lastModifiedDate;
  final bool isActive;
  final bool isDeleted;
  final bool canEdit;
  final DateTime? dueDate;
  final int fKReqStatusId;
  final int vacationTypeId;
  final String? vacationTypeCode;
  final String? vacationTypeNameAr;
  final String? vacationTypeNameEn;
  final String? vacationTypeDescription;
  final List<dynamic> vacationTypes;
  final List<dynamic> employees;
  final String? message;

  Vacation({
    required this.vacationId,
    required this.fKHrEmployeeId,
    this.employeeNameAr,
    this.employeeNameEn,
    required this.fKAlternativeEmployee,
    this.alternativeEmployeeNameAr,
    this.alternativeEmployeeNameEn,
    required this.fKAlternativeToPayingAnyDue,
    this.alternativeToPayingEmployeeNameAr,
    this.alternativeToPayingEmployeeNameEn,
    required this.fKHrVacationTypeId,
    required this.dateFrom,
    required this.dateTo,
    required this.consideredDays,
    required this.year,
    required this.description,
    required this.creationDate,
    required this.lastModifiedDate,
    required this.isActive,
    required this.isDeleted,
    required this.canEdit,
    this.dueDate,
    required this.fKReqStatusId,
    required this.vacationTypeId,
    this.vacationTypeCode,
    this.vacationTypeNameAr,
    this.vacationTypeNameEn,
    this.vacationTypeDescription,
    required this.vacationTypes,
    required this.employees,
    this.message,
  });
  factory Vacation.fromJson(Map<String, dynamic> json) {
    return Vacation(
      vacationId: json['vacationId'] as int,
      fKHrEmployeeId: json['fK_HrEmployeeId'] as int,
      employeeNameAr: json['employeeNameAr'] as String,
      employeeNameEn: json['employeeNameEn'] as String,
      fKAlternativeEmployee: json['fK_AlternativeEmployee'] as int,
      alternativeEmployeeNameAr: json['alternativeEmployeeNameAr'] as String,
      alternativeEmployeeNameEn: json['alternativeEmployeeNameEn'] as String,
      fKAlternativeToPayingAnyDue: json['fK_AlternativeToPayingAnyDue'] as int,
      alternativeToPayingEmployeeNameAr:
          json['alternativeToPayingEmployeeNameAr'] as String,
      alternativeToPayingEmployeeNameEn:
          json['alternativeToPayingEmployeeNameAr'] as String,
      fKHrVacationTypeId: json['fK_HrVacationTypeId'] as int,
      dateFrom: json['dateFrom'] as DateTime,
      dateTo: json['dateTo'] as DateTime,
      consideredDays: json['consideredDays'] as double,
      year: json['year'] as int,
      description: json['description'] as String,
      creationDate: json['creationDate'] as DateTime,
      lastModifiedDate: json['lastModifiedDate'] as DateTime,
      isActive: json['isActive'] as bool,
      isDeleted: json['isDeleted'] as bool,
      canEdit: json['canEdit'] as bool,
      dueDate: json['dueDate'] as DateTime,
      fKReqStatusId: json['fKReqStatusId'] as int,
      vacationTypeId: json['vacationTypeId'] as int,
      vacationTypeCode: json['vacationTypeCode'] as String,
      vacationTypeNameAr: json['vacationTypeNameAr'] as String,
      vacationTypeNameEn: json['vacationTypeNameEn'] as String,
      vacationTypeDescription: json['vacationTypeDescription'] as String,
      vacationTypes: json['vacationTypes'] as List,
      employees: json['employees'] as List,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vacationId': vacationId,
      'fK_rEmployeeId': fKHrEmployeeId,
      'employeeNameAr': employeeNameAr,
      'employeeNameEn': employeeNameEn,
      'fK_AlternativeEmployee': fKAlternativeEmployee,
      'alternativeEmployeeNameAr': alternativeEmployeeNameAr,
      'alternativeEmployeeNameEn': alternativeEmployeeNameEn,
      'fK_AlternativeToPayingAnyDue': fKAlternativeToPayingAnyDue,
      'alternativeToPayingEmployeeNameAr': alternativeToPayingEmployeeNameAr,
      'alternativeToPayingEmployeeNameEn': alternativeToPayingEmployeeNameEn,
      'fK_HrVacationTypeId': fKHrVacationTypeId,
      'dateFrom': dateFrom,
      'dateTo': dateTo,
      'consideredDays': consideredDays,
      'year': year,
      'description': description,
      'creationDate': creationDate,
      'lastModifiedDate': lastModifiedDate,
      'isActive': isActive,
      'isDeleted': isDeleted,
      'canEdit': canEdit,
      'dueDate': dueDate,
      'fK_ReqStatusId': fKReqStatusId,
      'vacationTypeId': vacationTypeId,
      'vacationTypeCode': vacationTypeCode,
      'vacationTypeNameAr': vacationTypeNameAr,
      'vacationTypeNameEn': vacationTypeNameEn,
      'vacationTypeDescription': vacationTypeDescription,
      'vacationTypes': vacationTypes,
      'employees': employees,
      'message': message,
    };
  }
}
