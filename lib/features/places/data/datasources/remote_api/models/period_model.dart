import 'package:equatable/equatable.dart';

import 'open_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'period_model.g.dart';

@JsonSerializable()
class Period extends Equatable {
  final OpenModel? open;

  const Period({this.open});

  factory Period.fromJson(Map<String, dynamic> json) => _$PeriodFromJson(json);

  Map<String, dynamic> toJson() => _$PeriodToJson(this);

  @override
  List<Object?> get props => [open];
}
