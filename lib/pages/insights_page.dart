// ignore_for_file: use_key_in_widget_constructors, unnecessary_this, must_be_immutable
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/libary.dart';
import 'package:habit_tracker/model/dayli_habbit.dart';
import 'package:habit_tracker/pages/fineTabBar.dart';
import 'package:habit_tracker/pages/settings_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

class InsightsPage extends StatefulWidget {
  const InsightsPage({Key? key}) : super(key: key);

  @override
  State<InsightsPage> createState() => _InsightsPageState();
}

class _InsightsPageState extends State<InsightsPage> {
  @override
  void initState() {
    setState(() {
      currentPage = 1;
    });
    // Hive.close();
    super.initState();
  }

  static const TextStyle title =
      TextStyle(fontSize: 26, fontWeight: FontWeight.bold, height: 1.2);

  static const double sidePadding = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SettingsPage(
                backFunction: () =>
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const InsightsPage(),
                    ))),
          ),
        ),
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
      body: ValueListenableBuilder<Box<Habbit>>(
        valueListenable: Boxes.getHabbits().listenable(),
        builder: (context, box, _) {
          final habbits = box.values.toList().cast<Habbit>();

          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/background_1.png"),
                fit: BoxFit.cover,
              ),
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
                        Text("Hi there", style: title),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: sidePadding),
                    child: Row(
                      children: const [
                        Text(
                          "Let's take a look\nat your day",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            height: 1.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 225,
                    margin: const EdgeInsets.symmetric(
                        horizontal: sidePadding, vertical: 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          PINK.withOpacity(0.45),
                          PURPLE.withOpacity(0.45)
                        ],
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/moods/fire.png",
                                  width: 80,
                                ),
                                const SizedBox(height: 15),
                                const Text(
                                  "Today was good",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: sidePadding,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        const Text("Your habits\non this day", style: title),
                        const SizedBox(width: 30),
                        Image.asset(
                          "assets/moods/fire.png",
                          width: 40,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: sidePadding,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          PINK.withOpacity(0.45),
                          PURPLE.withOpacity(0.45)
                        ],
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
                          child: Row(
                            children: [
                              // ignore: sized_box_for_whitespace
                              Container(
                                height: 200,
                                width: 240,
                                child: ListView.builder(
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          HabitListItem(
                                    title: habbits[index].habbit,
                                    finished: habbits[index].finished,
                                    function: () => setState(() {
                                      habbits[index].finished =
                                          !habbits[index].finished;
                                    }),
                                  ),
                                  itemCount: habbits.length,
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      width: 1.5, color: GREY.withOpacity(0.6)),
                                ),
                                child: Center(
                                    child: Text(
                                        "${getFinishedHabbits().toString()}/${habbits.length}")),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: sidePadding,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/ico/fire.svg",
                          width: 30,
                        ),
                        const SizedBox(
                          width: 7.5,
                          height: 7.5,
                        ),
                        Text(
                          "$streakLenght-day-streak",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  IconButton(
                    onPressed: () {
                      final box = Boxes.getMoodDays();
                      box.clear();
                    },
                    icon: const Icon(Icons.clear_all),
                    iconSize: 75,
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  int getFinishedHabbits() {
    final box = Boxes.getHabbits();
    final habbits = box.values.toList().cast<Habbit>();
    int finished = 0;
    habbits.forEach((element) {
      if (element.finished == true) {
        finished += 1;
      }
    });
    return finished;
  }
}

class HabitListItem extends StatefulWidget {
  final String title;
  final void Function() function;
  bool finished;
  HabitListItem(
      {required this.title, required this.finished, required this.function});

  @override
  State<HabitListItem> createState() => _HabitListItemState();
}

class _HabitListItemState extends State<HabitListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.widget.function,
      child: Text(
        this.widget.title,
        style: TextStyle(
          fontSize: 16,
          letterSpacing: 0.75,
          decoration: this.widget.finished
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
    );
  }
}
