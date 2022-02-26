import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodul/core/base/view/base_widget.dart';
import 'package:foodul/core/components/text_input/text_input_filed.dart';
import 'package:foodul/core/constants/image/svg_constants.dart';
import 'package:foodul/core/init/lang/locale_keys.g.dart';
import 'package:foodul/view/home/viewmodel/home_view_model.dart';
import 'package:kartal/kartal.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, HomeViewModel viewModel) =>
          Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/home_background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: context.width,
            height: context.height,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: context.horizontalPaddingLow * 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: context.height * 0.1,
                        ),
                        Row(
                          children: [
                            Text(
                              LocaleKeys.homeView_carbonValue.tr(),
                              style: context.textTheme.headline4!.copyWith(
                                color: context.colorScheme.background,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '5200 CO2 ',
                              style: context.textTheme.headline4!.copyWith(
                                color: context.colorScheme.background,
                              ),
                            ),
                            SvgPicture.asset(
                                SVGImageConstants.instance.trending_down)
                          ],
                        ),
                        SizedBox(
                          height: context.width * 0.05,
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //       color: context.colorScheme.background,
                        //       borderRadius: BorderRadius.circular(35)),
                        //   width: context.width * 0.9,
                        //   height: context.width * 0.8,
                        // )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    width: context.width,
                    decoration: BoxDecoration(
                      color: context.colorScheme.background,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          overflow: Overflow.visible,
                          children: [
                            Container(
                              width: context.width,
                              padding: context.paddingLow * 2,
                              height: context.width * 0.6,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 30,
                                      offset: const Offset(
                                          0, 0), // changes position of shadow
                                    ),
                                  ],
                                  color: context.colorScheme.onError,
                                  borderRadius: BorderRadius.circular(30)),
                              // width: context.width * 0.9,
                              // height: context.width * 0.8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        LocaleKeys.homeView_today.tr(),
                                        style: context.textTheme.headline4!
                                            .copyWith(
                                          color: context
                                              .colorScheme.tertiaryContainer,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        LocaleKeys.seeAll.tr(),
                                        style: context.textTheme.button,
                                      ),
                                    ],
                                  ),
                                  Center(
                                      child: SizedBox(
                                    width: 450,
                                    height: 180,
                                    child: SfRadialGauge(axes: <RadialAxis>[
                                      RadialAxis(
                                          minimum: 0,
                                          maximum: 100,
                                          showLabels: false,
                                          showTicks: false,
                                          startAngle: 180,
                                          endAngle: 0,
                                          canScaleToFit: true,
                                          radiusFactor: 1.3,
                                          axisLineStyle: const AxisLineStyle(
                                            thickness: 0.05,
                                            color:
                                                Color.fromARGB(30, 0, 169, 181),
                                            thicknessUnit: GaugeSizeUnit.factor,
                                          ),
                                          pointers: <GaugePointer>[
                                            RangePointer(
                                              color:
                                                  context.colorScheme.primary,
                                              value: 44,
                                              width: 0.08,
                                              cornerStyle:
                                                  CornerStyle.bothCurve,
                                              sizeUnit: GaugeSizeUnit.factor,
                                              enableAnimation: true,
                                              animationDuration: 20,
                                              animationType:
                                                  AnimationType.linear,
                                            )
                                          ],
                                          annotations: <GaugeAnnotation>[
                                            GaugeAnnotation(
                                                positionFactor: 0,
                                                widget: Column(
                                                  children: [
                                                    Text(
                                                      LocaleKeys
                                                          .homeView_spendValue
                                                          .tr(),
                                                      style: context
                                                          .textTheme.subtitle2!
                                                          .copyWith(
                                                              color: context
                                                                  .colorScheme
                                                                  .tertiaryContainer),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SvgPicture.asset(
                                                              SVGImageConstants
                                                                  .instance
                                                                  .flash),
                                                          Text(
                                                            '1200 Cal ',
                                                            style: context
                                                                .textTheme
                                                                .headline4!
                                                                .copyWith(
                                                                    color: context
                                                                        .colorScheme
                                                                        .primary),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Text(
                                                      'Normal 2400 Cal ',
                                                      style: context
                                                          .textTheme.bodyLarge,
                                                    ),
                                                  ],
                                                ))
                                          ])
                                    ]),
                                  )),
                                ],
                              ),
                            ),
                            Positioned(
                                left: (context.width / 2) / 12,
                                bottom: -30,
                                child: SizedBox(
                                    width: context.width * 0.9,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 23,
                                              offset: const Offset(0,
                                                  0), // changes position of shadow
                                            ),
                                          ]),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.search,
                                            color: context.colorScheme
                                                .onTertiaryContainer,
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: context.lowValue,
                                              vertical:
                                                  context.mediumValue / 1.7),
                                          hintText: "Resevior Name",
                                          filled: true,
                                          fillColor: Colors.white,
                                          disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                        ),
                                      ),
                                    )))
                          ],
                        ),
                        Container(
                          padding: context.horizontalPaddingLow * 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: context.width * 0.13,
                              ),
                              Text(
                                LocaleKeys.homeView_spendingHistory.tr(),
                                style: context.textTheme.headline4!.copyWith(
                                  color: context.colorScheme.tertiaryContainer,
                                ),
                              ),
                              SizedBox(
                                width: context.width,
                                height: context.height * 0.088,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: viewModel.tabs.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Observer(builder: (_) {
                                            return GestureDetector(
                                              onTap: () {
                                                viewModel.selectedIndex = index;
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                    context.width * 0.05),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      viewModel.tabs[index]
                                                          .toString(),
                                                      style: context
                                                          .textTheme.subtitle2,
                                                    ),
                                                    SizedBox(
                                                      height: context.height *
                                                          0.009,
                                                    ),
                                                    index ==
                                                            viewModel
                                                                .selectedIndex
                                                        ? CircleAvatar(
                                                            radius: 4,
                                                            backgroundColor:
                                                                context
                                                                    .colorScheme
                                                                    .secondary,
                                                          )
                                                        : const SizedBox()
                                                  ],
                                                ),
                                              ),
                                            );
                                          })
                                        ],
                                      );
                                    }),
                              ),
                              SizedBox(
                                width: context.width,
                                height: context.height * 0.35,
                                child: ListView.builder(
                                    itemCount: viewModel.feedData.length,
                                    itemBuilder: (context, index) {
                                      return viewModel.data
                                          ? ListTile(
                                              leading: Image.network(
                                                viewModel.feedData[index]
                                                        ['photo']
                                                    .toString(),
                                                fit: BoxFit.cover,
                                                height: 50,
                                                width: 50,
                                              ),
                                              title: Text(
                                                '${viewModel.feedData[index]['name']} Adet ${viewModel.feedData[index]['kcal']}',
                                                style: context
                                                    .textTheme.subtitle2!
                                                    .copyWith(
                                                        color: context
                                                            .colorScheme
                                                            .tertiaryContainer,
                                                        fontWeight:
                                                            FontWeight.w600),
                                              ),
                                              subtitle: Text(
                                                viewModel.feedData[index]
                                                        ['time']
                                                    .toString(),
                                              ),
                                              trailing: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: context.width * 0.15,
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                          SVGImageConstants
                                                              .instance.flash,
                                                          color: context
                                                              .colorScheme
                                                              .onTertiaryContainer,
                                                        ),
                                                        Text(
                                                            '${viewModel.feedData[index]['kcal']}')
                                                      ],
                                                    ),
                                                  ),
                                                  Text(viewModel.feedData[index]
                                                          ['co2']
                                                      .toString()),
                                                ],
                                              ),
                                            )
                                          : Container();
                                    }),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
