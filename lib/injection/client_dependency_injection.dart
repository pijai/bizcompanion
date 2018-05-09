import '../data/client/client_data.dart';
// import '../data/client/client_data_impl.dart';
import '../data/client/client_data_mock.dart';


enum Flavor {
  MOCK,
  PROD
}

class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  ClientRepository get clientRepository {
    switch (_flavor) {
      case Flavor.MOCK: 
      return new MockClientRepository();
      default: //Flavor.PROD;
      return new MockClientRepository();
    }
  }
}