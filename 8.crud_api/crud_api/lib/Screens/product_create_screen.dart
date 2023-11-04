import 'package:crud_api/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../RestApi/rest_client.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({Key? key}) : super(key: key);

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {

  Map<String, String> FormValues = {
    'Img' : '',
    'ProductCode' : '',
    'ProductName' : '',
    'Qty': '',
    'TotalPrice' : '',
    'UnitPrice' : ''
  };

  InputOnChange(MapKey,TextValue){
    FormValues.update(MapKey, (value) => TextValue);
    setState(() {});
  }

  FormOnSubmit() async {
    if(FormValues['Img']!.length == 0){
      ErroToast('Image link required');
    }
    if(FormValues['ProductCode']!.length == 0){
      ErroToast('Productcode link required');
    }
    if(FormValues['ProductName']!.length == 0){
      ErroToast('Product name required');
    }
    if(FormValues['Qty']!.length == 0){
      ErroToast('Product quantity required');
    }
    if(FormValues['TotalPrice']!.length == 0){
      ErroToast('Product totalprice required');
    }
    if(FormValues['UnitPrice']!.length == 0){
      ErroToast('Product unitprice required');
    }

    else{
      await ProductCreateRequest(FormValues);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product-Create'),
      ),
      body: Stack(
        children: [
          Container(
            child: (SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (TextValue) {
                      InputOnChange('ProductName', TextValue);
                    },
                    decoration: AppInputDecoration('Product Name'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (TextValue) {
                      InputOnChange('ProductCode', TextValue);
                    },
                    decoration: AppInputDecoration('Product Code'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (TextValue) {
                      InputOnChange('Img', TextValue);
                    },
                    decoration: AppInputDecoration('Product Image'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (TextValue) {
                      InputOnChange('UnitPrice', TextValue);
                    },
                    decoration: AppInputDecoration('Product Unit Price'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (TextValue) {
                      InputOnChange('TotalPrice', TextValue);
                    },
                    decoration: AppInputDecoration('Product Total Price'),
                  ),
                  SizedBox(
                    height: 20,
                  ),



                  AppDropDownStyle(DropdownButton(
                      value: FormValues['Qty'],
                      items: [
                        DropdownMenuItem(
                          child: Text('Select Quantity'),
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
                      onChanged: (TextValue) {
                        InputOnChange('Qty', TextValue);
                      },
                      underline: Container(),
                      isExpanded: true)),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: ElevatedButton(
                        style: AppButtonStyle(),
                        onPressed: () {
                          FormOnSubmit();
                        },
                        child: SuccessButtonchild('submit')),
                  )
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}
