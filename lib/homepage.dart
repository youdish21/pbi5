import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'route.dart'as route;
import 'package:http/http.dart'as http;
import 'package:fluttertoast/fluttertoast.dart';

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController user = TextEditingController();
  TextEditingController mob = TextEditingController();
  Future req() async {
    var url = Uri.parse('http://192.168.100.195/YOUDISH/dash.php');
    var response = await http.post(url, body: {
      "name": user.text,
      "mobile": mob.text
    });
    var data = json.decode(response.body);
    if (data =="Successful") {
      Fluttertoast.showToast(
          msg: "Request Sent Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } else {
      Fluttertoast.showToast(
          msg: "Request not sent try again",
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
          leading: PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(child: TextButton.icon(onPressed: null, icon: Icon(Icons.add_call), label: Text("Contact"))),
              PopupMenuItem(child: TextButton.icon(
                  icon: Icon(Icons.arrow_back),
                  label:Text("Back"),
                  onPressed:(){ Navigator.pushNamed(context, route.signIn);
                  }
              ),
              ),
            ],
          ),
          actions: [
            TextButton.icon(
              icon: Icon(Icons.logout),
              label:Text("Sign out"),
              onPressed:() async{
                Navigator.pushNamed(context, route.wel);
              },
            ),
          ],
        ),
        body: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 00),
                          child: Image.asset(
                            "assets/Untitled-1.png",
                            fit: BoxFit.contain,
                            width: 170,
                          ),
                        ),
                        Container(
                          child: Column(
                              children: <Widget>[
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
                                      labelText: 'phone',
                                      prefixIcon: Icon(Icons.phone),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8)),
                                    ),
                                    controller: mob,
                                  ),
                                ),
                              ],
                          ),
                        ),

                        Container(
                          width: 200.0,
                          height: 200.0,
                          child:ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                onPrimary: Color(0xff001d37),
                                primary: Colors.indigo,
                                shape: CircleBorder(),
                              ),

                              child:Stack(
                                children:<Widget> [
                                  Center(child: Align(
                                    alignment: FractionalOffset.topCenter,
                                    child:Icon(
                                      Icons.directions_bus,
                                      size: 120,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ),
                                  Center(child: Align(
                                    alignment: FractionalOffset(0.5,0.7),
                                    child: Text("Click Here",
                                      style: TextStyle(fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  ),
                                ],
                              ),
                              onPressed: () { req();},
                          ),

                        ),

                      ],
                    ),



                  ),


                );
              }
            }
        ),
      ),
    );
  }
}