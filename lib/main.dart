import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:class_manager/screens/home_page.dart';
import 'package:class_manager/services/db_helper.dart';

void main() async {
  // Initialize FFI loader if needed
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  WidgetsFlutterBinding.ensureInitialized();

  // Initialize database
  try {
    final dbHelper = DatabaseHelper();
    await dbHelper.database;
    print('Database initialized successfully');
  } catch (e) {
    print('Database initialization failed: $e');
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class Manager',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
