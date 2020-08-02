import 'dart:convert';
import 'package:http/http.dart' as http;

class GetAPI {
  String id;
  String email;
  String name;

  GetAPI({this.id, this.email, this.name});

  factory GetAPI.dataInit(Map<String, dynamic> object) {
    return GetAPI(
        email: object['email'],
        id: object['id'].toString(),
        name: object['first_name'] + object['last_name']);
  }

  static Future<List<GetAPI>> getData(String page) async{
    String apiURL = "https://reqres.in/api/users?page="+page;
    var hasilHttp = await http.get(apiURL);
    var jsonHasilHttp = json.decode(hasilHttp.body);

    List<dynamic> isiData = (jsonHasilHttp as Map<String, dynamic>)['data'];
    List<GetAPI> listGetAPI = [];
    for (var x in isiData) {
      listGetAPI.add(GetAPI.dataInit(x as Map<String,dynamic>));
    }

    return listGetAPI;
  }
  String toString(){
    return "id: "+id+" email: "+email+" name: "+name;
  }
}
