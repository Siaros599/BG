import 'package:flutter/material.dart';
import 'package:layout/Register.dart';


class MyApp5 extends StatelessWidget {
  const MyApp5({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}
class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var fkey=GlobalKey<FormState>();
  var txtun=TextEditingController();
  var txtpw=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Form(
        key: fkey,
        child: Column(
          children: [
            SizedBox(height: 50,),
            Text("Sign In",style: TextStyle(fontSize: 30,color: Colors.deepOrangeAccent),),
            TextFormField(
              controller: txtun,
              validator: (value){
                if (value==null||value.isEmpty)
                  return "User name cannot empty";
                else
                  return null;
              },
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: "Please enter your username",
                labelText: "Username",
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: txtpw,
              validator: (value){
                if(value==null||value.isEmpty)
                  return "Password cannot empty";
                else if (value.length<6)
                  return "length minimum of password is 6";
                else
                  return null;
              },
              decoration: InputDecoration(
                icon: Icon(Icons.lock_open),
                hintText: "Please enter your password",
                labelText: "Password",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: (){
                    if (fkey.currentState!.validate())
                      {
                        print("Ok");
                        var userName=txtun.text;
                        var passWord=txtpw.text;
                        var alert=AlertDialog(
                          content: Text("${userName}, ${passWord}"),
                        );
                        showDialog(
                          context: context,
                          builder: (context){
                          return alert;
                          }
                        );
                      }
                    else print("Not OK");
                  }, 
                  child: Text("Login")
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return ReMyApp5();
                    }));
                  }, 
                  child: Text("Register")
                ),
              ],
            )
          ],
        ), 
      ),
    );
  }
}