import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class OnBoardCircle extends StatelessWidget {
  final bool isSelected;

  const OnBoardCircle({Key? key, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: CircleAvatar(
        backgroundColor:
            context.colorScheme.secondary.withOpacity(isSelected ? 1 : 0.2),
        radius: isSelected ? context.width * 0.015 : context.width * 0.01,
      ),
    );
  }
}
