import '../../data/product/product_data.dart';
import '../../injection/product_dependency_injection.dart';

abstract class ProductListViewContract {
  void onLoadProductsComplete(List<Product> items);
  void onLoadProductsError();
}

class ProductListPresenter {
  ProductListViewContract _view;
  ProductRepository _repository;

  ProductListPresenter(this._view) {
    _repository = new ProductInjector().productRepository;
  }

  void loadProducts(){
    assert(_view != null);

    _repository.fetch()
    .then((products) => _view.onLoadProductsComplete(products))
    .catchError((onError) {
      print(onError);
      _view.onLoadProductsError();
    });
  }
}