import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_full_app/todo.dart';

class UpdateTodoModal extends StatefulWidget {
  const UpdateTodoModal({
    super.key,
    required this.todo,
    required this.onTodoUpdate
  });
  final Todo todo;
  final Function(String) onTodoUpdate;

  @override
  State<UpdateTodoModal> createState() => _UpdateTodoModalState();
}

class _UpdateTodoModalState extends State<UpdateTodoModal> {
  late final TextEditingController todoTEController;
  @override
  void initState() {
    super.initState();
    todoTEController = TextEditingController(text: widget.todo.taskDetails);
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Update ToDo',
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
              hintText: 'Enter your new to do',
              enabledBorder: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    widget.onTodoUpdate(todoTEController.text.trim());

                  },
                  child: Text('Update')))
        ],
      ),
    );
  }
}