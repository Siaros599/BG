import 'dart:convert';

import 'package:http/http.dart' as http;
class Product{
  // "id":1,
  // "title":"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
  // "price":109.95,
  // "description":"Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
  // "category":"men's clothing",
  // "image":"https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
  // "rating":{"rate":3.9,"count":120}
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double rate;
  final int count;

  Product(this.id, this.title, this.price, this.description, this.category, this.image, this.rate, this.count);
  static Future<List<Product>> fetchData() async{
    String url="https://fakestoreapi.com/products";
    var client=http.Client();
    var response=await client.get(Uri.parse(url));
    if (response.statusCode==200){
      print("Load successful");
      var result=response.body;
      var jsonData=jsonDecode(result);
      List<Product> ls=[];
      for (var item in jsonData){
        var id=item['id'];
        var title=item['title'];
        var price=item['price'];
        var description=item['description'];
        var category=item['category'];
        var image=item['image'];
        var rate=item['rating']['rate'];
        var count=item['rating']['count'];
        Product p=new Product(id, title, price, description, category, image, rate, count);
        print(p.id);
        ls.add(p);
      }
      return ls;
    }
    else {
      print("Load failed");
      throw Exception("Loi lay du lieu. Chi tiet: ${response.statusCode}");
    }
  }
}