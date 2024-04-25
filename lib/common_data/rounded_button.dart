import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {
  final String name;
  final Function()? onPressed;
  final Widget? child;
  final double? width;
  final double? height;
  final double? padding;

  const RoundedButton(
      {super.key,
        required this.name,
        this.onPressed,
        this.child,
        this.width,
        this.padding,
        this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding != null ? EdgeInsets.all(padding ?? 0) : null,
          shape: const StadiumBorder(),
          backgroundColor: const Color(0xFFFF6724),
        ),
        // if child is null, then it take name for text
        child: child ??
            Text(
              name,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.w700),
            ),
      ),
    );
  }
}
