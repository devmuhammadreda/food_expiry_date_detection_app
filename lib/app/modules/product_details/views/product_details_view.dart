import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_expiry_date_detection_app/app/widgets/network_image.dart';

import 'package:get/get.dart';

import '../../../../core/enums/enums.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.product?.product?.productName ?? ""),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AppCashedImage(
                  imageUrl: controller.product?.product?.imageUrl ?? "",
                  height: 100.sp,
                  width: 100.sp,
                ),
                SizedBox(width: 20.sp),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.product?.product?.productName ?? "",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.sp),
                      Text(
                        controller.product?.product?.brands ?? "",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 4.sp),
                      Text(
                        controller.product?.product?.productType ?? "",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 4.sp),
                      Row(
                        children: [
                          Text(
                            "Expiry Date: ",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              controller.product?.product?.expirationDate
                                          ?.isEmpty ??
                                      false
                                  ? "not available"
                                  : controller
                                          .product?.product?.expirationDate ??
                                      "",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
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
                                  controller.expiryStatus ??
                                      ProductExpiryStatus.unknown),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 4.sp),
                          Expanded(
                            child: Text(
                              productExpiryStatusToString(
                                  controller.expiryStatus ??
                                      ProductExpiryStatus.unknown),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
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
            SizedBox(height: 20.sp),
            Text(
              controller.product?.product?.categories ?? "",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.sp),
            Text(
              controller
                      .product?.product?.categoryProperties?.ciqualFoodNameEn ??
                  "",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              controller.product?.product?.productName ?? "",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              controller.product?.product?.purchasePlaces ?? "",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
