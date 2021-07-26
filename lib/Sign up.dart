import 'dart:convert';
import 'package:flutter/material.dart';
import 'welcome.dart';
import 'route.dart'as route;
import 'package:http/http.dart'as http;
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {



  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool submitValid = false;


  final _formKey = GlobalKey<FormState>();
  TextEditingController user = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController mob = TextEditingController();
 /*final _nameFieldController = TextEditingController();
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();
  final _mobileFieldController = TextEditingController();*/

  Future reg() async {
    var url = Uri.parse('http://192.168.100.195/YOUDISH/register1.php');
    var response = await http.post(url, body: {
      "name": user.text,
      "email": email.text,
      "password": pass.text,
      "mobile": mob.text
    });
    var data = json.decode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
          msg: "This User Already Exist!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } else {
      Fluttertoast.showToast(
          msg: "Registration Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Navigator.pushNamed(context, route.home);
    }
  }




  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.indigo,
              Colors.white,
            ],
          )
      ),
      child:Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(Welcome()),
            )
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric( horizontal: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            padding:  EdgeInsets.symmetric(horizontal: 20 ),
                            child: Image.asset(
                              "assets/Untitled-1.png",
                              fit: BoxFit.contain,
                              width: 150,
                            ),
                          ),

                          Container(
                            child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Register',
                                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText: 'name',
                                        prefixIcon: Icon(Icons.person),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8)),
                                      ),
                                      controller: user,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText: 'email',
                                        prefixIcon: Icon(Icons.email),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8)),
                                      ),
                                      controller: email,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        prefixIcon: Icon(Icons.lock),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8)),
                                      ),
                                      controller: pass,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText: 'mobile',
                                        prefixIcon: Icon(Icons.phone),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8)),
                                      ),
                                      controller: mob,
                                    ),
                                  ),
                                ],),),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 20, ),
                            child:ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                                onPrimary: Color(0xff001d37),
                                primary: Colors.indigo,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                ),
                              ),
                              onPressed: () {reg();
                                },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            child:TextButton(
                                child: Text("Already have an account? Sign In",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.black54,
                                  ),
                                ),
                                onPressed: () { Navigator.pushNamed(context,route.signIn);
                                }
                            ),
                          ),
                        ],
                      ),

                    ),
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}
