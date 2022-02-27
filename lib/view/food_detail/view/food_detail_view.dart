import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodul/core/components/star_component.dart';
import 'package:foodul/core/constants/image/svg_constants.dart';
import 'package:kartal/kartal.dart';
import 'package:tflite/tflite.dart';

import '../../../core/base/view/base_widget.dart';
import '../../../core/components/info_card.dart';
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
          elevation: 0,
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
                        child: ListView(
                          padding: EdgeInsets.zero,
                          controller: myscrollController,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: context.mediumValue,
                                left: context.normalValue,
                                right: context.normalValue,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Marul',
                                    style:
                                        context.textTheme.headline5!.copyWith(
                                      color:
                                          context.colorScheme.tertiaryContainer,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const StarComponent(
                                        stars: 5,
                                      ),
                                      SizedBox(width: context.lowValue),
                                      Text(
                                        'Sağlık Oranı',
                                        style: context.textTheme.headline6!
                                            .copyWith(
                                          color: context.colorScheme.onTertiary,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: context.normalValue,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: context.normalValue,
                                right: context.normalValue,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '1 Adet Kalori oranı',
                                    style:
                                        context.textTheme.headline5!.copyWith(
                                      color: context.colorScheme.onTertiary,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          SVGImageConstants.instance.calori),
                                      SizedBox(width: context.lowValue),
                                      Text(
                                        70.toString() + ' Kalori',
                                        style: context.textTheme.headline6!
                                            .copyWith(
                                          color: context
                                              .colorScheme.tertiaryContainer,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: context.normalValue,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: context.normalValue,
                                right: context.normalValue,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '100 gram kalori oranı',
                                    style:
                                        context.textTheme.headline5!.copyWith(
                                      color: context.colorScheme.onTertiary,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          SVGImageConstants.instance.calori),
                                      SizedBox(width: context.lowValue),
                                      Text(
                                        70.toString() + ' Kalori',
                                        style: context.textTheme.headline6!
                                            .copyWith(
                                          color: context
                                              .colorScheme.tertiaryContainer,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: context.normalValue,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: context.normalValue,
                                right: context.normalValue,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Karbon Ayak İzi Değeri',
                                    style:
                                        context.textTheme.headline5!.copyWith(
                                      color: context.colorScheme.onTertiary,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    1200.toString() + ' CO2',
                                    style:
                                        context.textTheme.headline6!.copyWith(
                                      color:
                                          context.colorScheme.tertiaryContainer,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: context.normalValue,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: context.normalValue,
                                right: context.normalValue,
                              ),
                              child: InfoCard(
                                alertText:
                                    'Dondurma tüketerek ....  yapmak kadar karbon tükemi yapmaktasınız.',
                                lightbulb: SVGImageConstants.instance.flash,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: context.normalValue,
                                right: context.normalValue,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: customDropdownField(
                                        context,
                                        viewModel.getTypeDropdown,
                                        'Weight type',
                                        (value) => viewModel
                                            .setWorkFlowTextValue(value),
                                        value: viewModel.typeValue),
                                  ),
                                  SizedBox(width: context.lowValue),
                                  Expanded(
                                    child: Container(
                                      height: context.dynamicWidth(0.15),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(
                                              0,
                                              3,
                                            ), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      child: const TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 20,
                                          ),
                                          hintText: 'Amount',
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: context.normalValue,
                                right: context.normalValue,
                              ),
                              width: double.infinity,
                              height: context.dynamicHeight(0.075),
                              child: ElevatedButton(
                                onPressed: () {
                                  // viewModel.submit();
                                },
                                child: Text(
                                  'Ekle',
                                  style: context.textTheme.headline6!.copyWith(
                                    color:
                                        context.colorScheme.tertiaryContainer,
                                  ),
                                ),
                              ),
                            ),
                          ],
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

  Widget customDropdownField<T>(
    BuildContext context,
    List<DropdownMenuItem<String>> items,
    String label,
    Function(String? value)? onChange, {
    String? value,
  }) {
    return Padding(
        padding: context.verticalPaddingNormal,
        child: Container(
          height: context.dynamicWidth(0.15),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
            ),
            value: value,
            items: items,
            validator: (value) {
              if (value == null) {
                return "The field is required.";
              }
              return null;
            },
            onChanged: (value) {
              onChange!(value);
            },
          ),
        ));
  }
}
