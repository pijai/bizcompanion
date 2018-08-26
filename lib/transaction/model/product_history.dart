// import 'package:transaction/model/item.dart';
// import 'package:transaction/model/view_type.dart';

import 'item.dart';
import 'view_type.dart';


class ProductHistory implements ItemProduct {
  String amount;
  String date;
  // bool done;

  ProductHistory({this.amount, this.date});
  // Todo({this.note, this.amount, this.done = false, this.date});

  @override
  ViewTypeProduct getViewType() {
    return ViewTypeProduct.PRODUCTHISTORY;
  }

}
