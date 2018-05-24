import 'package:flutter/material.dart';
import '../module/helpers/AnimationRightToLeft.dart';
import '../module/transactions/transaction_form.dart';
import '../module/transactions/transaction_view.dart';

class Transactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      Column buildValueColumn(String label, String value, MaterialColor color) {
      Color colorTitle = Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Container(
            padding: EdgeInsets.only(top: 26.0),
            child: new Text(
              label,
              style: new TextStyle(
                color: colorTitle,
              ),
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.only(bottom: 26.0),
            child: new Text(
              value,
              style: new TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.w400,
                color: color,
                
              ),
            ),
          ),
        ],
      );
    }

    Widget valueSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildValueColumn('Income', 'RM 1220', Colors.green),
          buildValueColumn('Expenses', 'RM 100', Colors.red),
        ],
      ),
    );
    
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(top: 26.0),
                child: new Text('Balance',
                  style: new TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              new Container(
                child: new Text('RM 1120',
                  style: new TextStyle(
                    fontSize: 30.0,
                    color: Colors.orangeAccent,
                  ),
                ),
              ),
            ],
          ),
          valueSection,
          new Container(
            color: Colors.grey,
            height: 26.0,
              // decoration: new BoxDecoration(
              //   color: Colors.grey,
              // ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Center(
                    child: new Text(
                'Transaction History',
                style: new TextStyle(
                  color: Colors.white,
                ),
                ),
                  )
                ],
              )

          ),
          new Expanded(
            child: new TransactionList(),
          )
          
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () { _showTransactionForm(context); }
      ),
    );
  }

  void _showTransactionForm(BuildContext context) {
    Navigator.of(context).push( new FromRightToLeft(
      builder: (context) => new TransactionForm() 
    ));
  }
}

