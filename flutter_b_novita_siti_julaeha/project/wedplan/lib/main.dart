import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedplan/view_model/checklist_manager.dart';
import 'package:wedplan/views/splash_screen.dart';
import 'package:wedplan/view_model/db_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DbManager(),
        ),
        ChangeNotifierProvider(
          create: (context) => DbManagerChecklist(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
