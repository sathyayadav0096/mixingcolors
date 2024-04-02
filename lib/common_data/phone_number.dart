import 'package:flutter/material.dart';
import 'package:mixingcolors/common_data/text_common.dart';

class PhoneNumberWhite extends StatefulWidget {
  PhoneNumberWhite({super.key});

  @override
  State<PhoneNumberWhite> createState() => _PhoneNumberWhiteState();
}

class _PhoneNumberWhiteState extends State<PhoneNumberWhite> {
  String defaultCountryCode = '+91';

  List<String> countryCodes = ['+91', '+92', '+93', '+94'];

  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text10('Phone Number'),
        const SizedBox(
          height: 7,
        ),
        Row(
          children: [
            Container(
              height: 35,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )),
              child: Container(
                height: 35,
                // reduce the line
                margin: const EdgeInsets.only(right: 2.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    )),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: DropdownButton<String>(
                  value: defaultCountryCode,
                  onChanged: (newValue) {
                    setState(() {
                      defaultCountryCode = newValue!;
                    });
                  },
                  items: countryCodes.map((code) {
                    return DropdownMenuItem<String>(
                      value: code,
                      child: Text10(code),
                    );
                  }).toList(),
                  underline: Container(
                    height: 0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 35,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                child: const TextField(
                  decoration: InputDecoration(
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(fontSize: 11),
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ))),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
