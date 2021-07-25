import 'package:hive/hive.dart';

part 'business_status.g.dart';

@HiveType(typeId: 1)
enum BusinessStatus {
  @HiveField(1)
  OPERATIONAL,

  @HiveField(2)
  SUSPENDED
}
