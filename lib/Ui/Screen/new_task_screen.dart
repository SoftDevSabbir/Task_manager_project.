import 'package:crud_app/Ui/Screen/add_new_task_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widget/profile_summary_card.dart';
import '../Widget/summary_card.dart';
import '../Widget/task_item_card.dart';

class NewTasksScreen extends StatefulWidget {
  const NewTasksScreen({super.key});

  @override
  State<NewTasksScreen> createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<NewTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewTaskScreen(),));
          }, child: Icon(Icons.add)),
            body: Column(
      children: [
        ProfileSummaryCard(),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.only(left: 16,right: 16,top: 10),
            child: Row(
              children: [
                SummeryCard(count: '92', tittle: 'New'),
                SummeryCard(count: '92', tittle: 'In Progress'),
                SummeryCard(count: '92', tittle: 'Completed'),
                SummeryCard(count: '92', tittle: 'Cancelled'),
              ],
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) =>
              TaskItemCard(),
              itemCount: 5,
        ))
      ],
    )));
  }
}


