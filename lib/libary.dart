// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:habit_tracker/model/daily_habbit.dart';
import 'package:habit_tracker/model/mood_day.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<MoodDay> getMoodDays() => Hive.box<MoodDay>("MoodBox");
  static Box<Habbit> getHabbits() => Hive.box<Habbit>("HabbitBox");

  /* 
  Index 0: Streak dauer
  */
  static Box getSettings() => Hive.box("SettingsBox");
}

// ! Colors
const BLUE = Color(0xFFCDEDFD);
const PINK = Color(0xFFE8AEB7);
const PURPLE = Color(0xFF7E78D2);
const YELLOW = Color(0xFFFFD118);
const GREY = Color.fromARGB(255, 241, 241, 241);
const GREEN = Color(0xFF00ff88);
const BACKGROUND_COLOR = Color(0xFFFFFAFA);

int currentPage = 1;

List<List> habitListItems = [
  ["Sleep", false],
  ["Train", false],
  ["Programing", true],
];
int finishedHabits = 1;
int streakLenght = 3;

bool canAddMood = true;
