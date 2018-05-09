import '../data/transaction/transaction_data.dart';
import '../data/transaction/transaction_data_mock.dart';


enum TransactionFlavor {
  MOCK
}

class TransactionInjector {
  static final TransactionInjector _singleton = new TransactionInjector._internal();
  static TransactionFlavor _flavor;

  static void configure(TransactionFlavor flavor) {
    _flavor = flavor;
  }

  factory TransactionInjector() {
    return _singleton;
  }

  TransactionInjector._internal();

  TransactionRepository get transactionRepository {
    switch (_flavor) {
      default : 
      return new MockTransactionRepository();
    }
  }
}