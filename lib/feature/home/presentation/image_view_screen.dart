// lib/image_view_screen.dart

import 'dart:io';

import 'package:flutter/material.dart';

import '../data/models/upload_image.dart';
// import 'data/models/upload_image.dart'; // Adjust the path as necessary

class ImageViewScreen extends StatelessWidget {
  final UploadedImage uploadedImage;

  const ImageViewScreen({Key? key, required this.uploadedImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Image View'),
      ),
      body: Center(
        child: Image.file(
          File(uploadedImage.path),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
