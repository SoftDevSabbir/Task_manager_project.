import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widget/profile_summary_card.dart';
import '../Widget/task_item_card.dart';

class CompletedTasksScreen extends StatefulWidget {
  const CompletedTasksScreen({super.key});

  @override
  State<CompletedTasksScreen> createState() => _CompletedTasksScreenState();
}

class _CompletedTasksScreenState extends State<CompletedTasksScreen> {
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
