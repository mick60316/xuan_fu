import 'dart:io';
import 'dart:convert' show jsonEncode, utf8;
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:xuan_fu/app/data/models/cars_info.dart';

import 'base_api_provider.dart';

class GoogleSheetApiProvider {
  BaseApiProvider? baseApiProvider;
  GoogleSheetApiProvider() {
    baseApiProvider = BaseApiProvider();
  }
  Future<List<CarsInfo>> getAllCarsInfo() async {
    Response? response = await baseApiProvider?.get();
    Map<String, dynamic> result = response?.data;
    List<CarsInfo> CarsInfos = <CarsInfo>[];
    List index = result['CarInfos'];
    index.forEach((element) {
      print(element);
      CarsInfos.add(CarsInfo.fromJson(element));
    });
    return CarsInfos;
  }

  Future<Response?> returnCars({required List<String> cars}) async {
    String carsString = "";
    cars.forEach((element) {
      carsString += element + ',';
    });
    var body = {
      'action': 'return',
      'cars': carsString,
    };
    return await baseApiProvider?.post(body: body);
  }

  Future<Response?> rentCars(
      {required List<String> cars,
      required String name,
      required String currentTime,
      required String returnTime,
      required String remark,
      required String money}) async {
    String carsString = "";
    cars.forEach((element) {
      carsString += element + ',';
    });

    var body = {
      'action': 'rent',
      'cars': carsString,
      'name': name,
      'currentTime': currentTime,
      'returnTime': returnTime,
      'remark': remark,
      'money': money
    };
    return await baseApiProvider?.post(body: body);
  }
}
