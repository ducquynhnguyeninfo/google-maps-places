import 'package:hive/hive.dart';

part 'plus_code.g.dart';
@HiveType(typeId: 7)
class PlusCodeModel {
  PlusCodeModel({
    this.compoundCode,
    this.globalCode,
  });

  @HiveField(1)
  String? compoundCode;
  @HiveField(2)
  String? globalCode;

}
