import 'package:json_annotation/json_annotation.dart';

part 'cars_info.g.dart';

@JsonSerializable()
class CarsInfo {
  @JsonKey(defaultValue: '')
  String number;
  @JsonKey(defaultValue: '')
  String status;
  @JsonKey(defaultValue: '')
  String name;
  @JsonKey(defaultValue: '')
  String returnData;
  @JsonKey(defaultValue: '')
  String remark;

  CarsInfo(
      {required this.number,
      required this.status,
      required this.name,
      required this.returnData,
      required this.remark});

  factory CarsInfo.fromJson(Map<String, dynamic> json) =>
      _$CarsInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CarsInfoToJson(this);
}
