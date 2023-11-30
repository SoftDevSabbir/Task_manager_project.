import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data_network_caller/models/task.dart';

class TaskItemCard extends StatelessWidget {
   TaskItemCard({
    super.key, required this.task,
  });

  final Task task;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(task.title??'',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(task.description??''),
          Text('Date : ${task.createdDate}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Chip(
                  label: Text(task.status??'New', style: TextStyle(color: Colors.white)),
                  backgroundColor: Colors.blue),
              Wrap(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete_forever_outlined)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
