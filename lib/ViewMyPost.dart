import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'gloals.dart' as globals;
import 'colors.dart';

class MyPost extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomPadding: false,
  //    appBar: AppBar(title:  Text('Cloud Firestore Example'), centerTitle: true,
  //      actions: <Widget>[],),
      body: StreamBuilder(
        stream: Firestore.instance.collection('uide').document(globals.userUID).collection(globals.userUID).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData) return CircularProgressIndicator();
          return FirestoreListView(documents: snapshot.data.documents);
        },
      ),

    );
  }
}
class FirestoreListView extends StatelessWidget{
  final List<DocumentSnapshot> documents;

  FirestoreListView({this.documents});

  Widget build(BuildContext context){

    return ListView.builder(
      itemCount: documents.length,
      // itemExtent: 110.0,
      itemBuilder: (BuildContext context, int index){
        String title =documents[index].data['posting'].toString();
        return ListTile(
            trailing:  IconButton(
              icon: Icon(Icons.delete),
              onPressed: (){
                Firestore.instance.runTransaction((transation)async{
                  DocumentSnapshot snapshot=
                  await transation.get(documents[index].reference);
                  await transation.delete(snapshot.reference);
                });
              },
            ),
            title:
            Container(
              decoration: BoxDecoration(
                color: k50,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color:k100),
              ),
              padding: EdgeInsets.all(10.0),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Expanded(
                  !documents[index].data['editing']
                        ?Text(title)
                        :TextFormField(
                      initialValue: title,
                      onFieldSubmitted: (String item){
                        Firestore.instance
                            .runTransaction((transaction)async{
                          DocumentSnapshot snapshot=await transaction
                              .get(documents[index].reference);
                          await transaction.update(
                              snapshot.reference, {'posting':item});
                          await transaction.update(snapshot.reference,
                              {"editing":!snapshot['editing']});
                        });
                      },
                    ),
                ],
              ) ,

            ),
            onTap: ()=>Firestore.instance
                .runTransaction((Transaction transaction) async{
              DocumentSnapshot snapshot=
              await transaction.get(documents[index].reference);//dpcuments의 값을 가지고옴.?

              await transaction.update(
                  snapshot.reference, {"editing":!snapshot["editing"]});
            })
        );
      },
    );
  }
}