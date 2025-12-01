import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:equilibrio_mental/theme.dart';
import 'package:equilibrio_mental/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Equilibrio mental',
      debugShowCheckedModeBanner: false, 
      theme: AppTheme.lightTheme, 
      home: const LoginScreen(), 
    );
  }
}