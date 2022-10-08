part of 'contact_bloc.dart';

abstract class ContactState extends Equatable {
  final List<ContactModel> contacts;

  const ContactState({required this.contacts});

  @override
  List<Object> get props => [contacts];
}

class ContactInitial extends ContactState {
  const ContactInitial({required super.contacts});
}

class Loading extends ContactState {
  const Loading({required super.contacts});
}

class Loaded extends ContactState {
  const Loaded({required super.contacts});
}

class Failed extends ContactState {
  const Failed({required super.contacts});
}
