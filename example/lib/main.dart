import 'dart:ui';

import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Searchbar Animation',
      home: SearchbarAnimationExample(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class SearchbarAnimationExample extends StatefulWidget {
  const SearchbarAnimationExample({Key? key}) : super(key: key);

  @override
  _SearchbarAnimationExampleState createState() =>
      _SearchbarAnimationExampleState();
}

class _SearchbarAnimationExampleState extends State<SearchbarAnimationExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSearchbarAnimation(),
    );
  }

  Widget _buildSearchbarAnimation() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(0, 169, 191, 1),
                Colors.greenAccent,
              ],
            ),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: Text(
                  'Searchbar Animation',
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 85.0, left: 8.0, right: 8.0, bottom: 8.0),
                child: Container(
                  height: 660.0,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.8),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SearchBarAnimation(
                          textEditingController: TextEditingController(),
                          isOriginalAnimation: true,
                          enableKeyboardFocus: true,
                          onExpansionComplete: () {
                            debugPrint(
                                'do something just after searchbox is opened.');
                          },
                          onCollapseComplete: () {
                            debugPrint(
                                'do something just after searchbox is closed.');
                          },
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
