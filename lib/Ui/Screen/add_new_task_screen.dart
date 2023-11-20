import 'package:crud_app/Ui/Widget/body_background.dart';
import 'package:crud_app/Ui/Widget/profile_summary_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProfileSummaryCard(),
            Expanded(child: BodyBackground(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 32),
                      Text("Add New Task",style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Subject",
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        maxLines: 8,
                        decoration: InputDecoration(
                          hintText: "Describtion",
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(width: double.infinity,
                        child: ElevatedButton(onPressed: () {},
                        child: Icon(Icons.arrow_circle_right_outlined),),)
                    ]
                  ),
                ),
              ),
            ))

          ],
        ),
      ),
    );
  }
}
