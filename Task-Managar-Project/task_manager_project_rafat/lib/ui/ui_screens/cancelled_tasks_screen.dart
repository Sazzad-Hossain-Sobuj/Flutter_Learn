import 'package:flutter/material.dart';

import '../ui_widgets/profile_summary_card.dart';
import '../ui_widgets/task_item_card.dart';

class CancelledTasksScreen extends StatefulWidget {
  const CancelledTasksScreen({Key? key}) : super(key: key);

  @override
  State<CancelledTasksScreen> createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<CancelledTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ProfileSummaryCard(),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
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