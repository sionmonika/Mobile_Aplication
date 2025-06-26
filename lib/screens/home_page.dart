import 'package:flutter/material.dart';
import 'package:class_manager/models/student.dart';
import 'package:class_manager/services/db_helper.dart';
import 'package:class_manager/screens/add_student.dart';
import 'package:class_manager/screens/student_details.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dbHelper = DatabaseHelper();
  List<Student> students = [];

  @override
  void initState() {
    super.initState();
    _refreshStudents();
  }

  Future<void> _refreshStudents() async {
    final students = await dbHelper.getAllStudents();
    setState(() => this.students = students);
  }

  Future<void> _toggleAttendance(Student student) async {
    student.present = !student.present;
    await dbHelper.updateStudent(student);
    _refreshStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Class Manager')),
      body: students.isEmpty
          ? const Center(child: Text('No students found'))
          : ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return ListTile(
                  title: Text(student.name),
                  subtitle:
                      Text('${student.className} - ${student.department}'),
                  trailing: IconButton(
                    icon: Icon(
                      student.present ? Icons.check_circle : Icons.cancel,
                      color: student.present ? Colors.green : Colors.red,
                    ),
                    onPressed: () => _toggleAttendance(student),
                  ),
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StudentDetailsPage(student: student),
                      ),
                    );
                    _refreshStudents();
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push<bool>(
            context,
            MaterialPageRoute(builder: (context) => AddStudentPage()),
          );
          if (result == true) {
            _refreshStudents(); // Only refresh if student was added
          }
        },
      ),
    );
  }
}
