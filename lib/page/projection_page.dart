import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectionPage extends StatefulWidget {
  @override
  State<ProjectionPage> createState() {
    return ProjectionState();
  }
}

class ProjectionState extends State<ProjectionPage> {

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
