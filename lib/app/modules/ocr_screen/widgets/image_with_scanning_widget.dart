// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/enums/enums.dart';
import '../../../../core/global/color.dart';
import '../../../../core/global/strings.dart';

class ImageWithScanningWidget extends StatefulWidget {
  const ImageWithScanningWidget({
    super.key,
    this.imagePath,
    required this.isProcessing,
    required this.expiryStatus,
  });
  final String? imagePath;
  final bool isProcessing;
  final ProductExpiryStatus expiryStatus;
  @override
  State<ImageWithScanningWidget> createState() =>
      _ImageWithScanningWidgetState();
}

class _ImageWithScanningWidgetState extends State<ImageWithScanningWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.file(
          File(widget.imagePath!),
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        if (widget.isProcessing)
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0,
                    _animation.value * MediaQuery.of(context).size.height / 2),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 4,
                  child: Container(
                    color: Colors.red.withOpacity(0.7),
                  ),
                ),
              );
            },
          ),
        if (!widget.isProcessing)
          Positioned(
            bottom: 20.sp,
            left: 20.sp,
            right: 20.sp,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                children: [
                  Text(
                    "Product Expiry Date",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 15.0.sp,
                        height: 15.0.sp,
                        decoration: BoxDecoration(
                          color:
                              productExpiryStatusToColor(widget.expiryStatus),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 4.sp),
                      Text(
                        productExpiryStatusToString(widget.expiryStatus),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
