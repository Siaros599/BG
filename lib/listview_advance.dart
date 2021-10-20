
import 'package:flutter/material.dart';
import 'package:layout/photo.dart';

class MyApp4 extends StatelessWidget {
  const MyApp4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListViewAdvance(),
    );
  }
}
class ListViewAdvance extends StatefulWidget {
  const ListViewAdvance({ Key? key }) : super(key: key);

  @override
  _ListViewAdvanceState createState() => _ListViewAdvanceState();
}

class _ListViewAdvanceState extends State<ListViewAdvance> {
  late Future<List<Photo>> lsPhoto;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lsPhoto=Photo.fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listview Nang cao"),
      ),
      body: FutureBuilder(
        future: lsPhoto, 
        builder: (BuildContext context, AsyncSnapshot<List<Photo>> snapshot) {
          if (snapshot.hasData){
            var data=snapshot.data;
            return ListView.builder(
              itemCount: data!.length, 
              itemBuilder: (BuildContext context, int index) {
                Photo p=data[index];
                return ListTile(
                  leading: Image.network(p.thumbnailUrl),
                  title: Text(p.title),
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