import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class CommonDottedVertical extends StatelessWidget {
  const CommonDottedVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return const DottedLine(
      direction: Axis.vertical,
      lineLength: 40,
      lineThickness: 4.0,
      dashColor: Color(0XFF86839B),
      dashGapLength: 6,
    );
  }
}


class CommonDottedHorizontal extends StatelessWidget {
  const CommonDottedHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return const DottedLine(
      direction: Axis.horizontal,
      lineLength: double.infinity,
      lineThickness: 1,
      dashColor: Color(0XFF86839B),
      dashGapLength: 6,
    );
  }
}