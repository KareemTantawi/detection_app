import 'package:hive/hive.dart';

// part 'uploaded_image.g.dart';

@HiveType(typeId: 0)
class UploadedImage extends HiveObject {
  @HiveField(0)
  final String path;

  @HiveField(1)
  final DateTime uploadedAt;

  UploadedImage({
    required this.path,
    required this.uploadedAt,
  });
}
