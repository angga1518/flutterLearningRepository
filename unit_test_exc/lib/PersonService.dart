
import 'dart:convert';

import 'package:unit_test_exc/Person.dart';
import 'package:http/http.dart' as http;

class PersonService {

  static Future<Person> getPersonbyId(String id, http.Client client) async{
    String url = ".../person/"+ id;
    var response = await client.get(url);
    
    if(response.statusCode != 200){
      throw Exception("error bro");
    }
    
    var json = jsonDecode(response.body);
    return Person.fromJson(json);
  }

  
}