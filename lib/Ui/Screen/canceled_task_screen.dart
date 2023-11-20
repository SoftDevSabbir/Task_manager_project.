import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widget/profile_summary_card.dart';
import '../Widget/task_item_card.dart';

class CanceTasksScreen extends StatefulWidget {
  const CanceTasksScreen({super.key});

  @override
  State<CanceTasksScreen> createState() => _CanceTasksScreenState();
}

class _CanceTasksScreenState extends State<CanceTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
              children: [
                ProfileSummaryCard(),
                Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) =>
                          Padding(
                            padding: const EdgeInsets.only(top: 18),
                            child: TaskItemCard(),
                          ),
                      itemCount: 8,
                    ))
              ],
            )));
  }
}
