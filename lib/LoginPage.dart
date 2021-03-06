

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'gloals.dart' as globals;
import 'mainPageMH.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Home.dart';


class LoginPage extends StatefulWidget{
  static String tag ='login-page';
  _LoginPageState createState() => new _LoginPageState();
}
class _LoginPageState extends State<LoginPage>{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  Future<FirebaseUser> _signIn() async{
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;
    FirebaseUser user = await _auth.signInWithGoogle(
      idToken: gSA.idToken, accessToken: gSA.accessToken);
      print('User Name: ${user.displayName}');
      globals.userName=user.displayName;
      globals.userEmail=user.email;
      globals.userUID=user.uid;
      //로그인을 할 때, uid 다큐멘트로 db생성
      store.runTransaction((Transaction transaction)async{
      store.collection('uidc').document(globals.userUID).setData({"complete" : false,"mission" : true});
      }
    );
      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHome())
              );
      return user;
  }
  void _signOut(){
  globals.myCount=0;
  globals.ourCount=0;
  googleSignIn.signOut();
  print('User signed out');
  }
  Widget build(BuildContext context){
       return new Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: new Form(
              //key: formKey,
              child: new ListView(
                shrinkWrap: true,//Scrollable
                padding: EdgeInsets.only(left: 24.0, right: 24.0),
                children: buildInputs()
              ),
            )
          )
      );
  }
  List<Widget> buildInputs(){
    if(globals.i==1){ 
      _signOut();
    }
    globals.i=0;
    return[

    SizedBox(height: 45.0),
    new Container(
    ),
    SizedBox(height: 48.0),

    new Padding(
    //  padding: EdgeInsets.symmetric(vertical: 16.0),
      padding: EdgeInsets.fromLTRB(65.0, 0.0, 65.0, 120.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.redAccent.shade100,
        elevation: 0.0,
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          minWidth: 150.0,
          height: 46.0,
          onPressed: ()=> _signIn()
          .then((FirebaseUser user) => print(user))
          .catchError((e)=>print(e)),
          color: Color.fromRGBO(250, 140, 140, 1.0),
          child: Text('Google Log In',style: TextStyle(color: Colors.white)),
        ),
      ),
    ),
    SizedBox(height: 6.0),
    SizedBox(height: 6.0),
    ];
  }
  String validateEmail(String value) {

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Not a valid email.';
    else
      return null;
  }
}



