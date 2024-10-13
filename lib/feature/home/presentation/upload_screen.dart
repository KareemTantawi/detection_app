// lib/upload_screen.dart

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../data/models/upload_image.dart';
// Adjust the path as necessary
import 'image_view_screen.dart'; // Adjust the path as necessary

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final ImagePicker _picker = ImagePicker();
  late Box<UploadedImage> _imageBox;

  @override
  void initState() {
    super.initState();
    _imageBox = Hive.box<UploadedImage>('uploaded_images');
  }

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        // Get the app's documents directory
        final appDir = await getApplicationDocumentsDirectory();

        // Create a unique file name
        final fileName = path.basename(pickedFile.path);

        // Copy the file to the app directory
        final savedImage =
            await File(pickedFile.path).copy('${appDir.path}/$fileName');

        final uploadedImage =
            UploadedImage(path: savedImage.path, uploadedAt: DateTime.now());

        await _imageBox.add(uploadedImage);

        setState(() {
          // Update UI
        });
      }
    } catch (e) {
      // Handle any errors
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error picking image: $e')));
    }
  }

  Future<void> _deleteImage(int index) async {
    try {
      // Retrieve the image to delete its file
      UploadedImage? imageToDelete = _imageBox.getAt(index);
      if (imageToDelete != null) {
        final file = File(imageToDelete.path);
        if (await file.exists()) {
          await file.delete();
        }
      }

      await _imageBox.deleteAt(index);
      setState(() {
        // Update UI
        // _imageBox.deleteAt(index);
      });
    } catch (e) {
      // Handle deletion errors
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error deleting image: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('Upload Images'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _pickImage,
          child: const Icon(Icons.add_a_photo),
        ),
        body: ValueListenableBuilder(
          valueListenable: _imageBox.listenable(),
          builder: (context, Box<UploadedImage> box, _) {
            if (box.values.isEmpty) {
              return const Center(
                child: Text(
                  'No images uploaded.',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.pink),
                ),
              );
            }

            return GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemCount: box.length,
              itemBuilder: (context, index) {
                UploadedImage? uploadedImage = box.getAt(index);

                if (uploadedImage == null) {
                  return const SizedBox.shrink();
                }

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ImageViewScreen(uploadedImage: uploadedImage),
                      ),
                    );
                  },
                  onLongPress: () => _deleteImage(index),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.file(
                          File(uploadedImage.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          color: Colors.black54,
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
        ));
  }
}
