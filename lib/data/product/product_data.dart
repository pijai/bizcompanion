import 'dart:async';

class Product {
  final String productName;
  final String productDetails;
  final String productCostPrice;
  final String productSellPrice;
  final String productQuantity;

  const Product({this.productName, this.productDetails, this.productCostPrice,
   this.productSellPrice, this.productQuantity});

}

abstract class ProductRepository{
  Future <List<Product>> fetch();
}

class FetchDataException implements Exception {
  String _message;

  FetchDataException(this._message);

  String toString() {
    return "Exception: $_message";
  }
}