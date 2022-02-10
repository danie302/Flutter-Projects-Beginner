import 'package:flutter/material.dart';
import 'package:fl_widgets/widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'username': '',
      'password': '',
      'email': '',
      'role': '',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs and Forms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomInputField(
                    hintText: 'Hint me',
                    labelText: 'Username',
                    helperText: 'Min 3 chars',
                    icon: Icons.supervised_user_circle_outlined,
                    formValues: formValues,
                    formProperty: 'username'),
                const SizedBox(height: 30.0),
                CustomInputField(
                    labelText: 'Email',
                    hintText: 'Hint me',
                    helperText: 'Valid email',
                    keyboardType: TextInputType.emailAddress,
                    icon: Icons.mail_outline_outlined,
                    formValues: formValues,
                    formProperty: 'email'),
                const SizedBox(height: 30.0),
                CustomInputField(
                    obscureText: true,
                    hintText: 'Secret',
                    labelText: 'Password',
                    helperText: 'Valid pass',
                    icon: Icons.password_outlined,
                    formValues: formValues,
                    formProperty: 'password'),
                const SizedBox(height: 30.0),
                DropdownButtonFormField<String>(
                  items: const [
                    DropdownMenuItem(
                      child: Text('Admin'),
                      value: 'Admin',
                    ),
                    DropdownMenuItem(
                      child: Text('Dev'),
                      value: 'Dev',
                    ),
                    DropdownMenuItem(
                      child: Text('PM'),
                      value: 'PM',
                    ),
                  ],
                  onChanged: (value) {
                    formValues['role'] = value ?? 'Admin';
                  },
                  value: 'Admin',
                ),
                const SizedBox(height: 30.0),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (!formKey.currentState!.validate()) {
                        print('Form is not valid');
                        return;
                      }
                      print(formValues);
                    },
                    child: const Center(child: Text('Submit')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
