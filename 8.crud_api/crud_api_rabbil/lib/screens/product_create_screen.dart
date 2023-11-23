import 'package:crud_api_rabbil/style/style.dart';
import 'package:flutter/material.dart';

import '../rest_api/rest_client.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({Key? key}) : super(key: key);

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
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
      await ProductCreateRequest(FormValues);
      setState(() {
        loading = false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create-Product'),
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
                    onChanged: (Textvalue) {
                      InputChange('ProductName', Textvalue);
                    },
                    decoration: AppInputDecoration('Product Name'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (Textvalue) {
                      InputChange('ProductCode', Textvalue);
                    },
                    decoration: AppInputDecoration('Product Code'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (Textvalue) {
                      InputChange('Img', Textvalue);
                    },
                    decoration: AppInputDecoration('Product Image'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (Textvalue) {
                      InputChange('UnitPrice', Textvalue);
                    },

                    decoration: AppInputDecoration('Unit Price'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
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
