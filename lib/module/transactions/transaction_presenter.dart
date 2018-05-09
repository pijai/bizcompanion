import '../../data/transaction/transaction_data.dart';
import '../../injection/transaction_dependency_injection.dart';

abstract class TransactionListViewContract {
  void onLoadTransactionsComplete(List<Transaction> items);
  void onLoadTransactionsError();
}

class TransactionListPresenter {
  TransactionListViewContract _view;
  TransactionRepository _repository;

  TransactionListPresenter(this._view) {
    _repository = new TransactionInjector().transactionRepository;
  }

  void loadTransactions(){
    assert(_view != null);

    _repository.fetch()
    .then((transactions) => _view.onLoadTransactionsComplete(transactions))
    .catchError((onError) {
      print(onError);
      _view.onLoadTransactionsError();
    });
  }
}