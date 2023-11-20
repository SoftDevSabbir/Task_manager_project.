import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskItemCard extends StatelessWidget {
  const TaskItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tittle will be here",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text("Describtion"),
          Text("Date: 12-12-2020"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Chip(
                  label: Text("New", style: TextStyle(color: Colors.white)),
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
