import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FormValidator(),
      child: MaterialApp(
        home: Scaffold(
          body: Consumer<FormValidator>(builder: (context, formValidator, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextFormField(
                    onChanged: (value) {
                      formValidator.setInputText(value);
                    },
                    validator: (value) {
                      return formValidator.validateInput(value!);
                    },
                    decoration: InputDecoration(
                      errorText: formValidator.validateInput(formValidator.inputTitle),
                      hintText: 'Email',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextFormField(
                    onChanged: (value) {
                      formValidator.setInputTextPassword(value);
                    },
                    validator: (value) {
                      return formValidator.validateInputPassword(value!);
                    },
                    decoration: InputDecoration(
                      errorText: formValidator.validateInputPassword(formValidator._inputTitlePassword),
                      hintText: 'Password',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextButton(
                  onPressed: () {},
                  child: Text('Login'),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class FormValidator with ChangeNotifier {
  String _inputTitle = "";

  String get inputTitle => _inputTitle;

  setInputText(String text) {
    _inputTitle = text;
    notifyListeners();
  }

  String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Some Text';
    }
    return null;
  }

  String _inputTitlePassword = "";

  String get inputTitlePassword => _inputTitlePassword;

  setInputTextPassword(String text) {
    _inputTitlePassword = text;
    notifyListeners();
  }

  String? validateInputPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Some Text';
    }
    return null;
  }
}
