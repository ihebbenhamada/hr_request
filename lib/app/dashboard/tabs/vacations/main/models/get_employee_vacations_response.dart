import 'dart:core';

import 'package:request_hr/app/dashboard/tabs/vacations/main/models/vacation.dart';

class EmployeeVacations {
  final List<Vacation> all;
  final List<Vacation> pending;
  final List<Vacation> approved;
  final List<Vacation> rejected;
  final double vacationsPercentage;
  final double takenDays;
  final double leftDays;
  final String nextVacation;

  EmployeeVacations({
    required this.all,
    required this.pending,
    required this.approved,
    required this.rejected,
    required this.vacationsPercentage,
    required this.takenDays,
    required this.leftDays,
    required this.nextVacation,
  });

  factory EmployeeVacations.fromJson(Map<String, dynamic> json) {
    return EmployeeVacations(
      all: (json['all'] as List<dynamic>)
          .map((vacation) => Vacation.fromJson(vacation))
          .toList(),
      pending: (json['pending'] as List<dynamic>)
          .map((vacation) => Vacation.fromJson(vacation))
          .toList(),
      approved: (json['approved'] as List<dynamic>)
          .map((vacation) => Vacation.fromJson(vacation))
          .toList(),
      rejected: (json['rejected'] as List<dynamic>)
          .map((vacation) => Vacation.fromJson(vacation))
          .toList(),
      vacationsPercentage: json['vacationsPercentage'].toDouble(),
      takenDays: json['takenDays'].toDouble(),
      leftDays: json['leftDays'].toDouble(),
      nextVacation: json['nextVacation'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'all': all,
      'pending': pending,
      'approved': approved,
      'rejected': rejected,
      'vacationsPercentage': vacationsPercentage,
      'takenDays': takenDays,
      'leftDays': leftDays,
      'nextVacation': nextVacation,
    };
  }
}
