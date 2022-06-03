// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:habit_tracker/libary.dart';
import 'package:habit_tracker/model/daily_habbit.dart';
import 'package:habit_tracker/model/mood_day.dart';
import 'package:habit_tracker/pages/insights_page.dart';
import 'package:habit_tracker/pages/set_habit_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(MoodDayAdapter());
  Hive.registerAdapter(HabbitAdapter());

  await Hive.openBox<MoodDay>('MoodBox');
  await Hive.openBox<Habbit>("HabbitBox");
  // await Hive.openBox("SettingsBox");

  // final moodBox = Boxes.getMoodDays();
  // moodBox.clear();
  // habbitBox.clear();

  // ? Grundlegende Habits
  // if (habbitBox.isEmpty) {
  //   habbitBox.add(Habbit(habbit: "Train", finished: false));
  //   habbitBox.add(Habbit(habbit: "Sleep well", finished: false));
  //   habbitBox.add(Habbit(habbit: "Program on habit app", finished: false));
  // }

  // final settingsBox = Boxes.getSettings();
  
  // Get box and edit it
  // final box = Boxes.getMoodDays();
  // box.add("****")

  try {
    final moodBox = Boxes.getMoodDays();
    List<MoodDay> MoodDays = moodBox.values.toList().cast<MoodDay>();
    if (MoodDays[MoodDays.length - 1].date.day == DateTime.now().day) {
      canAddMood = false;
    }
  } catch (e) {
    print(e);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Poppins"),
      home: canAddMood ? const SetHabitPage() : const InsightsPage(),
      // home: SettingsPage(
      //     backFunction: () => Navigator.of(context).push(MaterialPageRoute(
      //           builder: (context) => const InsightsPage(),
      //         ))),
    );
  }
}
