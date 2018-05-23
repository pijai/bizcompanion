// import 'package:transaction/model/item.dart';
// import 'package:transaction/model/view_type.dart';

import 'item.dart';
import 'view_type.dart';


class Todo implements Item {
  static const String tableName = 'todo';

  static const String columnId = 'id';
  static const String columnNote = 'note';
  static const String columnAmount = 'amount';
  // static const String columnDone = 'done';
  static const String columnDate = 'date';
  static const String columnCategoryId = 'category_id';

  int id;
  String note;
  String amount;
  String date;
  // bool done;
int categoryId;

  Todo({this.note, this.amount, this.date});
  // Todo({this.note, this.amount, this.done = false, this.date});

  Map toMap() {
    return <String,dynamic>{
      columnNote: note,
      columnAmount: amount,
      // columnDone: done == true ? 1 : 0,
      columnDate: date,
      columnCategoryId: categoryId
    };
  }

  Todo.fromMap(Map map) {
    id = map[columnId];
    note = map[columnNote];
    amount = map[columnAmount];
    // done = map[columnDone] == 1;
    date = map[columnDate];
    categoryId = map[columnCategoryId];
  }

  @override
  ViewType getViewType() {
    return ViewType.TODO;
  }

}
