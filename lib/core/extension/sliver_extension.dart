import 'package:flutter/material.dart';

// ignore: camel_case_extensions
extension customSliverBoxAdapter on Widget {
  Widget get toSliver => SliverToBoxAdapter(child: this);
}
