import 'package:flutter/material.dart';


class LoginInputs extends StatelessWidget {
  const LoginInputs({
     Key? key,
    this.nameFieldController,
    this.emailFieldController,
    this.passwordFieldController,
    this.mobileFieldController,
  }) : super(key: key);
  final nameFieldController;
  final emailFieldController;
  final passwordFieldController;
  final mobileFieldController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          key: Key('name'),
          controller: nameFieldController,
          decoration: InputDecoration(
            labelText: 'Name',
            hintText: 'John smith',
            labelStyle: TextStyle(
              color:Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          cursorColor: Colors.black,
        ),

        TextFormField(
          key: Key('email'),
          controller: emailFieldController,
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'Johnsmith@hfjfhn.com',
            labelStyle: TextStyle(
              color:Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          cursorColor: Colors.black,
        ),
        SizedBox(height: 30,),
        TextFormField(
          key: Key('password'),
          controller: passwordFieldController,
          autocorrect: false,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'SecurePassword',
            labelStyle: TextStyle(
              color:Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            suffixIcon: Icon(
              Icons.visibility,
              color: Colors.black54,
            ),


            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          cursorColor: Colors.black,

        ),
        TextFormField(
          key: Key('mobile'),
          controller: mobileFieldController,
          decoration: InputDecoration(
            labelText: 'Phone Number',
            hintText: '56342241',
            labelStyle: TextStyle(
              color:Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          cursorColor: Colors.black,
        ),
      ],
    );
  }
}
