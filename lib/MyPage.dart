


import 'package:flutter/material.dart';
// Comment out lines 7 and 10 to suppress the visual layout at runtime.
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'gloals.dart' as globals;
import 'colors.dart';
import 'LoginPage.dart';
import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//Image Plugin
import 'package:image_picker/image_picker.dart';

class MyPage extends StatefulWidget {
  MyPage({Key key, this.title}) : super(key: key);
  final String title;
  static String tag ='MyPage';
  @override
  _MyPageState createState() => _MyPageState();
}
class _MyPageState extends State<MyPage> {

  final Firestore url_storage=Firestore.instance; //저장
  final List<DocumentSnapshot> documents;
  @override
  Widget build(BuildContext context) {
    bool chk = false;
    return Scaffold(
      body: StreamBuilder(
          stream: Firestore.instance.collection('URL').document(globals.userUID).snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) return const Text("Loading..." );
            return SafeArea(
              child:
              Column(
                children: <Widget>[
                  Container(
                    color: k10,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: globals.image == null ? chk ? Image.network(globals.URL) : new Text("No" ) : new Image.file(globals.image),
                          iconSize: 100.0,
                          onPressed: picker,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              globals.userName,
                              //"로그인 ID 값: ",
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                fontSize: 15.0,
                              ),
                            ),
                            Text(
                              '', style: TextStyle(
                                fontSize: 2.5 ),
                            ),
                            Text(
                              globals.userEmail,
                              //"로그인 E-Mail 값 : ",
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                                fontSize: 14.0,
                                //        color: Colors.black
                              ),
                            ),
                            Divider(
                            ),
                            RaisedButton(
                                child: const Text('Save'),
                                color: Theme.of(context).accentColor,
                                elevation: 4.0,
                                splashColor: Colors.blueGrey,
                                onPressed: printUrl,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 10.0, color: k10, ),
                  ListTile(
                    title: Text(
                        'Setting' ),
                    trailing: Icon(
                        Icons.settings ),
                    onTap: () {},
                  ),
                  Divider(
                  ),
                  ListTile(
                    title: Text(
                        'My posting' ),
                    trailing: Icon(
                        Icons.message ),
                    onTap: () {},
                  ),
                  Divider(
                  ),
                  ListTile(
                      title: Text(
                          '로그아웃' ),
                      trailing: Icon(
                          Icons.cancel ),
                      onTap: () {
                        globals.i = 1;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()
                            )
                        );
                      }
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
  picker() async{
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    if(img!=null){
      globals.image=img;
    }
  }
  printUrl() async {
    final StorageReference firebaseStorageRef =
    FirebaseStorage.instance.ref().child(globals.userUID);
    final StorageUploadTask task =
    firebaseStorageRef.putFile(globals.image);
//
    StorageReference ref =
    FirebaseStorage.instance.ref().child(globals.userUID);
    String url = (await ref.getDownloadURL()).toString();
    globals.URL=url;
    url_storage.runTransaction((Transaction transaction) async {
      url_storage.collection('URL').document(globals.userUID).setData(
          {"URL": globals.URL});
    }
    );
  }

}

/*

class MyPage extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      //backgroundColor: k100,
      //    appBar: AppBar(backgroundColor: k400, title:  Text('Cloud Firestore Example'), centerTitle: true,
      //      actions: <Widget>[],),
      body: StreamBuilder(
        stream: Firestore.instance.collection('URL').document(globals.userUID).snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return _MyPage(documents: snapshot.data.documents);
        },
      ),
    );
  }
}

class _MyPage extends StatelessWidget {
  final List<DocumentSnapshot> documents;
  _MyPage ({this.documents});
  Widget build (BuildContext context) {

  }
}*/