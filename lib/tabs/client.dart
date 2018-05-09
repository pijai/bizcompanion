import 'package:flutter/material.dart';

import '../module/clients/client_form.dart';
import '../module/clients/client_view.dart';
import '../module/helpers/AnimationRightToLeft.dart';


class ClientTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new ClientList(),
        floatingActionButton: new FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () { _addClientForm(context); }
        ),
      );
  }

  void _addClientForm(BuildContext context) {
    Navigator.push(context, new FromRightToLeft(
      builder: (context) => new ClientForm()
    ));
  }
}





// class ClientList extends StatelessWidget {
//   final List<Client> _clients;

//   ClientList(this._clients);

//   @override
//   Widget build(BuildContext context) {
//     return new ListView(
//           padding: new EdgeInsets.symmetric(vertical: 8.0),
//           children: _buildClientList()
//         );
//   }

//   List<_ClientListItem> _buildClientList() {
//     return _clients.map((client) => new _ClientListItem(client))
//                     .toList();
//   }

// }

// class _ClientListItem extends ListTile {

//   _ClientListItem(Client client) :
//     super(route
//       title : new Text(client.fullName),
//       subtitle: new Text(client.email),
//       leading: new CircleAvatar(
//         child: new Text(client.fullName[0])
//       )
//     );

// }