import 'package:flutter/material.dart';
import 'package:layout/Comment.dart';

class ReMyApp4 extends StatelessWidget {
  const ReMyApp4({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReListViewAdvance(),
    );
  }
}
class ReListViewAdvance extends StatefulWidget {
  const ReListViewAdvance({ Key? key }) : super(key: key);

  @override
  _ReListViewAdvanceState createState() => _ReListViewAdvanceState();
}

class _ReListViewAdvanceState extends State<ReListViewAdvance> {
  late Future<List<Comment>> lsComment;
  @override
  void initState(){
    super.initState();
    lsComment=Comment.fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        leading: Icon(Icons.chat, size: 30,color: Colors.blueAccent),
        title: Text("Danh Sach Comment",style: TextStyle(color: Colors.blueAccent,fontSize: 30),),
      ),
      body: FutureBuilder(
        future: lsComment,
        builder: (BuildContext context,AsyncSnapshot<List<Comment>> snapshot){
          if(snapshot.hasData){
            var data=snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (BuildContext context,int index){
                Comment cm=data[index];
                return ListTile(
                  leading: Text("${index}.",style: TextStyle(fontSize: 20,color: Colors.red),),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                            cm.email,
                            style: TextStyle(
                                fontSize: 20, color: Colors.orangeAccent),
                          ),
                      Text(
                            cm.body,
                            style: TextStyle(
                                fontSize: 20, color: Colors.black)
                          ),
                    ]
                  ),
                );
              }
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue[900],
        child: Container(
          height: 50 ,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.favorite,size: 30,color: Colors.white,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.reply,size: 30,color: Colors.white,))
            ],
          )
        ),
      ),
    );
  }
}