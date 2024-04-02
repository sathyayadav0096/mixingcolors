import 'package:flutter/material.dart';

class Mana extends ChangeNotifier {

  Widget buildRichText(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Rich Text Example'),
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Center(
        child: RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(
                text: 'Hello ',
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              TextSpan(
                text: 'world!',
                style:
                TextStyle(fontStyle: FontStyle.italic, color: Colors.red),
              ),
              TextSpan(
                text: ' This is a sample rich text.',
                style: TextStyle(
                    fontWeight: FontWeight.normal, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
