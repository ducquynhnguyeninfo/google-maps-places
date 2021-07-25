import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'open_model.g.dart';

@JsonSerializable()
class OpenModel extends Equatable {
  final int? day;
  final String? time;

  const OpenModel({this.day, this.time});

  factory OpenModel.fromJson(Map<String, dynamic> json) =>
      _$OpenModelFromJson(json);

  Map<String, dynamic> toJson() => _$OpenModelToJson(this);

  @override
  List<Object?> get props => [day, time];
}
