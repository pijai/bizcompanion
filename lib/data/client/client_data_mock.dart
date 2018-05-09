import 'dart:async';

import 'client_data.dart';


class MockClientRepository implements ClientRepository {

  Future<List<Client>> fetch() {
    return new Future.value(kClients);
  }
  
}

const kClients = const <Client>[
    const Client(
      fullName: 'Nik',
      description: 'ein nette frau',
      gender: 'female',
      email:'nik@example.com',
      phones: '0193171783',
      location: 'kedah',
      notes: 'anak dua husband satu jek',
      problems: 'suke hati',
      problemDetails: 'suka makan, suka tido'
    ),
    const Client(
      fullName: 'Mohd',
      description: 'ein netter man',
      gender: 'male',
      email:'mohd@example.com',
      phones: '0112109876',
      location: 'kl',
      notes: 'anak dua wife satu jek',
      problems: 'perampas hati',
      problemDetails: 'suka rampas hati wanita2 di luar sana'
    ),
    const Client(
      fullName: 'Hafizal',
      description: 'noch junge',
      gender: 'male',
      email:'hafizal@example.com',
      phones: '0193171783',
      location: 'selangor',
      notes: 'anak dua, wife satu jek',
      problems: 'mane ade problem',
      problemDetails: 'setiap masalah ade penyelesaian'
    ),
    const Client(
      fullName: 'Wahida',
      description: 'ein nette faru',
      gender: 'female',
      email:'wahida@example.com',
      phones: '0192222222',
      location: 'melaka',
      notes: 'anak dua, husband satu jek',
      problems: 'baguih bak hang',
      problemDetails: 'semoga dapat mendidik anak yang soleh.'
    ),
    const Client(
      fullName: 'Imann',
      description: 'ein netter Jung',
      gender: 'male',
      email:'imann@example.com',
      phones: '0123456789',
      location: 'selangor',
      notes: 'adik baru satu',
      problems: 'kuat bekawan',
      problemDetails: 'x suka makan'
    ),
    const Client(
      fullName: 'Iffat',
      description: 'ein netter jung',
      gender: 'male',
      email:'iffat@example.com',
      phones: '0111111111',
      location: 'selangor',
      notes: 'abang sorng jek',
      problems: 'cool sngt',
      problemDetails: 'ikut kepala dia'
    ),
    const Client(
      fullName: 'Zaleha',
      description: 'ein netter man',
      gender: 'female',
      email:'nik@example.com',
      phones: '0193171783',
      location: 'sungai petani, kedah',
      notes: 'anak dua wife satu jek',
      problems: 'cube tanye sket',
      problemDetails: 'suka makan, suka tido'
    ),
    const Client(
      fullName: 'Azizah',
      description: 'ein netter man',
      gender: 'female',
      email:'nik@example.com',
      phones: '0193171783',
      location: 'sungai petani, kedah',
      notes: 'anak dua wife satu jek',
      problems: 'cube tanye sket',
      problemDetails: 'suka makan, suka tido'
    ),
    const Client(
      fullName: 'Nik',
      description: 'ein netter man',
      gender: 'female',
      email:'nik@example.com',
      phones: '0193171783',
      location: 'sungai petani, kedah',
      notes: 'anak dua wife satu jek',
      problems: 'cube tanye sket',
      problemDetails: 'suka makan, suka tido'
    ),
    const Client(
      fullName: 'Mohd',
      description: 'ein netter man',
      gender: 'male',
      email:'nik@example.com',
      phones: '0193171783',
      location: 'sungai petani, kedah',
      notes: 'anak dua wife satu jek',
      problems: 'cube tanye sket',
      problemDetails: 'suka makan, suka tido'
    ),
    const Client(
      fullName: 'Hafizal',
      description: 'ein netter man',
      gender: 'male',
      email:'nik@example.com',
      phones: '0193171783',
      location: 'sungai petani, kedah',
      notes: 'anak dua wife satu jek',
      problems: 'cube tanye sket',
      problemDetails: 'suka makan, suka tido'
    ),
  ];