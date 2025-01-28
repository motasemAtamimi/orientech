import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'get_vacation_info_model.dart';
class ApiController extends ChangeNotifier {
  List<CodeTables>? codeTables;
  Future<void> getVacationInfo() async {
    var dio = Dio();
    var response = await dio.request(
      'http://192.168.0.17:8055/StafflinkServ.svc/GetCodeTablesByType?User_Code=LfgtRtHOQpCuxm0QWmTRM8tgX4CYV8Z5&Code_Type=5& MCode_No=0',
      options: Options(
        method: 'GET',
      ),
    );
    var res = json.encode(response.data);

    if (response.statusCode == 200) {
      // codeTables =await GetCodeTablesByType.fromJson(response.data);
      print(res);
      // print(info!.vacationInfo!.vacationDays);
      notifyListeners();
    }
    else {
      print(response.statusMessage);
    }
  }

}