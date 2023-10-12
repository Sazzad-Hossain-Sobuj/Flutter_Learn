import 'package:flutter/material.dart';
import 'package:to_do/update_task_modal.dart';

import 'add_new_task_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To_Do'),
        elevation: 10,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddNewTaskMoadal();
              });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        title: Text('Actions'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: Text('Update'),
                              leading: Icon(Icons.edit),
                              onTap: () {
                                Navigator.pop(context);
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return UpdateTaskModal();
                                    });
                              },
                            ),
                            ListTile(
                              title: Text('Delete'),
                              leading: Icon(Icons.delete),
                              onTap: () {
                                Navigator.pop(context);
                                //delete
                              },
                            )
                          ],
                        ),
                      );
                    });
              },
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              title: const Text('Image'),
              subtitle: const Text('date'),
              trailing: const Text('pending'),
            );
          }),
    );
  }
}




