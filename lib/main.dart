// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'DataBase/database_helper.dart';
import 'view/HomeScreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Restaurant Reservation',
   
      home: HomeScreen(),
    );
  }
}
