import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:transaction/db/category_provider.dart';
// import 'package:transaction/db/todo_provider.dart';
// import 'package:transaction/model/category.dart';
// import 'package:transaction/model/todo.dart';
// import 'package:transaction/util/constants.dart';
import 'package:intl/intl.dart';

import '../db/category_provider.dart';
import '../db/todo_provider.dart';
import '../model/category.dart';
import '../model/todo.dart';
import '../util/constants.dart';

class NewTodo extends StatefulWidget {
  static final String routeName = '/new';
  final Todo todo;
  final DateFormat formatter = new DateFormat.yMMMMd("en_US");

  NewTodo({Key key, this.todo}) : super(key: key) {
    if (todo.date == null) {
      this.todo.date = formatter.format(new DateTime.now());
    }
  }

  _NewTodoState createState() => new _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<Category> _categoryList = [];
  Category _category;

  AppBar _createAppBar() => new AppBar(
      title: new Text(_getTitle()),
      actions: <Widget>[_createSaveUpdateAction()],
    );

  IconButton _createSaveUpdateAction() {
    return new IconButton(
      onPressed: () {
        _saveTodo();
      },
      icon: const Icon(Icons.save),
    );
  }

  _saveTodo() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      TodoProvider provider = new TodoProvider();
      widget.todo.categoryId = _category.id;
      if (!_isExistRecord()) {
        await provider.insert(widget.todo);
      } else {
        await provider.update(widget.todo);
      }
      Navigator.of(context).pop();
    }
  }

  bool _isExistRecord() {
    return widget.todo.id == null ? false : true;
  }

  @override
  void initState() {
    super.initState();
    new CategoryProvider().getAllCategory().then((categories) {
      setState(() {
        if (_isExistRecord())
          _category = categories
              .firstWhere((category) => category.id == widget.todo.categoryId);
        _categoryList = categories;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  String _getTitle() {
    return _isExistRecord() ? Constants.titleEdit : Constants.titleNew;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _createAppBar(),
      body: new Padding(
          padding: new EdgeInsets.fromLTRB(12.0, 18.0, 12.0, 18.0),
          child: new Form(
            // onWillPop: _warnUserWithoutSaving,
            key: _formKey,
            child: new Column(
              children: <Widget>[
                _createDatePicker(),
                 _categoryList.isNotEmpty?
                _createCategoryDropDownList(_categoryList):new Container(),
                _createNote(),
                new Divider(height: 5.0, color: Colors.grey,),
                const SizedBox(height: 24.0),
                _createAmount(),
                new Divider(height: 5.0, color: Colors.grey,)          
              ],
            ),
          )),
    );
  }

  Row _createDatePicker() {
    return new Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Icon(
          Icons.date_range,
          color: Theme.of(context).primaryColor,
        ),
        new InkWell(
          child: new Padding(
            padding: new EdgeInsets.only(
                left: 18.0, top: 8.0, bottom: 8.0, right: 18.0),
            child: new Text(
              widget.todo.date,
              style: new TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 14.0),
            ),
          ),
          onTap: _pickDateFromDatePicker,
        )
      ],
    );
  }

  Row _createCategoryDropDownList(List<Category> categories) {
    return new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Icon(
            Icons.list,
            color: Theme.of(context).primaryColor,
          ),
          new Padding(
              padding:
                  new EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
              child: new DropdownButtonHideUnderline(
                child: new DropdownButton(
                    value: _category ??
                        (categories.length > 0
                            ? _category = categories[0]
                            : null),
                    items: _createCategoryDropDownMenuItems(categories),
                    isDense: true,
                    onChanged: (value) {
                      setState(() => _category = value);
                    }),
              ))
        ]);
  }

  List<DropdownMenuItem<Category>> _createCategoryDropDownMenuItems(List<Category> categories) {
    return categories.map((category) {
      return new DropdownMenuItem(
          value: category,
          child: new Text(category.name,
              style: new TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 16.0)));
    }).toList();
  }

  _pickDateFromDatePicker() async {
    DateTime dateTime = widget.formatter.parse(widget.todo.date);
    DateTime dateTimePicked = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: isBeforeToday(dateTime) ? dateTime : new DateTime.now(),
        lastDate: dateTime.add(const Duration(days: 365)));

    if (dateTimePicked != null) {
      setState(() {
        widget.todo.date = widget.formatter.format(dateTimePicked);
      });
    }
  }

  bool isBeforeToday(DateTime date) {
    return date.isBefore(new DateTime.now());
  }

  Future<bool> _warnUserWithoutSaving() async {
    if (_isExistRecord()) {
      return true;
    } else {
      return await showDialog<bool>(
            context: context,
            child: new AlertDialog(
              title: const Text('Discard To do'),
              content:
                  const Text('Do you want close without saving to do note?'),
              actions: <Widget>[
                new FlatButton(
                  child: const Text('YES'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
                new FlatButton(
                  child: const Text('NO'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ],
            ),
          ) ??
          false;
    }
  }

  TextFormField _createNote() {
    return new TextFormField(
      textAlign: TextAlign.justify,
      // maxLines: 3,
      decoration: const InputDecoration(
        contentPadding: const EdgeInsets.all(4.0),
        icon: const Icon(Icons.note),
        hintText: 'Transaction details',
        border: InputBorder.none,
        // labelText: 'Transaction details',
      ),
      initialValue: widget.todo.note ?? '',
      keyboardType: TextInputType.text,
      // validator: _validateDesc,
      onSaved: _noteOnSave,
    );
  }

  String _validateDesc(String value) {
    return value.isEmpty ? 'Description is required' : null;
  }

  void _noteOnSave(String value) {
    widget.todo.note = value;
  }

  TextFormField _createAmount() => TextFormField(
    textAlign: TextAlign.justify,
    decoration: const InputDecoration(
      contentPadding: const EdgeInsets.all(4.0),
      icon: const Icon(Icons.monetization_on),
      hintText: 'Amount',
      suffixText: 'MYR',
      suffixStyle: const TextStyle(color: Colors.green),
      border: InputBorder.none
    ),
      initialValue: widget.todo.amount ?? '',
      keyboardType: TextInputType.phone,
      // validator: _validateAmount,
      onSaved: _amountOnSave,
  );

  void _amountOnSave(String value) {
    widget.todo.amount = value;
  }

  String _validateAmount(String value) {
    return value.isEmpty ? 'Amount cannot empty' : null;
  }
}