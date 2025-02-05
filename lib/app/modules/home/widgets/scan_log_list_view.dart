import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/models/scan_log_model.dart';
import '../controllers/home_controller.dart';
import 'scan_log_widget.dart';

class ScanLogListView extends GetView<HomeController> {
  const ScanLogListView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ScanLogModel>>(
      stream: controller.getScanLogs,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (snapshot.hasData) {
          List<ScanLogModel>? logs = snapshot.data;
          if (logs?.isEmpty ?? true) {
            return const Center(
              child: Text("No logs found"),
            );
          }
          return ListView.separated(
            itemCount: logs?.length ?? 0,
            separatorBuilder: (context, index) {
              return SizedBox(height: 12.sp);
            },
            itemBuilder: (context, index) {
              ScanLogModel? log = logs?[index];
              return ScanLogWidget(log: log);
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
