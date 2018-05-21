// import 'package:transaction/model/item.dart';
// import 'package:transaction/model/view_type.dart';

import 'item.dart';
import 'view_type.dart';


class Header implements Item {
  final String date;
  Header({this.date});

  @override
  ViewType getViewType() {
    return ViewType.HEADER;
  }
}
