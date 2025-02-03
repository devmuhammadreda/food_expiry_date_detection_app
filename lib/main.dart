import 'package:flutter/material.dart';
import 'package:food_expiry_date_detection_app/app.dart';

import 'app/data/data_source/scan_log_local_data_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScanLogLocalDataSource().init();
  runApp(const MyApp());
}
