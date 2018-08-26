import 'package:flutter/material.dart';

class CustRadBut extends StatefulWidget {
  @override
  _CustRadButState createState() => _CustRadButState();
}

class _CustRadButState extends State<CustRadBut> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    print('current index is $_currentIndex');
    return new Column(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: new Center(
            child: new Container(
              decoration:
                  new BoxDecoration(border: new Border.all(color: Colors.blue)),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Sign In Button
                  new Expanded(
                  child: FlatButton(
                    textColor: _currentIndex == 0 ? Colors.white : Colors.black,
                    color: _currentIndex == 0 ? Colors.blue : Colors.white,
                    onPressed: () {
                      setState(() {
                        _currentIndex = 0;
                        
                      });
                    },
                    child: new Text("Restock"),
                  ),
                  ),
                  // Sign Up Button
                  new Expanded(
                    child: FlatButton(
                
                    color: _currentIndex == 1 ? Colors.blue : Colors.white,
                    textColor: _currentIndex == 1 ? Colors.white : Colors.black,
                    onPressed: () {
                      setState(() {
                        _currentIndex = 1;
                      });
                    },
                    child: new Text("Return"),
                  ),
                  )
                ],
              ),
            ),
            ),
          ),
        ],
      );
  }
}