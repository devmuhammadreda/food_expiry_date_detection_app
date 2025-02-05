import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'scan_button.dart';

class ToolsButtonsWidget extends GetView<HomeController> {
  const ToolsButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ScanButton(
            title: "Scan Image",
            onPressed: () {
              Get.toNamed(Routes.OCR_SCREEN);
            },
          ),
        ),
        SizedBox(width: 20.sp),
        Expanded(
          child: ScanButton(
            title: "Scan Barcode",
            onPressed: () async {
              await controller.scanProductBarcode();
            },
          ),
        ),
      ],
    );
  }
}
