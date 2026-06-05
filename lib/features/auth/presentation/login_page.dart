import 'package:easy_vet/features/auth/presentation/login_state.dart';
import 'package:easy_vet/features/auth/presentation/login_view_model.dart';
import 'package:easy_vet/features/main/presentation/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginViewModel, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            );
          }

          if (state is LoginFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16.0,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: TextField(
                      controller: password,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          context.read<LoginViewModel>().login(
                            email.text,
                            password.text,
                          );
                        },
                        child: Text('Login'),
                      ),
                    ),
                  ),
                ],
              ),
              if (state is LoginLoading)
                const Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
    );
  }
}
