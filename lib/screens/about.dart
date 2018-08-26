import 'package:flutter/material.dart';

import 'dart:async';

import 'package:intl/intl.dart';

// This demo is based on
// https://material.google.com/components/dialogs.html#dialogs-full-screen-dialogs


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

class About extends StatefulWidget {
  @override
  AboutState createState() => new AboutState();
}

class AboutState extends State<About> {
  DateTime _fromDateTime = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return new Scaffold(
//      appBar: new AppBar(
//          title: new Text('Calender DateTime'),
//      ),
      body: new Form(
          child: new ListView(
              padding: const EdgeInsets.all(16.0),
              children: <Widget>[
                new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text('From', style: theme.textTheme.caption),
                      new DateTimeItem(
                          dateTime: _fromDateTime,
                          onChanged: (DateTime value) {
                            setState(() {
                              _fromDateTime = value;
                            });
                          }
                      )
                    ]
                )
              ].map((Widget child) {
                return new Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    height: 96.0,
                    child: child
                );
              }).toList()
          )
      ),
    );
  }
}


// class About extends StatelessWidget {
//   @override
//   Widget build (BuildContext context) => new Scaffold(

//     //App Bar
//     appBar: new AppBar(
//       title: new Text(
//         'About', 
//         style: new TextStyle(
//           fontSize: Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
//         ),
//       ),
//       elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
//     ),

//     //Content of tabs
//     body: new PageView(
//       children: <Widget>[
//         new Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             new Text('About page content')
//           ],
//         )
//       ],
//     ),
//   );
// }