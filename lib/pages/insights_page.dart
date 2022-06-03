// ignore_for_file: use_key_in_widget_constructors, unnecessary_this, must_be_immutable
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/libary.dart';
import 'package:habit_tracker/model/daily_habbit.dart';
import 'package:habit_tracker/model/mood_day.dart';
import 'package:habit_tracker/pages/fineTabBar.dart';
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
    // final habbitBox = Boxes.getHabbits();
    // habbitBox.clear();

    // final moodBox = Boxes.getMoodDays();
    // moodBox.clear();

    super.initState();
  }

  static const TextStyle title =
      TextStyle(fontSize: 26, fontWeight: FontWeight.bold, height: 1.2);

  final TextEditingController _habbitTextController = TextEditingController();

  static const double sidePadding = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Navigator.of(context).push(
      //     MaterialPageRoute(
      //       builder: (context) => SettingsPage(
      //           backFunction: () =>
      //               Navigator.of(context).push(MaterialPageRoute(
      //                 builder: (context) => const InsightsPage(),
      //               ))),
      //     ),
      //   ),
      //   backgroundColor: Colors.white.withOpacity(0.4),
      //   foregroundColor: PURPLE,
      //   splashColor: PURPLE,
      //   tooltip: "Settings",
      //   elevation: 0,
      //   child: const Icon(
      //     Icons.settings,
      //     size: 37.5,
      //   ),
      // ),
      body: ValueListenableBuilder<Box<MoodDay>>(
        valueListenable: Boxes.getMoodDays().listenable(),
        builder: (context, box, _) {
          final moodDays = box.values.toList().cast<MoodDay>();

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
                                  getDay()[1],
                                  width: 80,
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  getDay()[0],
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                    
                                  ),
                                  textAlign: TextAlign.center,
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
                        SvgPicture.asset("assets/ico/fire.svg", width: 40,)
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
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  // ignore: sized_box_for_whitespace
                                  Container(
                                    height: 200,
                                    width: 240,
                                    child: ListView.builder(
                                      itemBuilder:
                                          (BuildContext context, int index) =>
                                              HabitListItem(
                                        title:
                                            moodDays.last.habbits[index].habbit,
                                        finished: moodDays
                                            .last.habbits[index].finished,
                                        function: () => setState(() {
                                          moodDays.last.habbits[index]
                                                  .finished =
                                              !moodDays
                                                  .last.habbits[index].finished;

                                          moodDays.last.save();
                                        }),
                                        deleteFunction: () => setState(() {
                                          moodDays.last.habbits.removeAt(index);
                                        }),
                                      ),
                                      itemCount: moodDays.last.habbits.length,
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                          width: 1.5,
                                          color: GREY.withOpacity(0.6)),
                                    ),
                                    child: Center(
                                        child: Text(
                                            "${getFinishedHabbits().toString()}/${moodDays.last.habbits.length}")),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 7.5),
                              Container(
                                height: 60,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 6,
                                      child: TextField(
                                        maxLines: null,
                                        controller: _habbitTextController,
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Add daily habbit..."),
                                      ),
                                    ),
                                    Expanded(
                                      child: IconButton(
                                        icon: SvgPicture.asset(
                                            "assets/ico/add.svg"),
                                        iconSize: 40,
                                        onPressed: () {
                                          setState(
                                            () {
                                              moodDays.last.habbits.add(
                                                Habbit(
                                                  habbit: _habbitTextController
                                                      .text,
                                                  finished: false,
                                                ),
                                              );
                                              _habbitTextController.text = "";
                                            },
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 7.5),
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
                          "${moodDays.length}-day-streak",
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
                      final habbitBox = Boxes.getHabbits();
                      habbitBox.clear();
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

  List<String> getDay() {
    // ? Zurückgegeben wird Liste: [Text wie der Tag war, Bild wie der Tag war]
    final box = Boxes.getMoodDays();
    final moodDays = box.values.toList().cast<MoodDay>();

    double finished = 0;
    for (var element in moodDays.last.habbits) {
      if (element.finished == true) {
        finished += 1;
      }
    }

    if (moodDays.last.habbits.isEmpty) {
      return ["Today there were\nno habits.", "assets/moods/loading.png"];
    }

    // *
    if (getProcent(finished, moodDays.last.habbits.length) == 1) {
      return ["Today was insane!", "assets/moods/fire.png"];
    }
    if (getProcent(finished, moodDays.last.habbits.length) >= 0.75) {
      return ["Today was good.", "assets/moods/happy.png"];
    }
    if (getProcent(finished, moodDays.last.habbits.length) >= 0.5) {
      return ["Today was ok.", "assets/moods/thinking.png"];
    }
    if (getProcent(finished, moodDays.last.habbits.length) >= 0.25) {
      return ["Today wasn't so good....", "assets/moods/frown.png"];
    }
    return ["Today could be better...", "assets/moods/sad.png"];
  }

  int getFinishedHabbits() {
    final box = Boxes.getMoodDays();
    final moodDays = box.values.toList().cast<MoodDay>();
    int finished = 0;
    for (var element in moodDays.last.habbits) {
      if (element.finished == true) {
        finished += 1;
      }
    }
    return finished;
  }

  double getProcent(double amout, int all) {
    return double.parse((amout / all).toString());
  }
}

class HabitListItem extends StatefulWidget {
  final String title;
  final void Function() function;
  final void Function() deleteFunction;

  bool finished;

  HabitListItem({
    required this.title,
    required this.finished,
    required this.function,
    required this.deleteFunction,
  });

  @override
  State<HabitListItem> createState() => _HabitListItemState();
}

class _HabitListItemState extends State<HabitListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.widget.function,
      onLongPress: this.widget.deleteFunction,
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
