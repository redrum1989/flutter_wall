import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wall/Model/UserData.dart';

class Database{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final CollectionReference userInfo = FirebaseFirestore.instance.collection("User Info");

  Future register(BuildContext context, UserData user) async {
    try{
      await firebaseAuth.createUserWithEmailAndPassword(email: user.email, password: user.password);
      User firebaseUser = FirebaseAuth.instance.currentUser;
      await userInfo.doc(firebaseUser.uid).set(user.returnUserData());
    } catch (e){
      return showDialog(context: context, builder: (context){
        return AlertDialog(content: Text(e.toString()));
      });
    }
    
  }
}