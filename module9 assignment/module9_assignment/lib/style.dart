import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShoppingScreen(),
    );
  }
}

class ShoppingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ShoppingItem(
              image: 'image1.png',
              title: 'Product 1',
              subtitle: 'Description of Product 1',
              price: 10.99,
            ),
            ShoppingItem(
              image: 'image2.png',
              title: 'Product 2',
              subtitle: 'Description of Product 2',
              price: 15.99,
            ),
            ShoppingItem(
              image: 'image3.png',
              title: 'Product 3',
              subtitle: 'Description of Product 3',
              price: 20.99,
            ),
            ElevatedButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content: Text('Congratulations! Checkout successful.'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text('CHECK OUT'),
            ),
          ],
        ),
      ),
    );
  }
}

class ShoppingItem extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final double price;

  ShoppingItem({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  @override
  _ShoppingItemState createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  int itemCount = 0;

  var images = [
    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
  ];

  void increment() {
    setState(() {
      itemCount++;
    });
  }

  void decrement() {
    setState(() {
      if (itemCount > 0) {
        itemCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          ListTile(
            leading: Image.network('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg'),
            title: Text(widget.title),
            subtitle: Text(widget.subtitle),

            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.more_vert),
                SizedBox(height: 10,),
                Text('\$${widget.price.toStringAsFixed(2)}'),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: increment,
                child: Icon(Icons.add),
              ),
              SizedBox(width: 10),
              Text('$itemCount'),
              SizedBox(width: 10),
              FloatingActionButton(
                onPressed: decrement,
                child: Icon(Icons.remove),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text('Total: \$${(widget.price * itemCount).toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        title: Text('data'),
      ),

      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black26,
          ),
          Positioned(
              top: 20,
              left: 10,
              right: 10,
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
              )),
          Positioned(
              top: 190,
              left: 10,
              right: 10,
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black12,
                  ),
                  Positioned(
                    child: Container(
                        height: 150,
                        width: 100,
                        child: Image.network(
                          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg', fit: BoxFit.cover,)),
                  ),
                  Positioned(
                      top: 200,
                      left: 20,

                      child: ListTile(
                        title: Text('Product 1',style: TextStyle(color: Colors.teal),),
                        subtitle: Text('price'),
                      )),

                  // Positioned(
                  //     child: child)
                ],
              )),

        ],
      ),

    );
  }
}