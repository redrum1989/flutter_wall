import 'package:flutter/material.dart';
import 'package:flutter_wall/Screens/register_screen.dart';

import 'login_screen.dart';

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
                      Navigator.of(context).pushNamed(RegisterScreen.routeName);
                    },
                    child: Text("Register"),
                  ),
                ],
              ),

              
             
            ],
          ),
        ),
      ),
    );
  }
}
