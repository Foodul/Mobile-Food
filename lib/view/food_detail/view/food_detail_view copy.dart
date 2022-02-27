import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:tflite/tflite.dart';

import '../../../core/base/view/base_widget.dart';
import '../viewmodel/food_detail_view_model.dart';

class FoodDetailView extends StatefulWidget {
  final String? filePath;
  const FoodDetailView({Key? key, this.filePath}) : super(key: key);

  @override
  State<FoodDetailView> createState() => _FoodDetailViewState();
}

class _FoodDetailViewState extends State<FoodDetailView> {
  @override
  void dispose() {
    //dis function disposes and clears our memory
    super.dispose();
    Tflite.close();
  }

  @override
  Widget build(BuildContext context) {
    var child;
    return BaseView<FoodDetailViewModel>(
      viewModel: FoodDetailViewModel(widget.filePath),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, FoodDetailViewModel viewModel) =>
          Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: const Color(0xFFF6F5F5).withOpacity(0.3),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: context.colorScheme.tertiaryContainer,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Gıda Detay',
            style: context.textTheme.headline6!.copyWith(
              color: context.colorScheme.tertiaryContainer,
              fontSize: 18,
            ),
          ),
        ),
        body: Stack(
          children: [
            widget.filePath != null
                ? Image.asset(
                    widget.filePath!,
                    height: context.dynamicHeight(0.55),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : const SizedBox(),
            DraggableScrollableSheet(
              maxChildSize: 0.8,
              initialChildSize: 0.5,
              minChildSize: 0.5,
              builder: (
                BuildContext context,
                ScrollController myscrollController,
              ) {
                child ??= Container(
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        spreadRadius: 5,
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: context.lowValue),
                      const Divider(
                        endIndent: 160,
                        indent: 160,
                        thickness: 4,
                        color: Color(0xFFE2E6EC),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: context.lowValue,
                            left: context.normalValue,
                            right: context.normalValue,
                          ),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            controller: myscrollController,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Marul',
                                    style: context.textTheme.headline5,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
                return child ?? const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
