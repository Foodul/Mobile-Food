import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';

class ChipTab extends StatelessWidget {
  final bool isSelected;
  final String text;
  final bool isBottomSheet;

  const ChipTab({
    Key? key,
    required this.isSelected,
    required this.text,
    required this.isBottomSheet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: context.lowValue),
      decoration: BoxDecoration(
        color: isSelected
            ? context.colorScheme.primary
            : isBottomSheet
                ? context.colorScheme.background
                : context.colorScheme.surface,
        borderRadius: BorderRadius.all(context.normalRadius),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.dynamicWidth(0.0256),
        ),
        child: Center(
          child: Row(
            children: [
              Text(
                text,
                style: isSelected
                    ? context.textTheme.headline6!.copyWith(
                        color: context.colorScheme.surface,
                        fontSize: 11,
                      )
                    : context.textTheme.headline6!.copyWith(
                        fontSize: 11,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onPressed() {}
}
