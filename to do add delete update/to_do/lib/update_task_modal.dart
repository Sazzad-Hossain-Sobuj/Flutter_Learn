import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateTaskModal extends StatelessWidget {
  const UpdateTaskModal({
    super.key,
  });

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
              child: ElevatedButton(onPressed: () {}, child: Text('Update')))
        ],
      ),
    );
  }
}