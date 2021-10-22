import 'dart:ui';

import 'package:animated_search_box/animated_search_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Animated Searchbox',
      home: AnimatedSearchBoxExample(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class AnimatedSearchBoxExample extends StatefulWidget {
  const AnimatedSearchBoxExample({Key? key}) : super(key: key);

  @override
  _AnimatedSearchBoxExampleState createState() =>
      _AnimatedSearchBoxExampleState();
}

class _AnimatedSearchBoxExampleState extends State<AnimatedSearchBoxExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildAnimatedSearchbox(),
    );
  }

  Widget _buildAnimatedSearchbox() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(0, 169, 191, 1),
                Colors.greenAccent,
              ],
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Text(
                  'Animated Searchbox',
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 85.0, left: 8.0, right: 8.0, bottom: 8.0),
                child: Container(
                  height: 660.0,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.8),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: AnimatedSearchbox(
                          textEditingController: TextEditingController(),
                          isOriginalAnimation: true,
                          enableKeyboardFocus: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
