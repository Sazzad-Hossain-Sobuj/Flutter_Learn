
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      padding: EdgeInsets.all(10),
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
