


import 'package:flutter/material.dart';
// Comment out lines 7 and 10 to suppress the visual layout at runtime.
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'menu.dart';
import 'gloals.dart' as globals;
import 'colors.dart';
import 'login_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  static String tag ='my-page';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: k200,
 //     appBar: AppBar(
 //       backgroundColor: k400,
 //       title: Text('My Page'),
 //     ),
      drawer:MenuPage(),
body:SafeArea(child:

Column(
  children: <Widget>[
    Container(

      color: k10,
      child: Row(

        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('assets/happiness.jpg'),
            radius: 100.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(globals.userName,
                //"로그인 ID 값: ",
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                  fontSize: 15.0,
                ),
              ),
              Text('',style:TextStyle(fontSize: 2.5),),
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

            ],

          ),

        ],
      ),
    ),
    Container(height: 10.0,color: k10,),
    ListTile(
      title: Text('Setting'),
      trailing: Icon(Icons.settings),
      onTap: (){},
    ),
    Divider(),
    ListTile(
      title: Text('My posting'),
      trailing: Icon(Icons.message),
      onTap: (){},
    ),
    Divider(),
    ListTile(
      title: Text('로그아웃'),
      trailing: Icon(Icons.cancel),

        onTap: (){
          globals.i=1;
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()));

        }
    ),


  ],
),
),
/*
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new Expanded(
                flex:1,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                    ]
                )
            ),
            new Expanded(
              flex:3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/happiness.jpg'),
                    radius: 70.0,
                  ),
                  new Expanded(
                      child: Row(
                          children: [
                            new Expanded(
                              flex:1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                textDirection: TextDirection.rtl,
                                children: [
                                  Text(" "),
                                  Text(" "),
                                  Text(" "),
                                  Text(
                                    "ID : ",
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                      fontSize: 19.0,
                                    ),
                                  ),

                                  Text(
                                    "E-Mail : ",
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                      fontSize: 19.0,
                                    ),
                                  ),

                                ],
                              ),

                            ),
                            new Expanded(
                              flex:2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(" "),
                                  Text(" "),
                                  Text(" "),
                                  Text(globals.userName,
                                    //"로그인 ID 값: ",
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  /*Text(
                                    "로그인 PW 값 : ",
                                    style: TextStyle(
                                      fontFamily: 'Georgia',
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                      fontSize: 15.0,
                                    ),
                                  ),*/
                                  Text(
                                    globals.userEmail,
                                    //"로그인 E-Mail 값 : ",
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  //Text(" "),
                                  // Text(" "),
                                  //Text(" "),
                                  Text(" "),
                                  Text(" "),
                                  Text(" "),
                                  /*new Expanded(

                                    child: new RaisedButton(
                                      padding: EdgeInsets.all(5.0),
                                      child: new Text('회원정보 수정', style: TextStyle(
                                        fontSize: 16.5,
                                      ),
                                      ),
                                      color: Theme.of(context).accentColor,
                                      elevation: 4.0,
                                      splashColor: Colors.blueGrey,
                                      onPressed: () {
                                        // Perform some action
                                      },
                                    ),
                                  ),*/
                                ],
                              ),

                            )
                          ]
                      )
                  )
                ],
              ),
            ),
            new Expanded(
                flex:5,

                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Posts",
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                          fontSize: 25.0,
                        ),
                      ),
                      //list view로 포스트 출력
                    ]
                )
            )
          ],
        ),
      ),
      */

    );
  }
}
