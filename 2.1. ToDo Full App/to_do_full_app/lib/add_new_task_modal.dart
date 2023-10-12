import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_full_app/todo.dart';

class AddNewTaskMoadal extends StatefulWidget {
  const AddNewTaskMoadal({
    super.key,
    required this.onAddTap,
  });

  final Function(Todo) onAddTap;

  @override
  State<AddNewTaskMoadal> createState() => _AddNewTaskMoadalState();
}

class _AddNewTaskMoadalState extends State<AddNewTaskMoadal> {

  final TextEditingController todoTEController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Add New ToDo',
                    style: Theme.of(context).textTheme.titleLarge),
                IconButton(
                    color: Colors.teal,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close)),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              maxLines: 4,
              controller: todoTEController,
              decoration: InputDecoration(
                hintText: 'Enter your to do',
                enabledBorder: OutlineInputBorder(),
              ),
              validator: (String? value){
                if(value?.isEmpty ?? true){
                  return 'Enter a value';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {
                  if (_formkey.currentState!.validate()){
                    Todo todo = Todo(
                        taskDetails: todoTEController.text.trim(),
                        createdDateTime: DateTime.now(),
                        updatedDateTime: DateTime.now());
                    widget.onAddTap(todo);

                    Navigator.pop(context);
                  }

                },
                    child: Text('Add')))
          ],
        ),
      ),
    );
  }
}