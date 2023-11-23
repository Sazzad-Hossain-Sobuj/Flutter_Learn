import 'package:crud_api_rabbil/screens/product_create_screen.dart';
import 'package:crud_api_rabbil/screens/product_update_screen.dart';
import 'package:crud_api_rabbil/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../rest_api/rest_client.dart';

class ProductGridViewScreen extends StatefulWidget {
  const ProductGridViewScreen({Key? key}) : super(key: key);

  @override
  State<ProductGridViewScreen> createState() => _ProductGridViewScreenState();
}

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {
  List ProductList = [];
  bool Loading = true;

  @override
  void initState() {
    CallData();
    super.initState();
  }

  CallData() async {
    Loading = true;
    var data = await ProductGridViewListRequest();
    setState(() {
      ProductList = data;
      Loading = false;
    });
  }

  DeleteItem(id) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Delete!'),
            content: Text('Do you want to delete?'),
            actions: [
              OutlinedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    setState(() {
                      Loading = true;
                    });
                    await ProductDeleteRequest(id);
                    await CallData();
                  },
                  child: Text('Yes')),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('No')),
            ],
          );
        });
  }

  GotoUpdate(context, productItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => ProductUpdateScreen(productItem: productItem)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Product'),
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: Loading
                ? (Center(child: CircularProgressIndicator()))
                : RefreshIndicator(
                    child: (GridView.builder(
                      itemCount: ProductList.length,
                      gridDelegate: ProductGridViewStyle(),
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                  child: Image.network(
                                ProductList[index]['Img'],
                                fit: BoxFit.fill,
                              )),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(ProductList[index]['ProductName']),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text('Price: ' +
                                        ProductList[index]['UnitPrice'] +
                                        'BDT'),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {
                                            GotoUpdate(
                                                context, ProductList[index]);
                                          },
                                          child: Icon(
                                              CupertinoIcons
                                                  .ellipsis_vertical_circle,
                                              size: 18,
                                              color: green),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        OutlinedButton(
                                          onPressed: () {
                                            DeleteItem(
                                                ProductList[index]['_id']);
                                          },
                                          child: Icon(
                                            CupertinoIcons.delete,
                                            size: 18,
                                            color: red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )),
                    onRefresh: () async {
                      await CallData();
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => ProductCreateScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
