import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectingPage extends StatefulWidget {
  @override
  State<ProjectingPage> createState() {
    return ProjectingState();
  }
}

class ProjectingState extends State<ProjectingPage> {

  @override
  Widget build(BuildContext context) {
    var index = 1;
    return new Scaffold(
      appBar: AppBar(
        title: Text("热映"),
      ),
      body: Center(
        child: Text("热映"),
      ),
    );
  }
}
