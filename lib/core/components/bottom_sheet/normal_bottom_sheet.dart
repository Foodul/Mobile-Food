import 'package:flutter/material.dart';

class NormalBottomSheet extends StatelessWidget {
  final BuildContext context;
  final Widget? body;
  final bool enableDrag;
  final bool isDismissible;
  const NormalBottomSheet({
    Key? key,
    required this.context,
    this.body,
    this.enableDrag = false,
    this.isDismissible = false,
  }) : super(key: key);

  dynamicWidthSize(value) => MediaQuery.of(context).size.width * value;
  dynamicHeightSize(value) => MediaQuery.of(context).size.height * value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        touchArea(context),
        Expanded(child: body != null ? body! : dummyWidget())
      ],
    );
  }

  Padding touchArea(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: dynamicWidthSize(0.025)),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: dynamicWidthSize(0.2),
          maxHeight: dynamicWidthSize(0.015),
        ),
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.all(
            Radius.circular(dynamicWidthSize(1)),
          ),
        ),
      ),
    );
  }

  SizedBox dummyWidget() {
    return const SizedBox(
        height: 200, child: Center(child: Text('CustomBottomSheet')));
  }

  void show() {
    showModalBottomSheet<void>(
        constraints: BoxConstraints(
          maxHeight: dynamicHeightSize(.8),
        ),
        // isScrollControlled: true,
        context: context,
        backgroundColor: Theme.of(context).colorScheme.surface,
        enableDrag: enableDrag,
        isDismissible: isDismissible,
        barrierColor: Colors.black54,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              dynamicWidthSize(.075),
            ),
          ),
        ),
        builder: (BuildContext context) {
          return NormalBottomSheet(context: context, body: body);
        });
  }
}
