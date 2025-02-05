import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget imagePickAlert({
  void Function()? onCameraPressed,
  void Function()? onGalleryPressed,
}) {
  return Material(
    color: Colors.transparent,
    child: CupertinoAlertDialog(
      title: const Text(
        "Pick a source:",
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text(
              "Camera",
            ),
            onTap: onCameraPressed,
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text(
              "Gallery",
            ),
            onTap: onGalleryPressed,
          ),
        ],
      ),
    ),
  );
}
