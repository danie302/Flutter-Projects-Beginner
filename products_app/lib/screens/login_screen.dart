import 'package:flutter/material.dart';

import 'package:products_app/styles/styles.dart';
import 'package:products_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.3),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Login',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(height: 30),
                    const Text('Form'),
                    const _LoginForm(),
                  ],
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(children: [
        TextFormField(
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecorations.authInputDecoration(
            icon: Icons.alternate_email_sharp,
            hintText: 'jhondoe@gmail.com',
            labelText: 'Email',
          ),
          validator: (value) {
            String pattern =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            RegExp regExp = RegExp(pattern);

            return value!.contains(regExp) ? null : 'Invalid email';
          },
        ),
        const SizedBox(height: 30),
        TextFormField(
          obscureText: true,
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecorations.authInputDecoration(
            icon: Icons.lock_outline_sharp,
            hintText: '********',
            labelText: 'Password',
          ),
          validator: (value) {
            return (value != null && value.length >= 6)
                ? null
                : 'Password must be at least 6 characters';
          },
        ),
        const SizedBox(height: 30),
        MaterialButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.deepPurple,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ]),
    );
  }
}
