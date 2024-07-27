import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_reservation/Models/table_model.dart';

class ApiServices {
  static String apiUrl = "http://192.168.0.68:5220/interview/table/get";
  Future <List<TableModel>> fetchTables()async{
    final Response = await http.get(Uri.parse(apiUrl));

    if (Response.statusCode == 200) {
      List jsonResponse = json.decode(Response.body);
    
       return jsonResponse.map((table) => TableModel.fromJson(table)).toList();
    } else {
      throw Exception("Table loading FAILED !!");
    }
  }
}