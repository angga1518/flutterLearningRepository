import 'dart:convert';
import 'package:http/http.dart' as http;

class ConnectAPI {
  String name;
  String job;
  String id;
  String timeCreated;

  ConnectAPI({this.id, this.job, this.name, this.timeCreated});

  factory ConnectAPI.createPostResult(Map<String, dynamic> data) {
    return ConnectAPI(
        id: data['id'],
        job: data['job'],
        name: data['name'],
        timeCreated: data['createdAt']);
  }

  static Future<ConnectAPI> postData(String name, String job)async{
    String urlApi = "https://reqres.in/api/users";
    var postResult = await http.post(urlApi, body: {"name": name, "job": job});
    var jsonObject = json.decode(postResult.body);
    return ConnectAPI.createPostResult(jsonObject); 
  }
}
