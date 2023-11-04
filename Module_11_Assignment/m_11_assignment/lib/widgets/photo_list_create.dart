import 'package:flutter/material.dart';

class PhotoListCreateScreen extends StatelessWidget {
  final List<Map<String, dynamic>> photos;
  final Function(Map<String, dynamic>) onTap;

  PhotoListCreateScreen({required this.photos, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(8),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(photos[index]['title']),
          leading: Image.network(photos[index]['thumbnailUrl']),
          onTap: () => onTap(photos[index]),
        );
      },
      separatorBuilder: (_, __) => const Divider(),);
  }
}
