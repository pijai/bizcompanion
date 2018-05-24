
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../data/product/product_data.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({ Key key }) : super(key: key);

  static const String routeName = '/productForm';

  @override
  ProductFormState createState() => new ProductFormState();
}

class ProductFormState extends State<ProductForm> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Product product = new Product();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  void _handleSubmitted() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: const Text('Text fields'),
      ),
      body: new SafeArea(
        top: false,
        bottom: false,
        child: new Form(
          key: _formKey,
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
                    hintText: 'Product Name',
                  ),
                  onSaved: (String value) { product.productName; },
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
                    hintText: 'Product Details',
                  ),
                  // maxLines: 3,
                  onSaved: (String value) { product.productDetails; },
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
                    hintText: 'Cost Price',
                    suffixText: 'MYR',
                    suffixStyle: const TextStyle(color: Colors.green)
                  ),
                  keyboardType: TextInputType.phone,
                  onSaved: (String value) { product.productCostPrice; },
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
                    ),
                    hintText: 'Sell Price',
                    suffixText: 'MYR',
                    suffixStyle: const TextStyle(color: Colors.green)
                  ),
                  keyboardType: TextInputType.phone,
                  onSaved: (String value) { product.productSellPrice; },
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
                    hintText: 'Quantity',
                    suffixText: 'pcs',
                    suffixStyle: const TextStyle(color: Colors.green),
                  ),
                ),
                new Divider(height: 5.0, color: Colors.grey,),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {_handleSubmitted();} ,
      ),
    );
  }
}