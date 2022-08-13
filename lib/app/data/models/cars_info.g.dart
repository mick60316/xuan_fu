// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cars_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarsInfo _$CarsInfoFromJson(Map<String, dynamic> json) => CarsInfo(
      number: json['number'] as String? ?? '',
      status: json['status'] as String? ?? '',
      name: json['name'] as String? ?? '',
      returnData: json['returnData'] as String? ?? '',
      remark: json['remark'] as String? ?? '',
    );

Map<String, dynamic> _$CarsInfoToJson(CarsInfo instance) => <String, dynamic>{
      'number': instance.number,
      'status': instance.status,
      'name': instance.name,
      'returnData': instance.returnData,
      'remark': instance.remark,
    };
