import 'dart:async';

import 'product_data.dart';


class MockProductRepository implements ProductRepository {

  Future<List<Product>> fetch() {
    return new Future.value(kProducts);
  }
  
}

const kProducts = const <Product>[
    const Product(
      productName: 'Daun Selasih',
      productDetails:'Menguatkan gigi atuk2....',
      productCostPrice: '30',
      productSellPrice: '60',
      productQuantity: '150'
    ),
    const Product(
      productName: 'Pinangbelahdua',
      productDetails:'Bagaikan pinang di belah dua bang.',
      productCostPrice: '60',
      productSellPrice: '120',
      productQuantity: '50'
    ),
    const Product(
      productName: 'Biji Ketumbar',
      productDetails:'Masak kari pon sedap.',
      productCostPrice: '5',
      productSellPrice: '15',
      productQuantity: '9000'
    ),
    const Product(
      productName: 'Herbanika',
      productDetails:'Untuk sakit perut, bole ar pakai.',
      productCostPrice: '25',
      productSellPrice: '60',
      productQuantity: '250'
    ),
  ];