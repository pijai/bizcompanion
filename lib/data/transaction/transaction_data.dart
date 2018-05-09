import 'dart:async';

class Transaction {

  final String transactionDate;
  final String transactionDescription;
  final String transactionDetails;
  final String transactionValue;

  const Transaction({this.transactionDate, this.transactionDescription, this.transactionDetails,
   this.transactionValue});

}

abstract class TransactionRepository{
  Future <List<Transaction>> fetch();
}

class FetchDataException implements Exception {
  String _message;

  FetchDataException(this._message);

  String toString() {
    return "Exception: $_message";
  }
}