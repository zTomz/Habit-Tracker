// ignore_for_file: unnecessary_this, use_key_in_widget_constructors, must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:habit_tracker/libary.dart';
import 'package:habit_tracker/model/mood_day.dart';
import 'package:habit_tracker/pages/fineTabBar.dart';
import 'package:habit_tracker/pages/settings_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  void initState() {
    setState(() {
      currentPage = 2;
    });

    Hive.openBox<MoodDay>('MoodBox');

    super.initState();
  }

  void scrollToLastItem(List<MoodDay> moodDays) {
    itemScrollController.scrollTo(
        index: moodDays.length - 1,
        duration: Duration(
            seconds: moodDays.length ~/ 3 == 0 ? 1 : moodDays.length ~/ 3),
        curve: Curves.easeInOut);
  }

  static const TextStyle title =
      TextStyle(fontSize: 26, fontWeight: FontWeight.bold, height: 1.2);

  static const double sidePadding = 20;

  ItemScrollController itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SettingsPage(
              backFunction: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const StatsPage(),
                  ))),
        )),
        backgroundColor: Colors.white.withOpacity(0.4),
        foregroundColor: PURPLE,
        splashColor: PURPLE,
        tooltip: "Settings",
        elevation: 0,
        child: const Icon(
          Icons.settings,
          size: 37.5,
        ),
      ),
      body: ValueListenableBuilder<Box<MoodDay>>(
        valueListenable: Boxes.getMoodDays().listenable(),
        builder: (context, box, _) {
          final moodDays = box.values.toList().cast<MoodDay>();

          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/background_1.png"),
                  fit: BoxFit.cover),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const FineTabBar(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: sidePadding),
                    child: Row(
                      children: const [
                        Text("Mood graph", style: title),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: sidePadding, vertical: 20),
                    decoration: BoxDecoration(
                      color: GREY.withOpacity(0.4),
                      border:
                          Border.all(width: 1.5, color: GREY.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 25),
                          width: 800,
                          height: 150,
                          child: ScrollablePositionedList.builder(
                            itemScrollController: itemScrollController,
                            itemBuilder: (BuildContext context, int index) {
                              scrollToLastItem(moodDays);
                              return HabitGrapghItem(
                                  index: index, moodDays: moodDays);
                            },
                            itemCount: moodDays.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: sidePadding),
                    child: Row(
                      children: const [
                        Text(
                          "All time feelings",
                          style: title,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: sidePadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            allTimeMoods("Relaxed", moodDays),
                            allTimeMoods("Grateful", moodDays),
                          ],
                        ),
                        Column(
                          children: [
                            allTimeMoods("Bored", moodDays),
                            allTimeMoods("Angry", moodDays),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: sidePadding, vertical: 10),
                    child: Text(
                      "Current days: ${moodDays.length}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    height: 600,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget allTimeMoods(String mood, List<MoodDay> moodDays) {
    return Row(
      children: [
        Text(
          "$mood: ${getMoodDays(mood, moodDays)}",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  int getMoodDays(String mood, List<MoodDay> moodDays) {
    int count = 0;
    for (var element in moodDays) {
      if (element.feeling == mood) {
        count += 1;
      }
    }
    return count;
  }
}

class HabitGrapghItem extends StatelessWidget {
  final int index;
  final List<MoodDay> moodDays;
  HabitGrapghItem({required this.index, required this.moodDays});

  List<String> weekdays = ["Mo", "Tue", "Wed", "Thu", "Fr", "Sa", "Su"];
  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Dec"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weekdays[moodDays[this.index].date.weekday - 1],
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, height: 1),
          ),
          Text(
            "${moodDays[this.index].date.day} ${months[moodDays[this.index].date.month - 1]}",
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          Image.asset(
            "assets/ico/${moodDays[this.index].feeling.toLowerCase()}.png",
            width: 30,
          ),
          const SizedBox(height: 7.5),
          Text(moodDays[this.index].feeling),
        ],
      ),
    );
  }
}
