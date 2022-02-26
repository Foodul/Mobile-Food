import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';

class AlertCard extends StatelessWidget {
  const AlertCard({
    Key? key,
    required this.lightbulb,
    required this.alertText,
  }) : super(key: key);

  final String lightbulb;
  final String alertText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffFFEEC3),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: context.lowValue,
          vertical: context.mediumValue,
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
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
      ),
    );
  }
}
