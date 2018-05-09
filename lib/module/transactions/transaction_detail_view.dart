import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';
import '../../data/transaction/transaction_data.dart';


class TransactionPage extends StatelessWidget {

  static const String routeName = '/transaction';

  final Transaction _transaction;

  TransactionPage(this._transaction);

  @override
  Widget build(BuildContext context) {
    // final double statusBarHeight = MediaQuery.of(context).padding.top;

    return new Theme(
      data: new ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.teal
      ),
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('Transaction'),
        ),
        body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
            child: new SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 24.0),
                  new TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                    prefixIcon: const Padding(                      
                      padding: const EdgeInsetsDirectional.only(end: 16.0),
                      child: Icon(Icons.calendar_today),
                    ),
                    hintText: 'Transaction date',
                      // labelText: 'Transaction Name',                    
                    ),
                    initialValue: _transaction.transactionDate ,
                  ),
                  const SizedBox(height: 24.0),
                  new TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                    prefixIcon: const Padding(
                      padding: const EdgeInsetsDirectional.only(end: 16.0),
                      child: Icon(Icons.description),
                    ),                        
                    hintText: 'Transaction description',
                      // labelText: 'Transaction Details',
                    ),
                    initialValue: _transaction.transactionDescription ,
                  ),
                  const SizedBox(height: 24.0),
                  new TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                    prefixIcon: const Padding(
                      padding: const EdgeInsetsDirectional.only(end: 16.0),
                      child: Icon(Icons.details),
                    ),                        
                    hintText: 'Transaction details',
                      // labelText: 'Cost Price',
                    ),
                    initialValue: _transaction.transactionDetails,
                  ),
                  const SizedBox(height: 24.0),
                  new TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                    prefixIcon: const Padding(
                      padding: const EdgeInsetsDirectional.only(end: 16.0),
                      child: Icon(Icons.attach_money),
                    ),                        // labelText: 'Sell Price',
                    suffixText: 'MYR',
                    suffixStyle: const TextStyle(color: Colors.green),
                    ),
                    keyboardType: TextInputType.number,
                    initialValue: _transaction.transactionValue,
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          child: const Icon(Icons.save),
          onPressed: () { _saveTransactionForm(context); } ,
        ),
      )
    );
  }

  void _saveTransactionForm(BuildContext context) {
    Navigator.pop(context);
  } 
}