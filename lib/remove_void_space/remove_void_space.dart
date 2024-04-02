import 'package:flutter/material.dart';

class VoidSpaceRemoving extends StatelessWidget {
  const VoidSpaceRemoving({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              '   Some Text with Extra Spaces   '.trim(),
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
