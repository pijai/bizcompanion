import 'package:flutter/material.dart';
import '../module/helpers/AnimationRightToLeft.dart';
import '../module/products/product_form.dart';
import '../module/products/product_view.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ProductList(),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () { _showProductForm(context); }
      ),
    );
  }

  void _showProductForm(BuildContext context) {
    Navigator.push(context, new FromRightToLeft(
      builder: (context) => new ProductForm() 
    ));
  }
}