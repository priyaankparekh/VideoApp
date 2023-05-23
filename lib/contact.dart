import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Theme/app_colors.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, top: 16.0, right: 16.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Connect with",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "Peter McKinnon",
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            // Divider(
            //   color: Colors.black38,
            //   thickness: 1,
            //   indent: 16,
            //   endIndent: 16,
            // ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Name is required';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Name is required';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Message'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Name is required';
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              child: Text("Submit"),
              style:
                  ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                //show Toast
                Fluttertoast.showToast(
                    msg: "Submitted Successfully",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    fontSize: 16.0);

                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
