import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/view/button_navigation_bar/health.dart';
import 'package:news_app/view/button_navigation_bar/science.dart';
import 'package:news_app/view/button_navigation_bar/sports.dart';
import '../view_models/news_view_model.dart';

// ignore: use_key_in_widget_constructors
class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentindex = 0;

  List screens = [
    Sports(),
    Health(),
    Science(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text.rich(TextSpan(children: [
          TextSpan(
            text: 'News',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
            ),
          ),
          TextSpan(
              text: 'Hub',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ))
        ])),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentindex,
          onTap: (value) {
            setState(() {
              currentindex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.sports_outlined,
                  color: Colors.deepOrange,
                ),
                label: 'Sports'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.health_and_safety_outlined,
                  color: Colors.deepOrange,
                ),
                label: 'Health'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.science_outlined,
                  color: Colors.deepOrange,
                ),
                label: 'Science'),
          ]),
      body: screens[currentindex],
    );
  }
}
