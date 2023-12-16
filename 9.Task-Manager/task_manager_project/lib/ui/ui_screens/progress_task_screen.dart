import 'package:flutter/material.dart';
import '../ui_widgets/profile_summaary.dart';
import '../ui_widgets/task_item_card.dart';

class ProgressTasksScreen extends StatefulWidget {
  const ProgressTasksScreen({Key? key}) : super(key: key);

  @override
  State<ProgressTasksScreen> createState() => _ProgressTasksScreenState();
}

class _ProgressTasksScreenState extends State<ProgressTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ProfileSummaryCard(),
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