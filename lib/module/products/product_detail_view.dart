import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';
import '../../data/product/product_data.dart';


class ProductPage extends StatelessWidget {

  static const String routeName = '/product';

  final Product _product;

  ProductPage(this._product);

  @override
  Widget build(BuildContext context) {
    // final double statusBarHeight = MediaQuery.of(context).padding.top;

    return new Theme(
      data: new ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.teal
      ),
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text(_product.productName),
        ),
        body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
            child: new SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 24.0),
                  new TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: false,
                    prefixIcon: const Padding(                      
                      padding: const EdgeInsetsDirectional.only(end: 16.0),
                      child: Icon(Icons.toys),
                    ),
                    hintText: 'Product name',
                      // labelText: 'Product Name',                    
                    ),
                    initialValue: _product.productName ,
                  ),
                  new Divider(height: 5.0, color: Colors.grey,),
                  const SizedBox(height: 24.0),
                  new TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: false,
                    prefixIcon: const Padding(
                      padding: const EdgeInsetsDirectional.only(end: 16.0),
                      child: Icon(Icons.description),
                    ),                        
                    hintText: 'Describe your product.',
                      // labelText: 'Product Details',
                    ),
                    initialValue: _product.productDetails ,
                  ),
                  new Divider(height: 5.0, color: Colors.grey,),
                  const SizedBox(height: 24.0),
                  new TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: false,
                    prefixIcon: const Padding(
                      padding: const EdgeInsetsDirectional.only(end: 16.0),
                      child: Icon(Icons.monetization_on),
                    ),                        
                    hintText: 'What is the cost price?',
                      // labelText: 'Cost Price',
                    suffixText: 'MYR',
                    suffixStyle: const TextStyle(color: Colors.green),                    ),
                    keyboardType: TextInputType.phone,
                    initialValue: _product.productCostPrice,
                  ),
                  new Divider(height: 5.0, color: Colors.grey,),
                  const SizedBox(height: 24.0),
                  new TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: false,
                    prefixIcon: const Padding(
                      padding: const EdgeInsetsDirectional.only(end: 16.0),
                      child: Icon(Icons.attach_money),
                    ),                        // labelText: 'Sell Price',
                    suffixText: 'MYR',
                    suffixStyle: const TextStyle(color: Colors.green),                    ),
                    keyboardType: TextInputType.number,
                    initialValue: _product.productSellPrice,
                  ),
                  new Divider(height: 5.0, color: Colors.grey,),
                  const SizedBox(height: 24.0),
                  new TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: false,
                    prefixIcon: const Padding(
                      padding: const EdgeInsetsDirectional.only(end: 16.0),
                      child: Icon(Icons.grade),
                    ),                        
                    hintText: 'How many items in stock?',
                    suffixText: 'pcs',
                    suffixStyle: const TextStyle(color: Colors.green),
                      // labelText: 'Quantity'
                    ),
                    initialValue: _product.productQuantity,
                  ),
                  new Divider(height: 5.0, color: Colors.grey,),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          child: const Icon(Icons.save),
          onPressed: () { _saveProductForm(context); } ,
        ),
      )
    );
  }

  void _saveProductForm(BuildContext context) {
    Navigator.pop(context);
  } 
}