// import 'dart:async';
// import 'dart:convert';
// import 'client_data.dart';
// import 'package:http/http.dart' as http;


class RandomUserRepository {
// class RandomUserRepository implements ClientRepository {
  
  // static const _kRandomUserUrl = 'http://api.randomuser.me/?results=15';
  // final JsonDecoder _decoder = new JsonDecoder();

  // Future<List<Client>> fetch(){
  //   return http.get(_kRandomUserUrl)
  //   .then((http.Response response) {
  //     final String jsonBody = response.body;
  //     final statusCode = response.statusCode;

  //     if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
  //       throw new FetchDataException("Error while getting clients [StatusCode:$statusCode, Error:${response.statusCode}]");
  //     }

  //     final clientsContainer = _decoder.convert(jsonBody);
  //     final List clientItems = clientsContainer['results'];

  //     return clientItems.map( (clientRaw) => new Client.fromMap(clientRaw) )
  //     .toList();
  //   });
  // }
}
