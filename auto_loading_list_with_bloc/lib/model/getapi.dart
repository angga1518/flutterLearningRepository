import 'dart:convert';
import 'package:http/http.dart' as http;


class Post {
  int id;
  String title;
  String body;

  Post({this.body, this.id, this.title});

  factory Post.init(Map<String, dynamic> obj) {
    return Post(body: obj["body"], id: obj["id"], title: obj["title"]);
  }

  static Future<List<Post>> getData(int start, int limit) async{
    String url = "https://jsonplaceholder.typicode.com/posts?start="+start.toString()+"&_limit="+limit.toString()+"";
    var hasilHttp = await http.get(url);
    var jsonhasilhttp = json.decode(hasilHttp.body);
    
    
    List<dynamic> mapObj = jsonhasilhttp as List<dynamic>;
    List<Post> listPost = [];
    for (var obj in mapObj) {
      listPost.add(Post.init(obj as Map<String, dynamic>));
    }

    return listPost;
  } 


}


