import 'package:flutter/material.dart';

import 'mainPageMH.dart';

import 'AddPost.dart';
import 'MyPage.dart';
import 'ViewMyPost.dart';
import 'ViewEntirePost.dart';
import 'colors.dart';

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();
}
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
      body: new TabBarView(
        children: <Widget>[
          new Home(),new MyPost(),new Posting(), new  EntirePost(), new MyPage()
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
