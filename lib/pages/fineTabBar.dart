// ignore_for_file: file_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:habit_tracker/libary.dart';
import 'package:habit_tracker/pages/insights_page.dart';
import 'package:habit_tracker/pages/stats_page.dart';

class FineTabBar extends StatefulWidget {
  const FineTabBar({Key? key}) : super(key: key);

  @override
  State<FineTabBar> createState() => _FineTabBarState();
}

class _FineTabBarState extends State<FineTabBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 65,
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: Colors.white.withOpacity(0.8)),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const InsightsPage())),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: currentPage == 1 ? 15 : 0, sigmaY: currentPage == 1 ? 15 : 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: currentPage == 1
                              ? Colors.white.withOpacity(0.4)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Text(
                            "Insights",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, letterSpacing: 0.9),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const StatsPage())),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: currentPage == 2 ? 15 : 0, sigmaY: currentPage == 2 ? 15 : 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              currentPage == 2 ? Colors.white.withOpacity(0.4) : Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Text(
                            "Stats",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, letterSpacing: 0.9),
                          ),
                        ),
                      ),
                    ),
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
