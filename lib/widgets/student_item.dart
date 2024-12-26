import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentItem extends StatelessWidget {
  const StudentItem({
    super.key,
    required this.student,
  });

  final Student student;

  @override
  Widget build(BuildContext context) {
    final Color cardColor =
        student.gender == Gender.male ? Colors.blueGrey : Colors.orangeAccent;

    final IconData departmentIcon;
    switch (student.department) {
      case Department.sports:
        departmentIcon = Icons.directions_run;
        break;
      case Department.engineering:
        departmentIcon = Icons.engineering;
        break;
      case Department.arts:
        departmentIcon = Icons.palette;
        break;
      case Department.business:
        departmentIcon = Icons.business;
        break;
    }

    return Card(
      color: cardColor,
      child: ListTile(
        leading: Text(
          '${student.firstName} ${student.lastName}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(departmentIcon, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              student.grade.toString(),
              style: const TextStyle(color: Colors.white),
              
            ),
          ],
        ),
      ),
    );
  }
}