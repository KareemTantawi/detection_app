import 'package:detecition_app/feature/home/data/models/upload_image.dart';
import 'package:hive/hive.dart';
// import 'uploaded_image.dart';

class UploadedImageAdapter extends TypeAdapter<UploadedImage> {
  @override
  final int typeId = 0;

  @override
  UploadedImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UploadedImage(
      path: fields[0] as String,
      uploadedAt: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, UploadedImage obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.path)
      ..writeByte(1)
      ..write(obj.uploadedAt);
  }
}
