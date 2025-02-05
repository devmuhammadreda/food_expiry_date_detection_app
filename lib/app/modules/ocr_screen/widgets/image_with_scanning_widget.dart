// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';

class ImageWithScanningWidget extends StatefulWidget {
  const ImageWithScanningWidget({
    super.key,
    this.imagePath,
    required this.isProcessing,
  });
  final String? imagePath;
  final bool isProcessing;
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
          height: MediaQuery.of(context).size.height / 2,
        ),
        if (widget.isProcessing)
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _animation.value * 200 - 100),
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
      ],
    );
  }
}
