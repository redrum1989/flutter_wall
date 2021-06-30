import 'package:flutter/material.dart';
import 'package:flutter_wall/Model/UserData.dart';
import 'package:flutter_wall/Screens/initial_screen.dart';
import 'package:flutter_wall/Services/Database.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key key }) : super(key: key);

  static const routeName = "/register";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController _emailTextController = new TextEditingController();
  TextEditingController _pwTextController = new TextEditingController();
  TextEditingController _idTextController = new TextEditingController();
  TextEditingController _genderTextController = new TextEditingController();
  TextEditingController _nameTextController = new TextEditingController();
  TextEditingController _birthdateTextController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Center(child: Text("Email")),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: TextFormField(
                controller: _emailTextController,
              ),
            ),
            Center(child: Text("Password")),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: TextFormField(
                controller: _pwTextController,
                obscureText: true,
              ),
            ),
            Center(child: Text("Name")),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: TextFormField(
                controller: _nameTextController,
              ),
            ),
            Center(child: Text("ID")),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: TextFormField(
                controller: _idTextController,
              ),
            ),
            Center(child: Text("Gender")),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: TextFormField(
                controller: _genderTextController,
              ),
            ),
            Center(child: Text("Birthdate")),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: TextFormField(
                controller: _birthdateTextController,
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed:() async {
                    UserData user = new UserData(
                      email: _emailTextController.text,
                      password: _pwTextController.text,
                      id: _idTextController.text,
                      gender: _genderTextController.text,
                      birthdate: _birthdateTextController.text,
                      name: _nameTextController.text,
                    );
                    await Database().register(context, user);
                    Navigator.of(context).popUntil(ModalRoute.withName(InitialScreen.routeName));
                  },
                  child: Text("Register"),
                ),
                ElevatedButton(
                  onPressed:(){
                    Navigator.of(context).pop();
                  },
                  child: Text("Back"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}