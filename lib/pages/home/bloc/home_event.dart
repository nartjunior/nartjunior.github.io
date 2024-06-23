part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class SaveDataNameEvent extends HomeEvent {
  const SaveDataNameEvent(this.name);

  final String name;

  @override
  List<Object> get props => [name];

}

class SaveDataEmailEvent extends HomeEvent {
  const SaveDataEmailEvent(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class SaveDataSubjectEvent extends HomeEvent {
  const SaveDataSubjectEvent(this.subject);

  final String subject;

  @override
  List<Object> get props => [subject];
}

class SaveDataMessageEvent extends HomeEvent {
  const SaveDataMessageEvent(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class SaveDataEvent extends HomeEvent {

}