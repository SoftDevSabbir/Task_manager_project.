import 'package:crud_app/Ui/Screen/canceled_task_screen.dart';
import 'package:crud_app/Ui/Screen/completed_task_screen.dart';
import 'package:crud_app/Ui/Screen/new_task_screen.dart';
import 'package:crud_app/Ui/Screen/progress_task_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainBottom extends StatefulWidget {
  const MainBottom({super.key});

  @override
  State<MainBottom> createState() => _MainBottomState();
}

class _MainBottomState extends State<MainBottom> {
  int _selectedIndex=0;

 final List<Widget> _screen=const [
    NewTasksScreen(),
    ProgressTasksScreen(),
    CompletedTasksScreen(),
   CanceTasksScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: (index){
          _selectedIndex=index;
          setState(() {

          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.update),label: 'New'),
          BottomNavigationBarItem(icon: Icon(Icons.pending),label: 'In Progress'),
          BottomNavigationBarItem(icon: Icon(Icons.done),label: 'Completed'),
          BottomNavigationBarItem(icon: Icon(Icons.close),label: 'Canceled'),
        ],
      ),
    );
  }
}
