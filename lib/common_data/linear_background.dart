import 'package:flutter/material.dart';

class LinearBackground extends StatelessWidget {
  final Widget child;
  final bool noPadding;

  const LinearBackground({super.key, required this.child,this.noPadding=false});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF3A1717),
              Color(0xFF720026),
              Color(0xFFF35D1A),
              Color(0xFFFF6724),
            ],
            stops: [0, 0.3438, 0.6927, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            transform: GradientRotation(3.06),
          ),
        ),
        child: Padding(
          padding:noPadding? EdgeInsets.all(1.0):EdgeInsets.all(20.0),
          child: child,
        ),
      ),
    );
  }
}
