
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../data/transaction/transaction_data.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({ Key key }) : super(key: key);

  static const String routeName = '/transactionForm';

  @override
  TransactionFormState createState() => new TransactionFormState();
}

class TransactionFormState extends State<TransactionForm> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _switchValue = false;

  Transaction transaction = new Transaction();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  void _handleSubmitted() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: const Text('Transaction form'),
      ),
      body: new SafeArea(
        top: false,
        bottom: false,
        child: new Form(
          key: _formKey,
          child: new SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                  new CupertinoSwitch(
                    value: _switchValue,
                    onChanged: (bool value) { setState(() { _switchValue = value; }); },
                  ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    prefixIcon: const Padding(
                      padding: const EdgeInsetsDirectional.only(end: 16.0),
                      child: Icon(Icons.date_range),
                    ),  
                    hintText: 'Transaction Date',
                  ),
                  keyboardType: TextInputType.number,
                  onSaved: (String value) { transaction.transactionDate; },
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
                    hintText: 'Transaction Description',
                  ),
                  // maxLines: 3,
                  onSaved: (String value) { transaction.transactionDescription; },
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
                    hintText: 'Transaction Details',
                  ),
                  keyboardType: TextInputType.text,
                  onSaved: (String value) { transaction.transactionDetails; },
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                    filled: true,
                    prefixIcon: const Padding(
                      padding: const EdgeInsetsDirectional.only(end: 16.0),
                      child: Icon(Icons.attach_money),
                    ),
                    hintText: 'Transaction Value',
                    suffixText: 'MYR',
                    suffixStyle: const TextStyle(color: Colors.green)
                  ),
                  keyboardType: TextInputType.phone,
                  onSaved: (String value) { transaction.transactionValue; },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {_handleSubmitted();} ,
      ),
    );
  }
}