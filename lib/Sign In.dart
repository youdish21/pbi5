import 'package:flutter/material.dart';
import 'route.dart'as route;
import 'welcome.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  Future log() async{
    var url = Uri.parse('http://192.168.100.195/YOUDISH/signin.php');
    var response = await http.post(url, body: {
      "email": email.text,
      "password": pass.text,
    });
    var data = json.decode(response.body);
    if (data == "Success") {
      Fluttertoast.showToast(
          msg: "Login Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Navigator.pushNamed(context, route.home);
    } else {
      Fluttertoast.showToast(
          msg: "Incorrect Please Try Again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
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
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding:  EdgeInsets.symmetric(horizontal: 20 ),
                  child: Image.asset(
                    "assets/Untitled-1.png",
                    fit: BoxFit.contain,
                    width: 250,
                  ),
                ),

                Container(
                  padding:  EdgeInsets.symmetric(horizontal: 20 ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          /*child: LoginInputs(
                            emailFieldController: _emailFieldController,
                            passwordFieldController: _passwordFieldController,
                          ),*/
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
                            ],
                          ),


                        ),
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
                            onPressed: () {log();},
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child:TextButton(
                              child: Text("Forgot password?",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
                              ),
                              onPressed: () {}
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(vertical: 1.0, ),
                          child:TextButton(
                              child: Text("Don't have an account? Sign Up",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context,route.signUp);
                              }
                          ),
                        ),


                      ],
                    ),


                  ) ,

                ),
              ],
            ),

          ),

        ),
      ),
    );
  }
}
