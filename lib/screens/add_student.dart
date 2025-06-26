import 'package:class_manager/services/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:class_manager/models/student.dart';
import 'package:class_manager/utils/validators.dart';
import 'package:intl/intl.dart';

class AddStudentPage extends StatefulWidget {
  @override
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  String _selectedClass = 'Class A';
  String _selectedDepartment = 'CS';
  String _selectedGender = 'Male';
  final dbHelper = DatabaseHelper();

  final List<String> classes = ['Class A', 'Class B', 'Class C', 'Class D'];
  final List<String> departments = ['CS', 'IT', 'ECE', 'EEE', 'MECH'];
  final List<String> genders = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Student')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: Validators.validateName,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.validateEmail,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone'),
                  keyboardType: TextInputType.phone,
                  validator: Validators.validatePhone,
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedClass,
                  items: classes.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() => _selectedClass = value!);
                  },
                  decoration: InputDecoration(labelText: 'Class'),
                  validator: Validators.validateDropdown,
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedDepartment,
                  items: departments.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() => _selectedDepartment = value!);
                  },
                  decoration: InputDecoration(labelText: 'Department'),
                  validator: Validators.validateDropdown,
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  items: genders.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() => _selectedGender = value!);
                  },
                  decoration: InputDecoration(labelText: 'Gender'),
                  validator: Validators.validateDropdown,
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _saveStudent,
                  child: Text('Save Student'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveStudent() async {
    if (_formKey.currentState!.validate()) {
      final newStudent = Student(
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        className: _selectedClass,
        department: _selectedDepartment,
        gender: _selectedGender,
        dateRegistered: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        present: false,
      );

      try {
        await dbHelper.insertStudent(newStudent);
        Navigator.pop(context, true); // Return true to indicate success
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save student: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
