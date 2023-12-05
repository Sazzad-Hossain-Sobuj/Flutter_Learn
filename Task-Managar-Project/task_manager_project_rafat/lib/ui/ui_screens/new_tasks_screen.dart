import 'package:flutter/material.dart';
import 'package:task_manager_project_rafat/ui/ui_screens/add_new_task_screen.dart';

import '../ui_widgets/profile_summary_card.dart';
import '../ui_widgets/summary_card.dart';
import '../ui_widgets/task_item_card.dart';

class NewTasksScreen extends StatefulWidget {
  const NewTasksScreen({Key? key}) : super(key: key);

  @override
  State<NewTasksScreen> createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<NewTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNewTaskScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const ProfileSummaryCard(),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  children: [
                    SummaryCard(count: '92', title: 'New'),
                    SummaryCard(count: '90', title: 'InProgress'),
                    SummaryCard(count: '92', title: 'Completed'),
                    SummaryCard(count: '90', title: 'Cancelled')
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const TaskItemCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
