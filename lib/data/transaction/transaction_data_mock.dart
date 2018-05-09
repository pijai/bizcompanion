import 'dart:async';

import 'transaction_data.dart';


class MockTransactionRepository implements TransactionRepository {

  Future<List<Transaction>> fetch() {
    return new Future.value(kTransactions);
  }
  
}

const kTransactions = const <Transaction>[
    const Transaction(
      transactionDate: '1/2/2013',
      transactionDescription:'test1',
      transactionDetails: 'test1',
      transactionValue: '30',
    ),
    const Transaction(
      transactionDate: '1/2/2013',
      transactionDescription:'test2',
      transactionDetails: 'test2',
      transactionValue: '25',
    ),
    const Transaction(
      transactionDate: '1/2/2013',
      transactionDescription:'test3',
      transactionDetails: 'test3',
      transactionValue: '10',
    ),
    const Transaction(
      transactionDate: '1/2/2013',
      transactionDescription:'test4',
      transactionDetails: 'test4',
      transactionValue: '6',
    ),
  ];