import 'package:flutter/material.dart';
import 'package:flutter_wall/Screens/choose_screen.dart';
import 'package:flutter_wall/Screens/login_screen.dart';
import 'package:flutter_wall/Screens/student_register_screen.dart';
import 'package:flutter_wall/Services/AuthenticationService.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({ Key key }) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("hello people"),

              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed:(){
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    },
                    child: Text("Login"),
                  ),
                  ElevatedButton(
                    onPressed:(){
                      
                      Navigator.of(context).pushNamed(ChooseScreen.routeName);
                    },
                    child: Text("Register"),
                  ),
                ],
              ),

              ElevatedButton(
                onPressed:(){
                  context.read<AuthenticationService>().signInAnon();
                },
                child: Text("Continue as Guest"),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
