import 'dart:async';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

import '../helpers/custom_button.dart';
import '../../transaction/util/date_util.dart';

import 'package:intl/intl.dart';
// import 'package:meta/meta.dart';
import '../../data/product/product_data.dart';
import '../../transaction/db/category_provider.dart';
import '../../transaction/db/todo_provider.dart';
import '../../transaction/model/category.dart';
import '../../transaction/model/header.dart';
import '../../transaction/model/item.dart';
import '../../transaction/model/todo.dart';
import '../../transaction/model/product_history.dart';
import '../../transaction/model/view_type.dart';

import '../../screens/about.dart';

class _Restock {
  String dsc = '';
  String amn = '';

  _Restock({this.dsc, this.amn});
}

class ProductPage extends StatefulWidget {
  static const String routeName = '/product';

  Product _product = new Product();

  ProductPage(this._product);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final DateFormat formatter = new DateFormat.yMMMMd("en_US");
  DateTime _fromDateTime = new DateTime.now();
  DateTime _dateTime = new DateTime.now();
  _Restock _restock = _Restock();

  TextEditingController desc = TextEditingController();
  TextEditingController amnt = TextEditingController();
  bool showAddStock = false;
  List<String> stockHistoryList = [];

  @override
  Widget build(BuildContext context) {
    // final double statusBarHeight = MediaQuery.of(context).padding.top;

    return new Theme(
        data: new ThemeData(
            brightness: Brightness.light, primarySwatch: Colors.teal),
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text(widget._product.productName),
            actions: <Widget>[_addStockButton()],
          ),
          body: _createBody(),
          floatingActionButton: new FloatingActionButton(
            child: const Icon(Icons.save),
            onPressed: () {
              _saveProductForm(context);
            },
          ),
        ));
  }

  Widget _createBody() {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        _createFormDetails(),
//        _addStockForm(),
        _createInventoryHistory()
      ],
    );
  }

  Widget _addStockButton() {
    return new IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _restockForm();
          });
        });
  }

  _restockForm() {
    return showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: Text('Add Stock', textAlign: TextAlign.center),
              content: new SingleChildScrollView(
                child: new ListBody(
                  children: <Widget>[
                    CustRadBut(),
                    TextFormField(
                      controller: desc,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        border: InputBorder.none,
                        hintText: 'add description',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      controller: amnt,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        border: InputBorder.none,
                        hintText: 'add value',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.0),
                    new DateTimeItem(
                        dateTime: _fromDateTime,
                        onChanged: (DateTime value) {
                          setState(() {
                            _fromDateTime = value;
                          });
                        }
                    ),
                    new ListTile(
                      leading: new Icon(Icons.today, color: Colors.grey[500]),
                      title: new DateTimeItem(
                        dateTime: _dateTime,
                        onChanged: (dateTime) => setState(() => _dateTime = dateTime),
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    amnt.clear();
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    stockHistoryList.add(amnt.text);
                    amnt.clear();
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }

  Widget _createFormDetails() {
    return new SafeArea(
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
                  filled: false,
                  prefixIcon: const Padding(
                    padding: const EdgeInsetsDirectional.only(end: 16.0),
                    child: Icon(Icons.toys),
                  ),
                  hintText: 'Product name',
                  // labelText: 'Product Name',
                ),
                initialValue: widget._product.productName,
              ),
              new Divider(
                height: 5.0,
                color: Colors.grey,
              ),
              // const SizedBox(height: 24.0),
              new TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  filled: false,
                  prefixIcon: const Padding(
                    padding: const EdgeInsetsDirectional.only(end: 16.0),
                    child: Icon(Icons.description),
                  ),
                  hintText: 'Describe your product.',
                  // labelText: 'Product Details',
                ),
                initialValue: widget._product.productDetails,
              ),
              new Divider(
                height: 5.0,
                color: Colors.grey,
              ),
              // const SizedBox(height: 24.0),
              new TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  filled: false,
                  prefixIcon: const Padding(
                    padding: const EdgeInsetsDirectional.only(end: 16.0),
                    child: Icon(Icons.monetization_on),
                  ),
                  hintText: 'What is the cost price?',
                  // labelText: 'Cost Price',
                  suffixText: 'MYR',
                  suffixStyle: const TextStyle(color: Colors.green),
                ),
                keyboardType: TextInputType.phone,
                initialValue: widget._product.productCostPrice,
              ),
              new Divider(
                height: 5.0,
                color: Colors.grey,
              ),
              // const SizedBox(height: 24.0),
              new TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  filled: false,
                  prefixIcon: const Padding(
                    padding: const EdgeInsetsDirectional.only(end: 16.0),
                    child: Icon(Icons.attach_money),
                  ), // labelText: 'Sell Price',
                  suffixText: 'MYR',
                  suffixStyle: const TextStyle(color: Colors.green),
                ),
                keyboardType: TextInputType.number,
                initialValue: widget._product.productSellPrice,
              ),
              new Divider(
                height: 5.0,
                color: Colors.grey,
              ),
              // const SizedBox(height: 24.0),
              new Row(
                children: <Widget>[
                  Flexible(
                    child: new TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        filled: false,
                        prefixIcon: const Padding(
                          padding: const EdgeInsetsDirectional.only(end: 16.0),
                          child: Icon(Icons.grade),
                        ),
                        hintText: 'How many items in stock?',
                        suffixText: 'pcs',
                        suffixStyle: const TextStyle(color: Colors.green),
                      ),
                      initialValue: widget._product.productQuantity,
                    ),
                  ),
                ],
              ),

              new Divider(height: 5.0, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }


  Widget _createInventoryHistory() {
    return Column(
      children: <Widget>[_inventoryHistoryTitle(), _inventoryHistoryList()],
    );
  }

  Widget _inventoryHistoryTitle() {
    return new Container(
        padding: EdgeInsets.only(top: 24.0),
        child: Text(
          'Inventory History',
          style: TextStyle(color: Colors.grey[500], fontSize: 18.0),
        ));
  }

  Widget _inventoryHistoryList() {
    return Container(
        height: 300.0,
        margin: EdgeInsets.all(24.0),
//        decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(24.0),
//            border: Border(
//              top: BorderSide(
//                  style: BorderStyle.solid, color: const Color(0xFFFFDFDFDF)),
//              bottom: BorderSide(
//                  style: BorderStyle.solid, color: const Color(0xFFFFDFDFDF)),
//              left: BorderSide(
//                  style: BorderStyle.solid, color: const Color(0xFFFFDFDFDF)),
//              right: BorderSide(
//                  style: BorderStyle.solid, color: const Color(0xFFFFDFDFDF)),
//            )),
        child: Card(
          child: ListView.builder(
//            shrinkWrap: true,
            itemCount: stockHistoryList.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Restock',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text('${stockHistoryList[index]} pcs')
                ],
              );
//              return _createItemByViewType(stockHistoryList[index]);
            },
          ),
        ));
  }

  void _saveProductForm(BuildContext context) {
    Navigator.pop(context);
  }
}



class DateTimeItem extends StatelessWidget {
  DateTimeItem({ Key key, DateTime dateTime, @required this.onChanged })
      : assert(onChanged != null),
        date = new DateTime(dateTime.year, dateTime.month, dateTime.day),
        time = new TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        super(key: key);

  final DateTime date;
  final TimeOfDay time;
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return new DefaultTextStyle(
        style: theme.textTheme.subhead,
        child: new Row(
            children: <Widget>[
              new Expanded(
                  child: new Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      decoration: new BoxDecoration(
                          border: new Border(bottom: new BorderSide(color: theme.dividerColor))
                      ),
                      child: new InkWell(
                          onTap: () {
                            showDatePicker(
                                context: context,
                                initialDate: date,
                                firstDate: date.subtract(const Duration(days: 30)),
                                lastDate: date.add(const Duration(days: 30))
                            )
                                .then<Null>((DateTime value) {
                              if (value != null)
                                onChanged(new DateTime(value.year, value.month, value.day, time.hour, time.minute));
                            });
                          },
                          child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Text(new DateFormat('EEE, MMM d yyyy').format(date)),
                                const Icon(Icons.arrow_drop_down, color: Colors.black54),
                              ]
                          )
                      )
                  )
              ),
              new Container(
                  margin: const EdgeInsets.only(left: 8.0),
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  decoration: new BoxDecoration(
                      border: new Border(bottom: new BorderSide(color: theme.dividerColor))
                  ),
                  child: new InkWell(
                      onTap: () {
                        showTimePicker(
                            context: context,
                            initialTime: time
                        )
                            .then<Null>((TimeOfDay value) {
                          if (value != null)
                            onChanged(new DateTime(date.year, date.month, date.day, value.hour, value.minute));
                        });
                      },
                      child: new Row(
                          children: <Widget>[
                            new Text('${time.format(context)}'),
                            const Icon(Icons.arrow_drop_down, color: Colors.black54),
                          ]
                      )
                  )
              )
            ]
        )
    );
  }
}

class DateTimeItem1 extends StatelessWidget {
  DateTimeItem1({Key key, DateTime dateTime, @required this.onChanged})
      : assert(onChanged != null),
        date = dateTime == null
            ? new DateTime.now()
            : new DateTime(dateTime.year, dateTime.month, dateTime.day),
        time = dateTime == null
            ? new DateTime.now()
            : new TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        super(key: key);

  final DateTime date;
  final TimeOfDay time;
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Expanded(
          child: new InkWell(
            onTap: (() => _showDatePicker(context)),
            child: new Padding(
                padding: new EdgeInsets.symmetric(vertical: 8.0),
                child: new Text(new DateFormat('EEEE, MMMM d').format(date))),
          ),
        ),
        new InkWell(
          onTap: (() => _showTimePicker(context)),
          child: new Padding(
              padding: new EdgeInsets.symmetric(vertical: 8.0),
              child: new Text('$time')),
        ),
      ],
    );
  }

  Future _showDatePicker(BuildContext context) async {
    DateTime dateTimePicked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: date.subtract(const Duration(days: 20000)),
        lastDate: new DateTime.now());

    if (dateTimePicked != null) {
      onChanged(new DateTime(dateTimePicked.year, dateTimePicked.month,
          dateTimePicked.day, time.hour, time.minute));
    }
  }

  Future _showTimePicker(BuildContext context) async {
    TimeOfDay timeOfDay =
    await showTimePicker(context: context, initialTime: time);

    if (timeOfDay != null) {
      onChanged(new DateTime(
          date.year, date.month, date.day, timeOfDay.hour, timeOfDay.minute));
    }
  }
}