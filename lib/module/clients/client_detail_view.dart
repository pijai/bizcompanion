import 'package:flutter/material.dart';
import '../../data/client/client_data.dart';
// import '../../widget/app_bar.dart';


class ClientPage extends StatelessWidget {

  static const String routeName = '/client';

  final Client _client;

  ClientPage(this._client);

  @override
  Widget build(BuildContext context) {
    // final double statusBarHeight = MediaQuery.of(context).padding.top;

    return new Theme(
      data: new ThemeData(
        brightness: Brightness.light,
        primarySwatch: _client.gender == 'male' ? Colors.teal : Colors.pink,
      ),
      
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('Client Details'),
        ),
        // appBar: new FlexibleAppBar(_client.fullName, _client.imgUrl),
        body: new SafeArea(
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
                    icon: const Icon(Icons.person),
                    border: InputBorder.none,
                    filled: true,
                    hintText: 'Client Name',
                  ),
                  initialValue: _client.fullName,
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.description),
                    border: InputBorder.none,
                    filled: true,
                    hintText: 'Client Details',
                  ),
                  initialValue: _client.description,
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,                    
                    icon: const Icon(Icons.nature_people),
                    hintText: 'Gender',
                  ),
                  initialValue: _client.gender,
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    icon: const Icon(Icons.email),
                    hintText: 'E-Mail',
                  ),
                  initialValue: _client.email,
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    icon: const Icon(Icons.phone),
                    hintText: 'Contact Number',
                  ),
                  keyboardType: TextInputType.phone,
                  initialValue: _client.phones,
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    icon: const Icon(Icons.home),
                    hintText: 'Address',
                  ),
                  initialValue: _client.location,
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    icon: const Icon(Icons.note_add),
                    hintText: 'Notes',
                  ),
                  initialValue: _client.notes,
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    icon: const Icon(Icons.report_problem),
                    hintText: 'Problem Category',
                  ),
                  initialValue: _client.problems,
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    prefixIcon: const Padding(
                      padding: const EdgeInsetsDirectional.only(end: 16.0),
                      child: Icon(Icons.sync_problem),
                    ),  
                    hintText: 'Problem Details',
                  ),
                  initialValue: _client.problemDetails,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () { _saveClientForm(context); },
      ),
      )
    );
  }

  void _saveClientForm(BuildContext context) {
    Navigator.pop(context);
  }
}
