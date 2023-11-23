import 'package:crud_api_rabbil/screens/product_grid_view_screen.dart';
import 'package:crud_api_rabbil/style/style.dart';
import 'package:flutter/material.dart';

import '../rest_api/rest_client.dart';

class ProductUpdateScreen extends StatefulWidget {
  const ProductUpdateScreen({Key? key, required this.productItem}) : super(key: key);

  final Map productItem;

  @override
  State<ProductUpdateScreen> createState() => _ProductUpdateScreenState();
}

class _ProductUpdateScreenState extends State<ProductUpdateScreen> {
  //creating map according to rest api
  Map<String, String> FormValues = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": "",
  };

  //show loading screen
  bool loading = false;

  @override
  void initState(){
    setState(() {

    });
    FormValues.update('Img', (value) => widget.productItem['Img']);
    FormValues.update('ProductCode', (value) => widget.productItem['ProductCode']);
    FormValues.update('ProductName', (value) => widget.productItem['ProductName']);
    FormValues.update('Qty', (value) => widget.productItem['Qty']);
    FormValues.update('TotalPrice', (value) => widget.productItem['TotalPrice']);
    FormValues.update('UnitPrice', (value) => widget.productItem['UnitPrice']);
  }

  InputChange(Mapkey, Textvalue) {
    FormValues.update(Mapkey, (value) => Textvalue);
    setState(() {});
  }

  FormOnSubmit() async{
    if(FormValues['Img']!.length == 0){
      ErrorToast('Image link required');
    }
    if(FormValues['ProductCode']!.length == 0){
      ErrorToast('Product code required');
    }
    if(FormValues['ProductName']!.length == 0){
      ErrorToast('Product name required');
    }
    if(FormValues['Qty']!.length == 0){
      ErrorToast('Product quantity required');
    }
    if(FormValues['TotalPrice']!.length == 0){
      ErrorToast('Total price required');
    }
    if(FormValues['UnitPrice']!.length == 0){
      ErrorToast('Unit price required');
    }
    else{
      setState(() {
        loading = true;
      });
      ProductUpdateRequest(FormValues,widget.productItem['_id']);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context)=>
                  ProductGridViewScreen()
          ),
          (Route route) =>false
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update-Product'),
      ),
      body: Stack(
        children: [
          //background
          ScreenBackground(context),
          Container(
              child: loading?(Center(child: CircularProgressIndicator(),)):((SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                      initialValue:FormValues['ProductName'],
                      onChanged: (Textvalue) {
                        InputChange('ProductName', Textvalue);
                      },
                      decoration: AppInputDecoration('Product Name'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      initialValue:FormValues['ProductCode'],
                      onChanged: (Textvalue) {
                        InputChange('ProductCode', Textvalue);
                      },
                      decoration: AppInputDecoration('Product Code'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      initialValue:FormValues['Img'],
                      onChanged: (Textvalue) {
                        InputChange('Img', Textvalue);
                      },
                      decoration: AppInputDecoration('Product Image'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      initialValue:FormValues['UnitPrice'],
                      onChanged: (Textvalue) {
                        InputChange('UnitPrice', Textvalue);
                      },

                      decoration: AppInputDecoration('Unit Price'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      initialValue:FormValues['TotalPrice'],
                      onChanged: (Textvalue) {
                        InputChange('TotalPrice', Textvalue);
                      },
                      decoration: AppInputDecoration('Total Price'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppDropDownStyle(
                      DropdownButton(
                        value: FormValues['Qty'],
                        items: const [
                          DropdownMenuItem(
                            child: Text('Select Qt'),
                            value: '',
                          ),
                          DropdownMenuItem(
                            child: Text('1 pcs'),
                            value: '1 pcs',
                          ),
                          DropdownMenuItem(
                            child: Text('2 pcs'),
                            value: '2 pcs',
                          ),
                          DropdownMenuItem(
                            child: Text('3 pcs'),
                            value: '3 pcs',
                          ),
                          DropdownMenuItem(
                            child: Text('4 pcs'),
                            value: '4 pcs',
                          ),
                        ],
                        onChanged: (Textvalue) {
                          InputChange('Qty', Textvalue);
                        },
                        isExpanded: true,
                        underline: Container(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: ElevatedButton(
                        style: AppButtonStyle(),
                        onPressed: () {
                          FormOnSubmit();
                        },
                        child: SuccessButtonChild('Submit'),
                      ),
                    ),
                  ],
                ),
              )))
          ),
        ],
      ),
    );
  }
}
