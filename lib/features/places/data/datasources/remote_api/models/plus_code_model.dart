import 'package:json_annotation/json_annotation.dart';

part 'plus_code_model.g.dart';

@JsonSerializable()
class PlusCodeModel {
  PlusCodeModel({
    this.compoundCode,
    this.globalCode,
  });

  String? compoundCode;
  String? globalCode;

  factory PlusCodeModel.fromJson(Map<String, dynamic> json) => _$PlusCodeModelFromJson(json);
  Map<String, dynamic> toJson() => _$PlusCodeModelToJson(this);
}
