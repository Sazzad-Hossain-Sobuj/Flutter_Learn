import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  List<String> images = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWnNqeo6bD5SlwulnP3HWs6qbSvlfQ_Iggyta5e3BXef903Br5_5peIDpJPW_LPSaGxEk&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAzqU-bAvdcR63d7nE4QXtYxRKHMd9Ak4Ax9gscSgJ-hs508Dw92vVB3VkAfhuN8RtQ8M&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu0W8oLEK6dzc-uO1I9H3Vx8Md5YRDA6nJuSR4gzLpV8M0mDsJftls0FzrmYAcEkATuRI&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQt1uxUIUxxiPJ-xgtXZHTa2tGkHiCVrcEcxMSROq0xy2aOR2K3CWw_U-GnA-W5g0ENAmg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlVraMiU92hQ6JubV9EOU9VR7zoCbKgFkpHIttOLzzQv6StSnekLn3MjNYkgXxYBDfw7g&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWnNqeo6bD5SlwulnP3HWs6qbSvlfQ_Iggyta5e3BXef903Br5_5peIDpJPW_LPSaGxEk&usqp=CAU',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo of Gallery'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        toolbarHeight: 60,
        elevation: 40,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Text('Welcome to My Photo Gallery!',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search for photos....',
                  labelStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child:  Container(
                child: GridView.builder(
                  itemCount: images.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GridTile(
                      footer: Container(color: Colors.white,child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Column(
                          children: [
                            Center(
                                child: Text(
                                  "Photo $index",
                                  style: const TextStyle(fontSize: 20),
                                )),
                          ],
                        ),
                      ),),
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Photo $index clicked!'),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Image.network(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),

                ),
              ),

            ),


            ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage('https://img.freepik.com/free-vector/cute-boy-standing-position-showing-thumb_96037-450.jpg?w=2000'),
              ),
              title: Text('Cartoon 1',style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('why are you looking at me!'),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage('https://i.pinimg.com/originals/03/19/8d/03198d4a991503b5f91351372bf6d3f3.jpg'),
              ),
              title: Text('Cartoon 2',style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('i want to sleep.let me sleep'),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgcwZW7vcQHzDs9WiLOn5z0Ex97g8Uggj_i_sZy5ENIb0YfRrE-M4KdocevtE93VB08g8&usqp=CAU'),
              ),
              title: Text('Cartoon 3',style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text('she is laughing'),
            ),

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Photos Uploaded Successfully!'),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.teal,
                    ),
                    child: Center(
                      child: Icon(Icons.upload,color: Colors.white,size: 30),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}