// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/libary.dart';

class SettingsPage extends StatefulWidget {
  final void Function() backFunction;
  const SettingsPage({required this.backFunction});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static const padding = 20.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: this.widget.backFunction,
          backgroundColor: Colors.white.withOpacity(0.4),
          foregroundColor: PURPLE,
          splashColor: PURPLE,
          tooltip: "Back",
          elevation: 0,
          child: SvgPicture.asset("assets/ico/back.svg", color: PURPLE)),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/background_1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: padding),
                child: Row(
                  children: [
                    Text(
                      "Settings",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
