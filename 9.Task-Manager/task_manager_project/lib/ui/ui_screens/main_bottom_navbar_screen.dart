import 'package:flutter/material.dart';
import 'package:task_manager_project/ui/ui_screens/progress_task_screen.dart';

import 'cancelled_task_screen.dart';
import 'completed_task_screen.dart';
import 'new_task_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({Key? key}) : super(key: key);

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int selectedIndex = 0;
  final List<Widget> screens = const [
    NewTasksScreen(),
    ProgressTasksScreen(),
    CompletedTasksScreen(),
    CancelledTasksScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: (index){
          selectedIndex = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.abc),label:'New'),
          BottomNavigationBarItem(icon: Icon(Icons.change_circle_outlined),label:'In Progress'),
          BottomNavigationBarItem(icon: Icon(Icons.done),label:'Completed'),
          BottomNavigationBarItem(icon: Icon(Icons.close),label:'Cancel'),
        ],
      ),
    );
  }
}
