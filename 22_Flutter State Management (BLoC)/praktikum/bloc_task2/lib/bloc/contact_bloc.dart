import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/Contact.dart';
import '../models/contact_model.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial(contacts: [...Contact.currentContact])) {
    on<ContactEvent>((event, emit) async {
      if (event is FailedContact) {
        emit(Failed(contacts: state.contacts));
      } else {
        emit(Loading(contacts: state.contacts));
      }
      await Future.delayed(const Duration(seconds: 2));
      if (event is AddContact) {
        emit(Loaded(contacts: [...state.contacts, event.contact]));
      } else if (event is RemoveContact) {
        emit(Loaded(contacts: [...state.contacts..removeAt(event.index)]));
      } else if (event is EditContact) {
        emit(Loaded(contacts: [
          ...state.contacts..[event.index].name = event.contact.name
        ]));
        emit(Loaded(contacts: [
          ...state.contacts
            ..[event.index].numberPhone = event.contact.numberPhone
        ]));
      } else {
        emit(Loaded(contacts: state.contacts));
      }
    });
  }
}
