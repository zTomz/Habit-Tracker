// ignore_for_file: unnecessary_this, use_key_in_widget_constructors, sized_box_for_whitespace, non_constant_identifier_names

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:habit_tracker/libary.dart';
import 'package:habit_tracker/model/daily_habbit.dart';
import 'package:habit_tracker/model/mood_day.dart';
import 'package:habit_tracker/pages/insights_page.dart';

class SetHabitPage extends StatefulWidget {
  const SetHabitPage({Key? key}) : super(key: key);

  @override
  State<SetHabitPage> createState() => _SetHabitPageState();
}

class _SetHabitPageState extends State<SetHabitPage> {
  @override
  void initState() {
    super.initState();
  }

  static const Radius _radius = Radius.circular(25);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "How are you\nfeeling?",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                  height: 1.05),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius:
                  const BorderRadius.only(topLeft: _radius, topRight: _radius),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          HabitButton(
                            title: "Relaxed",
                            function: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const InsightsPage()));
                              final box = Boxes.getMoodDays();

                              List<MoodDay> MoodDays =
                                  box.values.toList().cast<MoodDay>();
                              final habbitBox = Boxes.getHabbits();
                              final habbits =
                                  habbitBox.values.toList().cast<Habbit>();
                              if (MoodDays.isNotEmpty) {
                                if (MoodDays.last.date.day ==
                                    DateTime.now().day) {
                                  box.values.last.delete();
                                  box.add(
                                    MoodDay(
                                      feeling: "Relaxed",
                                      date: DateTime.now(),
                                      habbits: habbits,
                                    ),
                                  );
                                  return;
                                }
                              }

                              box.add(MoodDay(
                                  feeling: "Relaxed",
                                  date: DateTime.now(),
                                  habbits: habbits));
                            },
                          ),
                          HabitButton(
                            title: "Bored",
                            function: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const InsightsPage()));
                              final box = Boxes.getMoodDays();
                              List<MoodDay> MoodDays =
                                  box.values.toList().cast<MoodDay>();
                              final habbitBox = Boxes.getHabbits();
                              final habbits =
                                  habbitBox.values.toList().cast<Habbit>();
                              if (MoodDays.isNotEmpty) {
                                if (MoodDays.last.date.day ==
                                    DateTime.now().day) {
                                  box.values.last.delete();
                                  box.add(
                                    MoodDay(
                                        feeling: "Bored",
                                        date: DateTime.now(),
                                        habbits: habbits),
                                  );
                                  return;
                                }
                              }
                              box.add(MoodDay(
                                  feeling: "Bored",
                                  date: DateTime.now(),
                                  habbits: habbits));
                            },
                          )
                        ],
                      ),
                      Column(
                        children: [
                          HabitButton(
                            title: "Grateful",
                            function: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const InsightsPage()));
                              final box = Boxes.getMoodDays();
                              

                              List<MoodDay> MoodDays =
                                  box.values.toList().cast<MoodDay>();
                              final habbitBox = Boxes.getHabbits();
                              final habbits =
                                  habbitBox.values.toList().cast<Habbit>();
                              if (MoodDays.isNotEmpty) {
                                if (MoodDays.last.date.day ==
                                    DateTime.now().day) {
                                  box.values.last.delete();
                                  box.add(
                                    MoodDay(
                                        feeling: "Grateful",
                                        date: DateTime.now(),
                                        habbits: habbits),
                                  );
                                  return;
                                }
                              }

                              box.add(MoodDay(
                                  feeling: "Grateful",
                                  date: DateTime.now(),
                                  habbits: habbits));
                            },
                          ),
                          HabitButton(
                            title: "Angry",
                            function: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const InsightsPage()));
                              final box = Boxes.getMoodDays();
                              List<MoodDay> MoodDays =
                                  box.values.toList().cast<MoodDay>();
                              final habbitBox = Boxes.getHabbits();
                              final habbits =
                                  habbitBox.values.toList().cast<Habbit>();
                              if (MoodDays.isNotEmpty) {
                                if (MoodDays.last.date.day ==
                                    DateTime.now().day) {
                                  box.values.last.delete();
                                  box.add(
                                    MoodDay(
                                      feeling: "Angry",
                                      date: DateTime.now(),
                                      habbits: habbits,
                                    ),
                                  );
                                  return;
                                }
                              }
                              box.add(MoodDay(
                                  feeling: "Angry",
                                  date: DateTime.now(),
                                  habbits: habbits));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HabitButton extends StatelessWidget {
  final String title;
  final void Function() function;
  const HabitButton({required this.title, required this.function});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: this.function,
      child: Container(
        height: 150,
        width: size.width / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/ico/${this.title.toLowerCase()}.png",
              width: 40,
            ),
            const SizedBox(height: 10),
            Text(
              this.title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
