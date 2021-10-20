

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class ReMyApp2 extends StatelessWidget {
  const ReMyApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello world",
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Đăng nhập",style: TextStyle(fontSize: 20,color: Colors.blueAccent),),
                IconButton(onPressed: (){}, icon: Icon(Icons.settings,size: 30,color: Colors.black,))
              ]
            )
          ),
          leading: Icon(Icons.account_box,size: 30,color: Colors.indigo,),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Username:",style: TextStyle(fontSize: 18,color: Colors.indigo,),textAlign: TextAlign.left,),
              SizedBox(
                width: 300,
                height: 30,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    //hintText: "Your username",
                  ),
                ),
              ),
              Text("Password:",style: TextStyle(fontSize: 18,color: Colors.tealAccent[700],),textAlign: TextAlign.left,),
              SizedBox(
                width: 300,
                height: 30,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    //hintText: "Your username",
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.amber,
          child: Container(
            height: 60,
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueAccent)),onPressed: (){}, child: Text("Đăng nhập",style: TextStyle(fontSize: 20,color:Colors.white))),
                TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red[900])),onPressed: (){}, child: Text("Đăng ký",style: TextStyle(fontSize: 20,color:Colors.white))),
              
              ],
            )
          ),
        ),
    );
  }
}

