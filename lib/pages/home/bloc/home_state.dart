part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
  });

  final String name;
  final String email;
  final String subject;
  final String message;

  HomeState copyWith({
    String? name,
    String? email,
    String? subject,
    String? message,
  }) {
    return HomeState(
        name: name ?? this.name,
        email: email ?? this.email,
        subject: subject ?? this.subject,
        message: message ?? this.message);
  }

  @override
  List<Object> get props => [name, email, subject, message];
}

class HomeInitial extends HomeState {
  const HomeInitial()
      : super(
          name: "",
          email: "",
          subject: "",
          message: "",
        );
}

class EmailSentState extends HomeState {
  const EmailSentState()
      : super(
    name: "",
    email: "",
    subject: "",
    message: "",
  );
}
