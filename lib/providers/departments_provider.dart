import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/department.dart';
import '../models/student.dart';

final departmentsProvider = Provider((ref) {
  return [
    DepartmentModel(id: '1', name: 'Engineering', icon: Icons.engineering, color: const Color.fromARGB(31, 4, 106, 195), enumValue: Department.engineering),
    DepartmentModel(id: '2', name: 'Art', icon: Icons.palette, color: const Color.fromARGB(31, 4, 163, 195), enumValue: Department.arts),
    DepartmentModel(id: '3', name: 'Sport', icon: Icons.directions_run, color: const Color.fromARGB(31, 106, 4, 195), enumValue: Department.sports),
    DepartmentModel(id: '4', name: 'Business', icon: Icons.business, color: const Color.fromARGB(31, 179, 4, 195), enumValue: Department.business),
  ];
});