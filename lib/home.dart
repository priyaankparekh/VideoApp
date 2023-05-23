import 'package:assignment_vc/project.dart';
import 'package:flutter/material.dart';

import 'Theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _items = List.generate(
      30,
      (index) => {
            "id": index,
            "title": "Video Title $index",
            "author": "Author name",
          });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        // elevation: 0.,
        backgroundColor: AppColors.primary,
        title: Text("VideoVerse"),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (_, index) {
            final item = _items[index];
            return Padding(
              padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: Card(
                color: AppColors.lightPrimary,
                elevation: 3.0,
                child: ExpansionTile(
                  title: Text(
                    item['title'],
                    style: TextStyle(color: AppColors.white),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset("assets/images/image1.jpg"),
                    ),
                    Text(
                      item['author'],
                      style: TextStyle(color: AppColors.black),
                    ),
                    Divider(
                      color: Colors.white60,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      child: Text("View More"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Project()));
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
