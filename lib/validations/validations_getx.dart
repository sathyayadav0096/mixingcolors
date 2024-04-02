
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../ritch_text/ritch_test.dart';

class ValidationsUsingGetx extends StatefulWidget {
  const ValidationsUsingGetx({super.key});

  @override
  State<ValidationsUsingGetx> createState() => _ValidationsUsingGetxState();
}

class _ValidationsUsingGetxState extends State<ValidationsUsingGetx> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validation'),
        leading: IconButton(
          onPressed: () {
            Get.changeTheme(
                Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
          },
          icon: const Icon(Icons.dark_mode),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (GetUtils.isEmail(value!)) {
                      return null;
                    }
                    return 'Enter Valid Email';
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      hintText: 'Email',
                      // label: Text('Label Email'),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (GetUtils.isAlphabetOnly(value!)) {
                      return null;
                    }
                    return 'Enter Valid Name';
                  },
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      hintText: 'Name',
                      //label: Text('Label name'),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      hintText: 'Phone Number', border: OutlineInputBorder()),
                  validator: (value) {
                    if (GetUtils.isPhoneNumber(value!) && value.length == 10) {
                      return null;
                    }
                    return 'Enter Correct Number';
                  },
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10)
                  ],
                ),
                const SizedBox(height: 100),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // all correct this will execute
                      } else {
                        // if it is invalid this will execute
                        (const Text('Enter Valid Details'));
                      }
                      print('Details Has Been Saved');
                    },
                    child: const Text('SignUp')),
                ElevatedButton(onPressed: (){
                  Get.to(Mana());
                }, child: Text('Off Getx Testing'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
