part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddContact extends ContactEvent {
  final ContactModel contact;
  AddContact({required this.contact});
}

class RemoveContact extends ContactEvent {
  final int index;
  RemoveContact({required this.index});
}

class EditContact extends ContactEvent {
  final ContactModel contact;
  final int index;
  EditContact({required this.contact,required this.index});
}

class FailedContact extends ContactEvent {}
