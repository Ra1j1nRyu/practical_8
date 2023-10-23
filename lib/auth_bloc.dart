import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthAuthenticated extends AuthState {}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String error;

  AuthError(this.error);

  @override
  List<Object> get props => [error];
}

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthLoginEvent extends AuthEvent {
  final String username;
  final String password;

  AuthLoginEvent(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}

class AuthLogoutEvent extends AuthEvent {}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthLoginEvent) {
      final username = event.username;
      final password = event.password;

      // Пример: Фиксированные учетные данные для аутентификации
      if (username == 'Ra1j1nRyu' && password == 'practice8') {
        yield AuthAuthenticated();
      } else {
        yield AuthError('Неверное имя пользователя или пароль');
      }
    } else if (event is AuthLogoutEvent) {
      yield AuthUnauthenticated();
    }
  }
}
