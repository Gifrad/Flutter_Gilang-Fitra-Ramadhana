import 'package:flutter/foundation.dart';
import 'package:task2/models/people.dart';
import 'package:task2/data/contact.dart';

class ContactProvider with ChangeNotifier{
  final List<People> _contacts =[...Contact.dataPeople];

  List<People> get contacts => _contacts;

  void addContact(People contact){
    _contacts.add(contact);
    notifyListeners();
  }

  void removeContact(int data){
    _contacts.removeAt(data);
    notifyListeners();
  }

  void editContact(int index, People data){
    _contacts[index].name = data.name;
    _contacts[index].numberPhone = data.numberPhone;
    notifyListeners();
  }
}