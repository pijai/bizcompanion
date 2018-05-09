import '../data/product/product_data.dart';
import '../data/product/product_data_mock.dart';


enum ProductFlavor {
  MOCK
}

class ProductInjector {
  static final ProductInjector _singleton = new ProductInjector._internal();
  static ProductFlavor _flavor;

  static void configure(ProductFlavor flavor) {
    _flavor = flavor;
  }

  factory ProductInjector() {
    return _singleton;
  }

  ProductInjector._internal();

  ProductRepository get productRepository {
    switch (_flavor) {
      default : 
      return new MockProductRepository();
    }
  }
}