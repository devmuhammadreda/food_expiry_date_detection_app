// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_expiry_date_detection_app/app/widgets/network_image.dart';
import 'package:get/get.dart';

import '../../../../core/enums/enums.dart';
import '../../../data/models/scan_log_model.dart';
import '../controllers/home_controller.dart';

class ScanLogWidget extends GetView<HomeController> {
  const ScanLogWidget({
    super.key,
    this.log,
  });
  final ScanLogModel? log;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (log?.scanType == ScanType.barcodeScan) {
          controller.getAndGoProductDetails(log?.barcode ?? "");
        }
      },
      child: Container(
        width: context.width,
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 12.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            AppCashedImage(
              imageUrl: log?.imageUrl ?? "",
              width: 60.0.sp,
              height: 60.0.sp,
              radius: 4.r,
            ),
            SizedBox(width: 12.sp),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    log?.productName ?? "",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.sp),
                  Row(
                    children: [
                      Text(
                        "Expiry Date: ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          log?.expiryDate?.isEmpty ?? false
                              ? "not available"
                              : log?.expiryDate ?? "",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.sp),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 15.0.sp,
                        height: 15.0.sp,
                        decoration: BoxDecoration(
                          color: productExpiryStatusToColor(
                              log?.expiryStatus ?? ProductExpiryStatus.unknown),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 4.sp),
                      Expanded(
                        child: Text(
                          productExpiryStatusToString(
                              log?.expiryStatus ?? ProductExpiryStatus.unknown),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.sp),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/scan.svg",
                        width: 16.sp,
                      ),
                      SizedBox(width: 4.sp),
                      Expanded(
                        child: Text(
                          getScanTypeAsString(
                              log?.scanType ?? ScanType.detectImage),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
