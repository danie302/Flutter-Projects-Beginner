import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:products_app/styles/styles.dart';
import 'package:products_app/widgets/widgets.dart';
import 'package:products_app/screens/screens.dart';
import 'package:products_app/provider/auth_provider.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'register';

  const RegisterScreen({Key? key}) : super(key: key);

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
                      'Create an account',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(height: 30),
                    const _RegisterForm(),
                    const SizedBox(height: 50),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RegisterScreen.routeName);
                      },
                      style: _textButtonStyle(),
                      child: const Text(
                        'Already have an account',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
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

  ButtonStyle _textButtonStyle() {
    return ButtonStyle(
      overlayColor: MaterialStateProperty.all(
        Colors.indigo.withOpacity(0.1),
      ),
      shape: MaterialStateProperty.all(
        const StadiumBorder(),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Form(
      key: authProvider.registerFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(children: [
        TextFormField(
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) => authProvider.email = value,
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
          keyboardType: TextInputType.visiblePassword,
          onChanged: (value) => authProvider.password = value,
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
          onPressed: authProvider.isLoading
              ? null
              : () async {
                  FocusScope.of(context).unfocus();
                  if (!authProvider.isRegisterValidForm()) return;
                  authProvider.isLoading = true;
                  final errorMsg = await authProvider.register();
                  authProvider.isLoading = false;
                  if (errorMsg != null) return;
                  Navigator.pushReplacementNamed(
                      context, LoginScreen.routeName);
                },
          disabledColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.deepPurple,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            child: Text(
              authProvider.isLoading ? 'Loading...' : 'Register',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ]),
    );
  }
}
