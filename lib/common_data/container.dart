import 'package:flutter/material.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0XFFC61236))),
      height: 18,
      width: 45,
      child: const Center(
        child: Text(
          'Resend',
          style: TextStyle(fontSize: 8, color: Color(0XFFC61236)),
        ),
      ),
    );
  }
}
