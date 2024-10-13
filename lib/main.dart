import 'package:detecition_app/core/routes/app_route.dart';
import 'package:detecition_app/detection_app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'feature/home/data/models/upload_image.dart';
import 'feature/home/data/models/uploaded_image_adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register the adapter
  Hive.registerAdapter(UploadedImageAdapter());

  // Open the box
  await Hive.openBox<UploadedImage>('uploaded_images');
  runApp(
    DetectionApp(
      appRouter: AppRouter(),
    ),
  );
}
