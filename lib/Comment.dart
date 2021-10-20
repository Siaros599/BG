import 'dart:convert';

import 'package:http/http.dart' as http;
class Comment{
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Comment(this.postId, this.id, this.name, this.email, this.body);
  static Future<List<Comment>> fetchData() async{
    String url="https://jsonplaceholder.typicode.com/comments";
    var client=http.Client();
    var response=await client.get(Uri.parse(url));
    if(response.statusCode==200){
      print("Load successful");
      var result=response.body;
      var jsonData=jsonDecode(result);
      List<Comment> ls=[];
      for (var item in jsonData){
        var postId=item['postId'];
        var id=item['id'];
        var name=item['name'];
        var email=item['email'];
        var body=item['body'];
        Comment cm=new Comment(postId, id, name, email, body);
        print(cm.email);
        ls.add(cm);
      }
      return ls;
    } else{
      print("Load Failed");
      throw Exception("Loi lay du lieu : ${response.statusCode}");
    }
  }
}