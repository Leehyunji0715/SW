import 'package:flutter/material.dart';

import 'mainPageMH.dart';

import 'addPost.dart';
import 'My_page.dart';
import 'mynewPosting.dart';
import 'newPosting.dart';
import 'colors.dart';

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();
}

// SingleTickerProviderStateMixin is used for animation
class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = new TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Appbar
    // appBar: new AppBar(
        // Title
     //   title: new Text(""),
      //  leading: Text(''),
        // Set the background color of the App Bar
       // backgroundColor: Colors.blue,
      //),

      // Set the TabBar view as the body of the Scaffold
      body: new TabBarView(
        // Add tabs as widgets
        children: <Widget>[
          new Home3(),new MyHomePage4(),new lala(), new  MyHomePage2(), new MyHomePage()
        ],
        // set the controller color: k400,
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: new Material(
        // set the color of the bottom navigation bar
        color: k400,
        // set the tab bar as the child of bottom navigation bar
        child: new TabBar(
          tabs: <Tab>[
            new Tab(
              // set icon to the tab
              icon: new Icon(Icons.home),
            ),
            new Tab(
              icon: new Icon(Icons.person),
            ),
            new Tab(
              icon: new Icon(Icons.add_circle_outline),
            ),
            new Tab(
              icon: new Icon(Icons.people),
            ),
            new Tab(
              icon: new Icon(Icons.settings),
            ),

          ],
          // setup the controller
          controller: controller,
        ),
      ),
    );
  }
}
