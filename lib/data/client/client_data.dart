import 'dart:async';
// import 'package:intl/intl.dart';

class Client {
  // static final DateFormat _formatter = new DateFormat ('MMMM d, yyyy');

  final String fullName;
  final String description;
  final String gender;
  final String email;
  // final String imgUrl;
  // final String birthday;
  final String location;
  final String phones;
  // final Location location;
  // final List<Phone> phones; 
  final String notes;
  final String problems;
  final String problemDetails;

  const Client({this.fullName, this.description, this.gender, this.email,
  this.location, this.phones, this.notes, this.problems, this.problemDetails});

  // Client.fromMap(Map<String, dynamic> map) :
  // fullName = "${map['name']['first']} ${map['name']['last']}",
  // gender = map['gender'],
  // email = map['email'],
  // imgUrl = map['picture']['large'],
  // birthday = _formatter.format(DateTime.parse(map['dob'])),
  // location = new Location.fromMap(map['location']),
  // phones = <Phone>[
  //   new Phone(type: 'Home', number: map['phone']),
  //   new Phone(type: 'Mobile', number: map['cell'])
  // ];
}

// class Phone {
//   final String type;
//   final String number;

//   Phone({this.type, this.number});
// }
  
// class Location {
//   final String street;
//   final String city;

//   Location(this.street, this.city);

//   Location.fromMap(Map<String, dynamic> map) :
//   street = map['street'],
//   city = map['city'];
// }

abstract class ClientRepository{
  Future <List<Client>> fetch();
}

class FetchDataException implements Exception {
  String _message;

  FetchDataException(this._message);

  String toString() {
    return "Exception: $_message";
  }
}