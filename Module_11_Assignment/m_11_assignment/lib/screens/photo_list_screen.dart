
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m_11_assignment/screens/photo_details_screen.dart';

import '../api_service/api_service.dart';
import '../widgets/photo_list_create.dart';

class PhotoListScreen extends StatefulWidget {
  @override
  _PhotoListScreenState createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  final ApiService apiService = ApiService();
  List<Map<String, dynamic>> photos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final response = await apiService.fetchPhotos();
      setState(() {
        photos = response;
        isLoading = false;
      });
    } catch (error) {
      print('Error: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  void navigateToDetail(Map<String, dynamic> photo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhotoDetail(photo: photo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery App'),
        toolbarHeight: 60,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : PhotoListCreateScreen(photos: photos, onTap: navigateToDetail),
    );
  }
}
