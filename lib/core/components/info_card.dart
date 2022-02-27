import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.lightbulb,
    required this.alertText,
  }) : super(key: key);

  final String lightbulb;
  final String alertText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: const Color(0xffFFEEC3),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.lowValue,
        vertical: context.normalValue,
      ),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffF9B50F),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: SvgPicture.asset(lightbulb),
          ),
          SizedBox(width: context.dynamicWidth(0.05)),
          Flexible(
            child: Text(
              alertText,
              textAlign: TextAlign.start,
              maxLines: 3,
              overflow: TextOverflow.visible,
              softWrap: true,
              style: context.textTheme.headline6!.copyWith(
                color: context.colorScheme.onTertiary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
