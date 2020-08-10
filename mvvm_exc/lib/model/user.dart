import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String id;
  String email;
  String name;

  User({this.id, this.email, this.name});

  factory User.dataInit(Map<String, dynamic> object) {
    return User(
        email: object['email'],
        id: object['id'].toString(),
        name: object['first_name'] + object['last_name']);
  }

  static Future<User> getData(int id) async {
    String apiURL = "https://reqres.in/api/users/" + id.toString();
    var hasilHttp = await http.get(apiURL);
    var jsonHasilHttp = json.decode(hasilHttp.body);

    var isiData = (jsonHasilHttp as Map<String, dynamic>)['data'];
    User hasil = User.dataInit(isiData as Map<String,dynamic>);
    return hasil;
  }

  String toString() {
    return "id: " + id + " email: " + email + " name: " + name;
  }
  
}

class UninitializedUser extends User {}
