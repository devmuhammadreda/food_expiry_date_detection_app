import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_expiry_date_detection_app/core/constants/theme/colors_manager.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/scan_log_list_view.dart';
import '../widgets/tools_buttons_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsManager.primary,
          appBar: AppBar(
            title: const Text(
              'Food Expiry Date Detection',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            centerTitle: true,
            backgroundColor: ColorsManager.primary,
          ),
          body: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.sp),
                topRight: Radius.circular(16.sp),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20.0.sp,
              vertical: 20.0.sp,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ToolsButtonsWidget(),
                SizedBox(height: 20.sp),
                Text(
                  "Recent Scans",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.sp),
                Expanded(child: ScanLogListView()),
              ],
            ),
          ),
        );
      },
    );
  }
}
