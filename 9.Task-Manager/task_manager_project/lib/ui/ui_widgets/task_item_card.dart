import 'package:flutter/material.dart';

class TaskItemCard extends StatelessWidget {
  const TaskItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sazzad Hossain Sobuj',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text('I am from Tangail. I am graduated from Daffodil Internation University'),
            const Text('Date: 11.28.2023'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Chip(label: Text('New',style: TextStyle(color: Colors.white),),backgroundColor: Colors.teal,),
                Wrap(
                  children: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.delete_forever)),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.edit)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}