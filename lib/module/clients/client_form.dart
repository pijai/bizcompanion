
import 'package:flutter/material.dart';
import '../../data/client/client_data.dart';

class ClientForm extends StatefulWidget {
  const ClientForm({ Key key }) : super(key: key);

  static const String routeName = '/clientForm';

  @override
  ClientFormState createState() => new ClientFormState();
}

class ClientFormState extends State<ClientForm> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Client client = new Client();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  void _handleSubmitted() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: const Text('Text fields'),
      ),
      body: new SafeArea(
        top: false,
        bottom: false,
        child: new Form(
          key: _formKey,
          child: new SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    filled: false,
                    icon: const Icon(Icons.person),
                    labelText: 'Client Name',
                  ),
                  onSaved: (String value) { client.fullName; },
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    filled: false,
                    icon: const Icon(Icons.description),
                    labelText: 'Client Details',
                  ),
                  onSaved: (String value) { client.description; },
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    filled: false,
                    icon: const Icon(Icons.nature_people),
                    labelText: 'Gender',
                  ),
                  onSaved: (String value) { client.gender; },
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    filled: false,
                    icon: const Icon(Icons.email),
                    labelText: 'E-Mail',
                  ),
                  onSaved: (String value) { client.email; },
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    filled: false,
                    icon: const Icon(Icons.phone),
                    labelText: 'Contact Number',
                  ),
                  onSaved: (String value) { client.phones; },
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    filled: false,
                    icon: const Icon(Icons.home),
                    labelText: 'Address',
                  ),
                  onSaved: (String value) { client.location; },
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    filled: false,
                    icon: const Icon(Icons.note_add),
                    labelText: 'Notes',
                  ),
                  onSaved: (String value) { client.notes; },
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    filled: false,
                    icon: const Icon(Icons.report_problem),
                    labelText: 'Problem Category',
                  ),
                  onSaved: (String value) { client.problems; },
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    filled: false,
                    icon: const Icon(Icons.sync_problem),
                    labelText: 'Problem Details',
                  ),
                  onSaved: (String value) { client.problemDetails; },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {_handleSubmitted();} ,
      ),
    );
  }
}