import 'package:flutter/material.dart';

class PhotoDetail extends StatelessWidget {
  final Map<String, dynamic> photo;

  PhotoDetail({required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
        child: Column(
          children: <Widget>[
            Image.network(photo['url']),
            SizedBox(height: 16,),
            Text('Title: ${photo['title']}'),
            SizedBox(height: 8,),
            Text('ID: ${photo['id']}'),
          ],
        ),
      ),
    );
  }
}
