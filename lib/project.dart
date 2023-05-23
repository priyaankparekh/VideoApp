import 'package:flutter/material.dart';

import 'Theme/app_colors.dart';

class Project extends StatefulWidget {
  const Project({Key? key}) : super(key: key);

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        // elevation: 0.,
        backgroundColor: AppColors.primary,
        title: Text("VideoVerse"),
      ),
      body: Center(child: Text("Project here")),
    );
  }
}
