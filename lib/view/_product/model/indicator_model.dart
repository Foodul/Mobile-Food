import 'package:flutter/material.dart';

class IndicatorModel extends StatelessWidget {
  final Color color;
  final String text;
  final double? circleSize;
  final TextStyle? textStyle;

  const IndicatorModel({
    Key? key,
    required this.color,
    required this.text,
    this.textStyle,
    this.circleSize = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: circleSize,
            height: circleSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              maxLines: 1,
              style: textStyle ??
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
