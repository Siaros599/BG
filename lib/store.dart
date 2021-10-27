import 'package:flutter/material.dart';
import 'package:layout/Product.dart';
void main(){
  runApp(StoreApp());
}
class StoreApp extends StatelessWidget {
  const StoreApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Store(),
    );
  }
}
class Store extends StatefulWidget {
  const Store({ Key? key }) : super(key: key);

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  var fkey = GlobalKey<FormState>();
  var txtcount = TextEditingController();
  late Future<List<Product>> lsProduct;
  @override
  void initState(){
    super.initState();
    lsProduct=Product.fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.store),
        title: Text("Products Store"),
      ),
      body: FutureBuilder(
        future: lsProduct,
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if(snapshot.hasData){
            var data=snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (BuildContext context,int index){
                Product p=data[index];
                return ListTile(
                  leading: Text("${p.id}.",style: TextStyle(fontSize: 20,color: Colors.red),),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(p.image),
                      Text(
                        p.title,
                        style: TextStyle(
                          fontSize: 30,color: Colors.blue[900]),
                      ),
                      Text(
                        "- Category: ${p.category}",
                        style: TextStyle(
                          fontSize: 20,color: Colors.black),
                      ),
                      Text(
                        "- Description: ${p.description}",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Text(
                        "- Price: ${p.price}",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Text(
                        "- Rate: ${p.rate} stars",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Text(
                        "- Count: ${p.count}",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                content: Form(
                                  key:fkey,
                                  child: TextFormField(
                                    controller: txtcount,
                                    validator: (value){
                                      RegExp regex = new RegExp(r'\d+$');
                                      if(value==null||value.isEmpty)
                                        return "Cannot empty";
                                      else if (!regex.hasMatch(value))
                                          return "quantity invalid";
                                      else
                                        return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Count to buy: "
                                    ),
                                  )
                                ),
                                actions: [
                                  TextButton(
                                        onPressed: (){
                                            Navigator.pop(context, 'Cancel');
                                        },
                                        child: Text('Cancel'),
                                      ),
                                  ElevatedButton(
                                    onPressed: (){
                                      if(fkey.currentState!.validate())
                                        Navigator.pop(context,'OK');
                                      else print("Not OK");
                                    }, 
                                    child: Text("OK")
                                  ),
                                ],
                              );
                            }
                          );
                        }, 
                        child: Text("Buy")
                      ),
                    ],
                  ),
                );
              },
            );
          }else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}