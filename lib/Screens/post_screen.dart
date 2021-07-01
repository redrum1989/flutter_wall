import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  final authorUID;
  final title;
  final text;
  PostScreen({ Key key, this.title, this.authorUID, this.text}) : super(key: key);

  static const routeName = "/post_screen";

  @override
  _PostScreenState createState() => _PostScreenState(authorUID: authorUID, text: text, title: title);
}

class _PostScreenState extends State<PostScreen> {
  String authorUID;
  String title;
  String text;

  _PostScreenState({this.authorUID, this.text, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.transparent
      ),
      body: SafeArea(
        child: ListView(
          children: [

            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("Permission").doc(authorUID).snapshots(),
                builder: (context, snapshot){
                  if((snapshot == null)|| (snapshot.data==null)) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StreamBuilder(
                          stream: (snapshot.data["permission"] == "Student") ? 
                            FirebaseFirestore.instance.collection("Students Info").doc(authorUID).snapshots() : 
                            FirebaseFirestore.instance.collection("Alumni Info").doc(authorUID).snapshots(),
                          builder: (context, secondSnapshot){
                            if((secondSnapshot == null)||(secondSnapshot.data==null)){
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return Text(secondSnapshot.data["name"]);
                            }
                          }
                        ),
                        Text((snapshot != null) ? snapshot.data["permission"] : ""),
                      ],
                    );
                  }
                }
              ),
            ),

            Text(title),

            Center(child: Text(text)),
            
          ],
        ),
      ),
    );
  }
}