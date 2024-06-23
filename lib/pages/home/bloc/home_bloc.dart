import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {
    on<SaveDataNameEvent>(_onUsernameChanged);
    on<SaveDataEmailEvent>(_onEmailChanged);
    on<SaveDataSubjectEvent>(_onSubjectChanged);
    on<SaveDataMessageEvent>(_onMessageChanged);
    on<SaveDataEvent>(_onSendButton);
  }

  Future<void> _onUsernameChanged(
    SaveDataNameEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        name: event.name,
      ),
    );
  }

  Future<void> _onEmailChanged(
    SaveDataEmailEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        email: event.email,
      ),
    );
  }

  Future<void> _onSubjectChanged(
    SaveDataSubjectEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        subject: event.subject,
      ),
    );
  }

  Future<void> _onMessageChanged(
    SaveDataMessageEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        message: event.message,
      ),
    );
  }

  Future<void> _onSendButton(
    SaveDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    sendEmail(
        name: state.name,
        email: state.email,
        subject: state.subject,
        message: state.message);
    emit(
      const EmailSentState(),
    );
  }

  Future sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    const serviceId = 'service_vy89oam';
    const templateId = 'template_1w0gr3m';
    const userId = 'a0Hw_-nCTWoapxGiV';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': name,
            'user_email': email,
            'user_subject': subject,
            'user_message': message,
          }
        }));
  }
}
