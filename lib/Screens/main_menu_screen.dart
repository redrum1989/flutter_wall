import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_wall/Services/AuthenticationService.dart';
import 'package:provider/provider.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({ Key key }) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {

  User userInfo;

  @override
  Widget build(BuildContext context) {
    userInfo = context.watch<User>();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection("User Info").doc(userInfo.uid).snapshots(),
                builder: (context, snapshot) {
                  if(snapshot.data == null){
                    return CircularProgressIndicator();
                  } else {
                    return Column(
                      children: [
                        Text(snapshot.data['name']),
                        Text(snapshot.data['id']),
                        Text(snapshot.data['gender']),
                        Text(snapshot.data['birthdate']),
                      ]
                    );
                  }
                }
              ),
              ElevatedButton(
                onPressed: (){
                  context.read<AuthenticationService>().signOut().then((String msg){
                    Phoenix.rebirth(context);
                  });
                },
                child: Text("Logout")
              ),
            ],
          ),
        ),
      ),
    );
  }
}