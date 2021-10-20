//Bg2:Material design
import 'package:flutter/material.dart';

class MyApp2 extends StatelessWidget {
  const MyApp2({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello world",
      home: HomePage() ,
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
int count=0;
String g="Hello";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //thanh tieu de
      appBar: AppBar(
        title: Text("Trang chu",style: TextStyle(fontSize: 20,color: Colors.red),),
        leading: Icon(Icons.home,size: 30,),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              g = "Good morning";
            });            
          }, icon: Icon(Icons.add_alert))
        ],
      ),
      body: Center(child: Text("$g: $count",style: TextStyle(fontSize: 30)),
      ),
      bottomNavigationBar: BottomAppBar(
        shape:CircularNotchedRectangle(),
        color: Colors.blue,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.call,size: 40,color: Colors.white)),
              IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.place, size: 40, color: Colors.white)),
            ],
        ),
      )
    ),
    floatingActionButton: FloatingActionButton(onPressed: (){
      setState(() {
        count++;
        //print(count);
      });
      
    },
      child: Icon(Icons.add), backgroundColor: Colors.red,foregroundColor: Colors.white,
     
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
