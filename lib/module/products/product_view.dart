import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../data/product/product_data.dart';
import '../helpers/AnimationRightToLeft.dart';
import 'product_presenter.dart';
import 'product_detail_view.dart';


class ProductList extends StatefulWidget {
  ProductList({Key key}) : super(key : key);

  @override
  _ProductListState createState() => new _ProductListState();
}

class _ProductListState extends State<ProductList> implements ProductListViewContract {
  ProductListPresenter _presenter;

  List<Product> _products;

  bool _isSearching;

  _ProductListState() {
    _presenter = new ProductListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isSearching = true;
    _presenter.loadProducts();
  }

    @override
  void onLoadProductsComplete(List<Product> items) {

    setState(() {
      _products = items;
      _isSearching = false;
    });

  }

  @override
  void onLoadProductsError() {
    // TODO: implement onLoadContactsError
  }
  
  @override
  Widget build(BuildContext context) {
        Widget widget ;

    if(_isSearching) {
      widget = new Center(
        child: new Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: new CircularProgressIndicator()
        )
      );
    }else {
      widget = new ListView(
            padding: new EdgeInsets.symmetric(vertical: 8.0),
            children: _buildProductList()
      );
    }
    return widget;
  }

  List<_ProductListItem> _buildProductList() {
    return _products.map((product) =>
     new _ProductListItem(
       product: product,
       onTap: () { _showProductPage(context, product); }
     ))
    .toList();
  }

  void _showProductPage(BuildContext context, Product product) {
    Navigator.push(context, new FromRightToLeft<Null>(
      settings: const RouteSettings(name: ProductPage.routeName),
      builder: (BuildContext context) => new ProductPage(product)
    ));
  }

}

class _ProductListItem extends ListTile {
  _ProductListItem({ @required Product product,
                     @required GestureTapCallback onTap}) :
  super(
    title : new Text(product.productName),
    // subtitle: new Text(product.productDetails),
    leading: new CircleAvatar(
      child: new Text(product.productName[0])
    ),
    trailing: new Text(product.productQuantity + ' left'),
    onTap: onTap
  );
}