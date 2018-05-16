import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../data/client/client_data.dart';
import '../helpers/AnimationRightToLeft.dart';
import 'client_presenter.dart';
import 'client_detail_view.dart';


class ClientList extends StatefulWidget {
  ClientList({Key key}) : super(key : key);

  @override
  _ClientListState createState() => new _ClientListState();
}

class _ClientListState extends State<ClientList> implements ClientListViewContract {
  ClientListPresenter _presenter;

  List<Client> _clients;

  bool _isSearching;

  _ClientListState() {
    _presenter = new ClientListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isSearching = true;
    _presenter.loadClients();
  }

    @override
  void onLoadClientsComplete(List<Client> items) {

    setState(() {
      _clients = items;
      _isSearching = false;
    });

  }

  @override
  void onLoadClientsError() {
    // TODO: implement onLoadContactsError
  }
  
  @override
  Widget build(BuildContext context) {
        Widget widget ;

    if(_isSearching) {
      widget = new Center(
        // child: new Padding(
        //   padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        //   child: new CircularProgressIndicator()
        // )
      );
    }else {
      widget = new ListView(
            padding: new EdgeInsets.symmetric(vertical: 8.0),
            children: _buildClientList()
      );
    }
    return widget;
  }

  List<_ClientListItem> _buildClientList() {
    return _clients.map((client) =>
     new _ClientListItem(
       client: client,
       onTap: () { _showClientPage(context, client); }
     ))
    .toList();
  }

  void _showClientPage(BuildContext context, Client client) {
    Navigator.push(context, new FromRightToLeft<Null>(
      settings: const RouteSettings(name: ClientPage.routeName),
      builder: (BuildContext context) => new ClientPage(client)
    ));
  }

}

class _ClientListItem extends ListTile {
  _ClientListItem({ @required Client client,
                     @required GestureTapCallback onTap}) :
  super(
    title : new Text(client.fullName),
    subtitle: new Text(client.email),
    leading: new CircleAvatar(
      child: new Text(client.fullName[0])
    ),
    onTap: onTap
  );
}