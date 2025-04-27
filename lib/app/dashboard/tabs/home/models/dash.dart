import 'package:request_hr/config/colors/colors.dart';

import '../../../../../config/image_urls/image_urls.dart';

class DashBoardInfo {
  final int employeeId;
  final String employeeNameAr;
  final String employeeNameEn;
  final String employeeJob;
  final String? employeeImagePath;
  final double basicSalary;
  final double allowances;
  final double totalExtra;
  final double totalLoan;
  final double totalBonus;
  final double punishments;
  final double netSalary;
  final String contractDateFrom;
  final String contractDateTo;
  final int annualLeaveCount;
  final bool hasAirlineTicket;
  final int meetingsCount;
  final List<Meeting> incomingMeetings;

  DashBoardInfo({
    required this.employeeId,
    required this.employeeNameAr,
    required this.employeeNameEn,
    required this.employeeJob,
    this.employeeImagePath,
    required this.basicSalary,
    required this.allowances,
    required this.totalExtra,
    required this.totalLoan,
    required this.totalBonus,
    required this.punishments,
    required this.netSalary,
    required this.contractDateFrom,
    required this.contractDateTo,
    required this.annualLeaveCount,
    required this.hasAirlineTicket,
    required this.meetingsCount,
    required this.incomingMeetings,
  });

  factory DashBoardInfo.fromJson(Map<String, dynamic> json) {
    return DashBoardInfo(
      employeeId: json['employeeId'],
      employeeNameAr: json['employeeNameAr'],
      employeeNameEn: json['employeeNameEn'],
      employeeJob: json['employeeJob'],
      employeeImagePath: json['employeeImagePath'],
      basicSalary: (json['basicSalary'] as num).toDouble(),
      allowances: (json['allowances'] as num).toDouble(),
      totalExtra: (json['totalExtra'] as num).toDouble(),
      totalLoan: (json['totalLoan'] as num).toDouble(),
      totalBonus: (json['totalBonus'] as num).toDouble(),
      punishments: (json['punishments'] as num).toDouble(),
      netSalary: (json['netSalary'] as num).toDouble(),
      contractDateFrom: json['contractDateFrom'],
      contractDateTo: json['contractDateTo'],
      annualLeaveCount: json['annualLeaveCount'],
      hasAirlineTicket: json['hasAirlineTicket'],
      meetingsCount: json['meetingsCount'],
      incomingMeetings: (json['incomingMeetings'] as List)
          .map((e) => Meeting.fromJson(e))
          .toList(),
    );
  }
  List<Map<String, dynamic>> getGeneralInfos() {
    return [
      {
        'title': 'Basic Salary',
        'value': basicSalary,
        'image': AppImages.basicSalary,
      },
      {
        'title': 'Allowances',
        'value': allowances,
        'image': AppImages.allowances,
      },
      {
        'title': 'Total Extra',
        'value': totalExtra,
        'image': AppImages.totalExtra,
      },
      {
        'title': 'Total Loan',
        'value': totalLoan,
        'image': AppImages.totalLoan,
      },
      {
        'title': 'Total Bonus',
        'value': totalBonus,
        'image': AppImages.basicSalary,
        'color': AppColors.primary,
      },
      {
        'title': 'Punishments',
        'value': punishments,
        'image': AppImages.punishments,
      },
      {
        'title': 'Net Salary',
        'value': netSalary,
        'image': AppImages.netSalary,
      },
    ];
  }
}

class Meeting {
  final int meetingId;
  final String meetingTitle;
  final String subject;
  final DateTime meetingDate;

  Meeting({
    required this.meetingId,
    required this.meetingTitle,
    required this.subject,
    required this.meetingDate,
  });

  factory Meeting.fromJson(Map<String, dynamic> json) {
    return Meeting(
      meetingId: json['meetingId'],
      meetingTitle: json['meetingTitle'],
      subject: json['subject'],
      meetingDate: DateTime.parse(json['meetingDate']),
    );
  }
}
