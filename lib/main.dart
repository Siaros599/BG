import 'package:flutter/material.dart';
import 'package:layout/listview_advance.dart';
import 'package:layout/listviewbasic.dart';
import 'package:layout/myapp2.dart';
import 'package:layout/reListViewAdvance.dart';
import 'package:layout/remyapp2.dart';
import 'package:layout/store.dart';
import 'package:layout/test.dart';
import 'Login.dart';
void main() {
  runApp(StoreApp());
}
//BG1: Layout
class MyApp extends StatelessWidget {
  const MyApp() : super();
  Widget createColumn(String data, IconData icon, Color color) {
    double size = 25;
    return Column(
      children: [
        Icon(
          icon,
          textDirection: TextDirection.ltr,
          size: size,
          color: color,
        ),
        Text(data,
            textDirection: TextDirection.ltr,
            style: TextStyle(color: color, fontSize: size))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      padding: EdgeInsets.all(50),
      child: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.yellow,
                //borderRadius: BorderRadius.all(Radius.circular(5.0))),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              padding: EdgeInsets.all(20),
              width: 5000,
              height: 500,
              child: Text(
                "Hello world",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              height: 60,
              child: Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  createColumn("Message", Icons.message, Colors.greenAccent),
                  createColumn("Call", Icons.call, Colors.blueAccent),
                  createColumn("Store", Icons.store, Colors.lightBlueAccent),
                  createColumn("Settings", Icons.settings, Colors.cyan)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//BG2: material design