import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';

import '../constants/image/svg_constants.dart';

class TipsCard extends StatelessWidget {
  final String tipsImage;
  final String title;
  final String text;
  final Function() onTap;
  const TipsCard({
    Key? key,
    required this.tipsImage,
    required this.title,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.normalValue,
        vertical: context.lowValue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(tipsImage, width: double.infinity, fit: BoxFit.cover),
          SizedBox(height: context.dynamicWidth(0.05)),
          Text(
            title,
            style: context.textTheme.headline6!.copyWith(
              fontSize: 16,
              color: context.colorScheme.tertiaryContainer,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: context.dynamicWidth(0.03)),
          Text(
            text,
            style: context.textTheme.headline6!.copyWith(
              fontSize: 14,
              color: context.colorScheme.onTertiary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: context.dynamicWidth(0.05)),
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Text(
                  'View More',
                  style: context.textTheme.headline6!.copyWith(
                    fontSize: 14,
                    color: context.colorScheme.tertiaryContainer,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: context.dynamicWidth(0.02)),
                SvgPicture.asset(SVGImageConstants.instance.arrowRight),
              ],
            ),
          )
        ],
      ),
    );
  }
}
