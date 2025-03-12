import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/drink_tracker_provider.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => DrinkTrackerProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainScreen(),
    );
  }
}

