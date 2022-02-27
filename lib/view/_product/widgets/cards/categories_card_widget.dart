import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

// ignore: must_be_immutable
class CategoriesCard extends StatelessWidget {
  String? imageUrl;
  String? title;
  CategoriesCard({
    Key? key,
    this.imageUrl,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: context.colorScheme.onTertiaryContainer, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // color
            Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      imageUrl.toString(),
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        title.toString(),
                        style: context.textTheme.subtitle2!
                            .copyWith(color: context.colorScheme.tertiary),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
