import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_expiry_date_detection_app/app/widgets/progress_button.dart';
import 'package:get/get.dart';
import '../../../data/models/scan_log_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Food Expiry Date Detection'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppProgressButton(
                  onPressed: (anim) {},
                  text: "Scan Image",
                ),
                SizedBox(height: 20.sp),
                AppProgressButton(
                  onPressed: (anim) async {
                    await controller.scanProductBarcode();
                  },
                  text: "Scan Barcode",
                ),
                SizedBox(height: 20.sp),
                Text(
                  "Recent Scans",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.sp),
                StreamBuilder<List<ScanLogModel>>(
                  stream: controller.getScanLogs,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                    if (snapshot.hasData) {
                      List<ScanLogModel>? logs = snapshot.data;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: logs?.length,
                        itemBuilder: (context, index) {
                          ScanLogModel? log = logs?[index];
                          return ListTile(
                            title: Text(log?.productName ?? ''),
                            subtitle: Text(log?.expiryDate ?? " "),
                          );
                        },
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
