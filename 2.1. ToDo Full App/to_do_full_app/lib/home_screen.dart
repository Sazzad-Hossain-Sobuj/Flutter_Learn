import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_full_app/todo.dart';
import 'package:to_do_full_app/update_task_modal.dart';
import 'add_new_task_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Todo> todoList = [];


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
                return AddNewTaskMoadal(
                  onAddTap: (Todo task){
                    addTodo(task);
                  },
                );
              });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {

            final Todo todo = todoList[index];
            final String formatedDate = DateFormat('MM-dd-yy  hh:mm:ss a ').format(todo.createdDateTime);

            return ListTile(
              tileColor: todo.status == 'done'? Colors.black12 : null,
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
                                      return UpdateTodoModal(
                                        todo: todo,
                                        onTodoUpdate: (String updatedDetailsText){
                                          updateTodo(index, updatedDetailsText);
                                          Navigator.pop(context);
                                        },
                                      );
                                    });
                              },
                            ),
                            ListTile(
                              title: Text('Delete'),
                              leading: Icon(Icons.delete),
                              onTap: () {
                                Navigator.pop(context);
                                deleteTodo(index);
                              },
                            )
                          ],
                        ),
                      );
                    });
              },
              //for status
              onLongPress: (){
                String currentStatus = todo.status == 'pending'? 'done' : 'pending';
                updateTodoStatus(index, currentStatus);

              },
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              title: Text(todo.taskDetails),
              subtitle: Text(formatedDate),
              trailing: Text(todo.status.toUpperCase()),
            );
          }),
    );
  }

  void addTodo(Todo task) {
    todoList.add(task);
    setState(() {});
  }

  void deleteTodo(int index){
    todoList.removeAt(index);
    setState(() {});
  }

  void updateTodo(int index, String todoDetails){
    todoList[index].taskDetails = todoDetails;
    setState(() {});
  }

  void updateTodoStatus(int index, String status){
    todoList[index].status = status;
    setState(() {});
  }
}


