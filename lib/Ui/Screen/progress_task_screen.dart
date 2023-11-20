import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widget/profile_summary_card.dart';
import '../Widget/summary_card.dart';
import '../Widget/task_item_card.dart';

class ProgressTasksScreen extends StatefulWidget {
  const ProgressTasksScreen({super.key});

  @override
  State<ProgressTasksScreen> createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<ProgressTasksScreen> {
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
