import 'package:json_annotation/json_annotation.dart';

part 'plus_code_model.g.dart';

@JsonSerializable()
class PlusCode {
  PlusCode({
    this.compoundCode,
    this.globalCode,
  });

  String? compoundCode;
  String? globalCode;

  factory PlusCode.fromJson(Map<String, dynamic> json) => _$PlusCodeFromJson(json);
  Map<String, dynamic> toJson() => _$PlusCodeToJson(this);
}
