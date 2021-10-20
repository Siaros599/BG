import 'package:flutter/material.dart';
import 'package:layout/Login.dart';

class ReMyApp5 extends StatelessWidget {
  const ReMyApp5({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Register()
    );
  }
}
class Register extends StatefulWidget {
  const Register({ Key? key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var fkey=GlobalKey<FormState>();
  var txtun=TextEditingController();
  var txtpw=TextEditingController();
  var txtpw2=TextEditingController();
  var txtphone=TextEditingController();
  var txtmail=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return MyApp5();
            }));
          }, 
          icon: Icon(Icons.arrow_back,size: 30,color: Colors.white,)
        ),
        title: Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: fkey,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text("Register",style: TextStyle(fontSize: 30,color: Colors.deepOrangeAccent),),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: txtun,
                validator: (value){
                  if(value==null||value.isEmpty)
                    return "Username cannot empty";
                  else
                    return null;
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "Please enter your username",
                  labelText: "Username",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: txtpw,
                validator: (value){
                  if(value==null||value.isEmpty)
                    return "Password cannot empty";
                  else if(value.length<6)
                    return "length minimum of password is 6";
                  else 
                    return null;
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Please enter your password",
                  labelText: "Password",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: txtpw2,
                validator: (value){
                  var pass=txtpw.text;
                  if(value==null||value.isEmpty)
                    return "Password cannot empty";
                  else if(value.length<6)
                    return "Length minimum of password is 6";
                  if(value!=pass)
                    return "Password does not match";
                  else 
                    return null;
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Please re-enter your password",
                  labelText: "Retype password"
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: txtphone,
                validator: (value){
                  RegExp regex=new RegExp(r'^0\d{9}$');
                  if(value==null||value.isEmpty)
                    return "Phone number cannot empty";
                  else if(!regex.hasMatch(value))
                    return "Phone number is invalid";
                  else 
                    return null;
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.phone),
                  hintText: "Please enter your phone number",
                  labelText: "Phone number"
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: txtmail,
                validator: (value){
                  RegExp regExp=new RegExp(r'^\w+@[a-z]+\.com$');
                  if(value==null||value.isEmpty)
                    return "Email cannot empty";
                  else if(!regExp.hasMatch(value))
                    return "Email is invalid";
                  else
                    return null;
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: "Please enter your email",
                  labelText: "Email"
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (fkey.currentState!.validate()) {
                      print("Ok");
                      var alert = AlertDialog(
                        content: Text("Successful"),
                      );
                      showDialog(
                          context: context,
                          builder: (context) {
                            return alert;
                          });
                    } else
                      print("Not OK");
                  },
                  child: Text("Register")),
            ],
          ),
        ),
      ),
    );
  }
}