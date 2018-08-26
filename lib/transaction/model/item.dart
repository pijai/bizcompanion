// import 'package:transaction/model/view_type.dart';


import 'view_type.dart';

abstract class Item {
  ViewType getViewType();
}

abstract class ItemProduct {
  ViewTypeProduct getViewType();
}

