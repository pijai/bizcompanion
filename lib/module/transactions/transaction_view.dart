import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../data/transaction/transaction_data.dart';
import '../helpers/AnimationRightToLeft.dart';
import 'transaction_presenter.dart';
import 'transaction_detail_view.dart';



class TransactionList extends StatefulWidget {
  TransactionList({Key key}) : super(key : key);

  @override
  _TransactionListState createState() => new _TransactionListState();
}

class _TransactionListState extends State<TransactionList> implements TransactionListViewContract {
  TransactionListPresenter _presenter;

  List<Transaction> _transactions;

  bool _isSearching;

  _TransactionListState() {
    _presenter = new TransactionListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isSearching = true;
    _presenter.loadTransactions();
  }

    @override
  void onLoadTransactionsComplete(List<Transaction> items) {

    setState(() {
      _transactions = items;
      _isSearching = false;
    });

  }

  @override
  void onLoadTransactionsError() {
    // TODO: implement onLoadContactsError
  }
  
  @override
  Widget build(BuildContext context) {
        Widget widget ;

    if(_isSearching) {
      widget = new Center(
      //   child: new Padding(
      //     padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      //     child: new CircularProgressIndicator()
      //   )
      );
      
    }else {
      widget = new ListView(
            padding: new EdgeInsets.symmetric(vertical: 8.0),
            children: _buildTransactionList()
      );
    }
    return widget;
  }

  List<_TransactionListItem> _buildTransactionList() {
    return _transactions.map((transaction) =>
     new _TransactionListItem(
       transaction: transaction,
       onTap: () { _showTransactionPage(context, transaction); }
     ))
    .toList();
  }

  void _showTransactionPage(BuildContext context, Transaction transaction) {
    Navigator.of(context).push(new FromRightToLeft(
      settings: const RouteSettings(name: TransactionPage.routeName),
      builder: (BuildContext context) => new TransactionPage(transaction)
    ));
  }

}

class _TransactionListItem extends ListTile {
  _TransactionListItem({ @required Transaction transaction,
                     @required GestureTapCallback onTap}) :
  super(
    leading : new Text(transaction.transactionDate),
    title : new Text(transaction.transactionDescription),
    // subtitle: new Text(transaction.transactionDetails),
    trailing: new Text(transaction.transactionValue + ' MYR'),
    onTap: onTap
  );
}