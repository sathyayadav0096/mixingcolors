import 'package:flutter/material.dart';

class StacClass extends StatelessWidget {
  const StacClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Stack Creation'),
      ),
      body: Center(
        child: Stack(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.verified_user,
                size: 30,
                color: Colors.white,
              ),
            ),
            Positioned(
              top: 60,
              right: 10,
              child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
