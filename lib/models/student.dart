import 'package:flutter/material.dart';

enum Department { engineering(Icons.engineering), arts(Icons.palette), sports(Icons.directions_run), business(Icons.business);
final IconData icon;

  const Department(this.icon);
  }
  
enum Gender { male, female }

class Student {
  final String id;
  final String firstName;
  final String lastName;
  final Department department;
  final int grade;
  final Gender gender;
  
  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.department,
    required this.grade,
    required this.gender,
  });
   Student copyWith({
    String? id,
    String? firstName,
    String? lastName,
    Department? department,
    int? grade,
    Gender? gender,
  }) {
    return Student(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      department: department ?? this.department,
      grade: grade ?? this.grade,
      gender: gender ?? this.gender,
    );
  }
}