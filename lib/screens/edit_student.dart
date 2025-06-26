import 'package:flutter/material.dart';
import 'package:class_manager/models/student.dart';
import 'package:class_manager/services/db_helper.dart';
import 'package:class_manager/utils/validators.dart';

class EditStudentPage extends StatefulWidget {
  final Student student;

  const EditStudentPage({Key? key, required this.student}) : super(key: key);

  @override
  _EditStudentPageState createState() => _EditStudentPageState();
}

class _EditStudentPageState extends State<EditStudentPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late String _selectedClass;
  late String _selectedDepartment;
  late String _selectedGender;
  final dbHelper = DatabaseHelper;

  final List<String> classes = ['Class A', 'Class B', 'Class C', 'Class D'];
  final List<String> departments = ['CS', 'IT', 'ECE', 'EEE', 'MECH'];
  final List<String> genders = ['Male', 'Female', 'Other'];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.student.name);
    _emailController = TextEditingController(text: widget.student.email);
    _phoneController = TextEditingController(text: widget.student.phone);
    _selectedClass = widget.student.className;
    _selectedDepartment = widget.student.department;
    _selectedGender = widget.student.gender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Student')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: Validators.validateName,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.validateEmail,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: 'Phone'),
                  keyboardType: TextInputType.phone,
                  validator: Validators.validatePhone,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedClass,
                  items: classes.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedClass = value!;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'Class'),
                  validator: Validators.validateDropdown,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedDepartment,
                  items: departments.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedDepartment = value!;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'Department'),
                  validator: Validators.validateDropdown,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  items: genders.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'Gender'),
                  validator: Validators.validateDropdown,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final updatedStudent = Student(
                        id: widget.student.id,
                        name: _nameController.text,
                        email: _emailController.text,
                        phone: _phoneController.text,
                        className: _selectedClass,
                        department: _selectedDepartment,
                        gender: _selectedGender,
                        dateRegistered: widget.student.dateRegistered,
                        present: widget.student.present,
                      );

                      await dbHelper.updateStudent(updatedStudent);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Update Student'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}

extension on Type {
  Future<void> updateStudent(Student updatedStudent) async {}
}
