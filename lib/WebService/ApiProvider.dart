import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:irondot_task/Models/MyModel.dart';

class ApiProvider {
  String api = "http://irondot.com/admin/api/getData";


  List<Model> parse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Model>((json) =>Model.fromApi(json)).toList();
  }

  Future<List> getApi() async {
    var response = await http.get(api);




    if (response.statusCode == 200) {
      return parse(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }

//    List<Model> hotels = List<Model>();
//    decoded['data']?.forEach((value) {
//      hotels.add(Model.fromApi(value));
//    });
//
//    return hotels;
  }
}
