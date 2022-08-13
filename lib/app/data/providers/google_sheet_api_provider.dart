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
    //return result['CarsInfos'];

    //print(index['CarInfos']);

    //   var httpClient = new HttpClient();
    //
    //   var uri = new Uri.http('script.google.com',
    //       '/macros/s/AKfycbzng52r4I71lZ997uYivxhdDKUeZQngqkdmxEk2q2akH5xG1a_XVy6bAWofaVlxd_4G/exec');
    //   var request = await httpClient.getUrl(uri);
    //   var response = await request.close();
    //   var responseBody = await response.transform(utf8.decoder).join();
    //   print('mike ' + responseBody);
    // Response response = await Dio.post(
    // //     "/test", data: {"id": 3, "name": "liuwangshu"})
    // HttpService httpService = HttpService();
    // Response response;
    //
    // response = await httpService.post(
    //     'https://script.google.com/macros/s/AKfycbwYWemEXAwcPNF2hI5J8oQgyo1mgoHYekBpRALi_5Xieu5IX9p1EBkRQ7rvt2HaQ44S_g/exec');
    // print('mike' + response.data.toString());
  }

  Future<Response?> rentCars(
      {required List<String> cars,
      required String name,
      required String currentTime,
      required String returnTime,
      required String remark}) async {
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
      'remark': remark
    };
    return await baseApiProvider?.post(body: body);
  }
}
