import 'package:flutter/material.dart';

import '../ui_widgets/body_background.dart';
import '../ui_widgets/profile_summaary.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              const ProfileSummaryCard(),
              Expanded(
                child: BodyBackground(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 32,
                          ),
                          Text('Add New Task',style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(height: 16,),
                          TextFormField(
                            decoration: const InputDecoration(
                                hintText: 'Subject'
                            ),
                          ),
                          const SizedBox(height: 8,),
                          TextFormField(
                            maxLines: 4,
                            decoration: const InputDecoration(
                                hintText: 'Description'
                            ),
                          ),
                          const SizedBox(height: 16,),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: (){},
                                child: const Icon(Icons.arrow_circle_right_outlined)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            ],
          )),

    );
  }
}
