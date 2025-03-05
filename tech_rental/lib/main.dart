import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tech_rental/app/app.dart';
import 'package:tech_rental/app/di/di.dart';
import 'package:tech_rental/core/network/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Hive Database
  await HiveService.init();

  // Delete all the hive data and boxes
  // await HiveService().clearAll();
  // Initialize Dependencies
  await initDependencies();
  await SharedPreferences.getInstance(); // Init once

  runApp(
    const App(),
  );
}
