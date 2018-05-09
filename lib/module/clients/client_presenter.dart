import '../../data/client/client_data.dart';
import '../../injection/client_dependency_injection.dart';

abstract class ClientListViewContract {
  void onLoadClientsComplete(List<Client> items);
  void onLoadClientsError();
}

class ClientListPresenter {
  ClientListViewContract _view;
  ClientRepository _repository;

  ClientListPresenter(this._view) {
    _repository = new Injector().clientRepository;
  }

  void loadClients(){
    assert(_view != null);

    _repository.fetch()
    .then((clients) => _view.onLoadClientsComplete(clients))
    .catchError((onError) {
      print(onError);
      _view.onLoadClientsError();
    });
  }
}