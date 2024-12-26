import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/student.dart';
import 'departments_provider.dart';

class StudentsNotifier extends StateNotifier<List<Student>> {
  StudentsNotifier(super.state);

  void addStudent(Student student) {
    state = [...state, student];
  }

  void editStudent(Student student, int index) {
    final newState = [...state];
    newState[index] = newState[index].copyWith(
      firstName: student.firstName,
      lastName: student.lastName,
      department: student.department,
      gender: student.gender,
      grade: student.grade,
    );
    state = newState;
  }

  void insertStudent(Student student, int index) {
    final newState = [...state];
    newState.insert(index, student);
    state = newState;
  }
  
  void removeStudent(Student student) {
    state = state.where((m) => m.id != student.id).toList();
  }

  void deleteStudent(int index) {
    state = state.where((student) => student.id != state[index].id).toList();
  }

  void addStudentAt(int index, Student student) {
    final newState = [...state];
    newState.insert(index, student);
    state = newState;
  }
}

final studentsProvider =
    StateNotifierProvider<StudentsNotifier, List<Student>>((ref) {
  final departments = ref.read(departmentsProvider);

  return StudentsNotifier([
    Student(id: '1', firstName: 'John', lastName: 'Smith', department: departments[0].enumValue, gender: Gender.male, grade: 75),
    Student(id: '2', firstName: 'Ana', lastName: 'De Armas', department: departments[1].enumValue, gender: Gender.female, grade: 80),
    Student(id: '3', firstName: 'Will', lastName: 'Smith', department: departments[2].enumValue, gender: Gender.male, grade: 95),
    Student(id: '4', firstName: 'Jack', lastName: 'Rassel', department: departments[3].enumValue, gender: Gender.male, grade: 60),
    Student(id: '5', firstName: 'Megan', lastName: 'Fox', department: departments[2].enumValue, gender: Gender.female, grade: 80),
  ]);
});

final departmentStudentCountsProvider = Provider<Map<Department, int>>((ref) {
  final students = ref.watch(studentsProvider);  
  final departmentCounts = <Department, int>{};
  for (var student in students) {
    final department = student.department;
    departmentCounts[department] = (departmentCounts[department] ?? 0) + 1;
  }
  return departmentCounts;
});