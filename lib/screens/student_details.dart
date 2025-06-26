// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:class_manager/models/student.dart';
import 'package:class_manager/services/db_helper.dart';
import 'package:class_manager/screens/edit_student.dart';

class StudentDetailsPage extends StatelessWidget {
  final Student student;
  final dbHelper = DatabaseHelper;

  StudentDetailsPage({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditStudentPage(student: student),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _showDeleteDialog(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDetailRow('Name', student.name),
                _buildDetailRow('Email', student.email),
                _buildDetailRow('Phone', student.phone),
                _buildDetailRow('Class', student.className),
                _buildDetailRow('Department', student.department),
                _buildDetailRow('Gender', student.gender),
                _buildDetailRow('Date Registered', student.dateRegistered),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text('Attendance Status: ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(
                      student.present ? 'Present' : 'Absent',
                      style: TextStyle(
                        fontSize: 16,
                        color: student.present ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(value, style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Student'),
          content: Text('Are you sure you want to delete ${student.name}?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete', style: TextStyle(color: Colors.red)),
              onPressed: () async {
                await dbHelper.deleteStudent(student.id!);
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

extension on Type {
  Future<void> deleteStudent(int i) async {}
}
