import 'dart:ui';

import 'package:animated_searchbar/animated_searchbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Animated Searchbar',
      home: AnimatedSearchBarExample(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class AnimatedSearchBarExample extends StatefulWidget {
  const AnimatedSearchBarExample({Key? key}) : super(key: key);

  @override
  _AnimatedSearchBarExampleState createState() =>
      _AnimatedSearchBarExampleState();
}

class _AnimatedSearchBarExampleState extends State<AnimatedSearchBarExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildAnimatedSearchbar(),
    );
  }

  Widget _buildAnimatedSearchbar() {
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
                  'Animated Searchbar',
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
                        child: AnimatedSearchbar(
                          textEditingController: TextEditingController(),
                          isOriginalAnimation: true,
                          enableKeyboardFocus: false,
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
