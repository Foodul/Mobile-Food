import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodul/core/constants/image/svg_constants.dart';
import 'package:kartal/kartal.dart';

class StarComponent extends StatelessWidget {
  final double stars;
  const StarComponent({Key? key, required this.stars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          SVGImageConstants.instance.star,
          color: stars >= 1 ? const Color(0xFFFF8C00) : const Color(0xFFC5CEE0),
        ),
        SvgPicture.asset(
          SVGImageConstants.instance.star,
          color: stars >= 2 ? const Color(0xFFFF8C00) : const Color(0xFFC5CEE0),
        ),
        SvgPicture.asset(
          SVGImageConstants.instance.star,
          color: stars >= 3 ? const Color(0xFFFF8C00) : const Color(0xFFC5CEE0),
        ),
        SvgPicture.asset(
          SVGImageConstants.instance.star,
          color: stars >= 4 ? const Color(0xFFFF8C00) : const Color(0xFFC5CEE0),
        ),
        SvgPicture.asset(
          SVGImageConstants.instance.star,
          color: stars >= 5 ? const Color(0xFFFF8C00) : const Color(0xFFC5CEE0),
        ),
      ],
    );
  }
}
