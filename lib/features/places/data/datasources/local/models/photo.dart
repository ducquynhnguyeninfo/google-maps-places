import 'package:hive/hive.dart';

part 'photo.g.dart';

@HiveType(typeId: 5)
class PhotoModel {
  PhotoModel({
    this.htmlAttributions,
    this.photoReference,
    this.height,
    this.width,
  });

  @HiveField(1)
  List<String>? htmlAttributions;
  @HiveField(2)
  String? photoReference;
  @HiveField(3)
  int? height;
  @HiveField(4)
  int? width;
}
