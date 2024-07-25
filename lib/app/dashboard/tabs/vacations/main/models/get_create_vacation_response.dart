import 'drop_down.dart';

class GetCreateVacation {
  final int vacationId;
  final int? fKHrEmployeeId;
  final int? fKAlternativeEmployee;
  final int? fKAlternativeToPayingAnyDue;
  final int? fKHrVacationTypeId;
  final String dateFrom;
  final String dateTo;
  final int consideredDays;
  final int year;
  final String? description;
  final int? fKReqStatusId;
  final int? fKCreatorId;
  final String? dueDate;
  final List<DropDownModel> vacationTypes;
  final List<DropDownModel> employees;
  final String? resultMessage;
  final String? resultStatus;

  GetCreateVacation({
    required this.vacationId,
    this.fKHrEmployeeId,
    this.fKAlternativeEmployee,
    this.fKAlternativeToPayingAnyDue,
    this.fKHrVacationTypeId,
    required this.dateFrom,
    required this.dateTo,
    required this.consideredDays,
    required this.year,
    required this.description,
    this.fKReqStatusId,
    this.fKCreatorId,
    required this.dueDate,
    required this.vacationTypes,
    required this.employees,
    this.resultMessage,
    this.resultStatus,
  });

  factory GetCreateVacation.fromJson(Map<String, dynamic> json) {
    return GetCreateVacation(
      resultMessage: json['resultMessage'] as String?,
      resultStatus: json['resultStatus'] as String?,
      vacationId: json['vacationId'] as int,
      fKHrEmployeeId: json['fK_HrEmployeeId'] as int?,
      fKAlternativeEmployee: json['fKAlternativeEmployee'] as int?,
      fKAlternativeToPayingAnyDue: json['fK_AlternativeToPayingAnyDue'] as int?,
      fKHrVacationTypeId: json['fK_HrVacationTypeId'] as int?,
      dateFrom: json['dateFrom'] as String,
      dateTo: json['dateTo'] as String,
      consideredDays: json['consideredDays'] as int,
      year: json['year'] as int,
      description: json['description'] as String?,
      fKReqStatusId: json['fK_ReqStatusId'] as int?,
      fKCreatorId: json['fK_CreatorId'] as int?,
      dueDate: json['dueDate'] != null ? json['dueDate'] as String : null,
      vacationTypes: (json['vacationTypes'] as List<dynamic>)
          .map((vacationType) => DropDownModel.fromJson(vacationType))
          .toList(),
      employees: (json['employees'] as List<dynamic>)
          .map((employee) => DropDownModel.fromJson(employee))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resultMessage': resultMessage,
      'resultStatus': resultStatus,
      'vacationId': vacationId,
      'fK_HrEmployeeId': fKHrEmployeeId,
      'fK_AlternativeEmployee': fKAlternativeEmployee,
      'fK_AlternativeToPayingAnyDue': fKAlternativeToPayingAnyDue,
      'fK_HrVacationTypeId': fKHrVacationTypeId,
      'dateFrom': dateFrom,
      'dateTo': dateTo,
      'consideredDays': consideredDays,
      'year': year,
      'description': description,
      'fK_ReqStatusId': fKReqStatusId,
      'fK_CreatorId': fKCreatorId,
      'dueDate': dueDate,
      'vacationTypes': vacationTypes,
      'employees': employees,
    };
  }
}
