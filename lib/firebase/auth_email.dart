import 'package:flutter/material.dart';

class AuthScreenState extends StatefulWidget {
  const AuthScreenState({super.key});

  @override
  State<AuthScreenState> createState() => _AuthScreenStateState();
}

class _AuthScreenStateState extends State<AuthScreenState> {
  var _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.outlineVariant,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 300,
                    child: Image.asset('assets/pic one.jpg'),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            label: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text('Email Id'),
                            ),
                            border: InputBorder.none),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              !value.contains('@')){
                            return 'Please Enter Valid Email.';
                          }
                          return null;
                        },

                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          label: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text('Password'),
                          ),
                          border: InputBorder.none),
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                      validator: (value) {
                        if (value == null ||
                            value.trim().length < 6 ||
                            !value.contains('@')){
                          return 'Password Must Be 6 Characters';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isLoading = !_isLoading;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      child: Text(
                        _isLoading ? 'Login' : 'Sign Up',
                        style: TextStyle(
                            color: Colors.yellow.shade300,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                  SizedBox(height: 40),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          _isLoading = !_isLoading;
                        });
                      },
                      child: Text(_isLoading
                          ? 'Create an a Account'
                          : 'Already Have an Account'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
