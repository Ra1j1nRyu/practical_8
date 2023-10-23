import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_bloc.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthAuthenticated) {
          return Container(
            child: Center(
              child: Text('Пользователь успешно аутентифицирован!'),
            ),
          );
        } else if (state is AuthError) {
          return Container(
            child: Center(
              child: Text('Ошибка: ${state.error}'),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(title: Text('Регистрация')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(labelText: 'Имя пользователя'),
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Пароль'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final username = usernameController.text;
                      final password = passwordController.text;
                      context.read<AuthBloc>().add(AuthLoginEvent(username, password));
                    },
                    child: Text('Войти'),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
