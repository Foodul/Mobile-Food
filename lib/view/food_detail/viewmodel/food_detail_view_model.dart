import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodul/view/category_details/model/food_detail_navigation_model.dart';
import '../../../core/base/viewmodel/base_view_model.dart';
import 'package:mobx/mobx.dart';
import 'package:tflite/tflite.dart';
part 'food_detail_view_model.g.dart';

class FoodDetailViewModel = _FoodDetailViewModelBase with _$FoodDetailViewModel;

abstract class _FoodDetailViewModelBase with Store, BaseViewModel {
  final FoodDetailNavigationModel? navModel;

  _FoodDetailViewModelBase(this.navModel);

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
    ]);
    print('init view model');
    await loadModel();
    if (navModel != null) {
      if (!navModel!.isNetwork) {
        await classifyImage(navModel!.path);
      }
    }
  }

  @observable
  bool isLoading = false;

  @action
  void changeIsLoading() {
    isLoading = !isLoading;
  }

  loadModel() async {
    //this function loads our model
    await Tflite.loadModel(
        model: 'assets/model/model.tflite', labels: 'assets/model/labels.txt');
  }

  @observable
  String label = '';

  classifyImage(String path) async {
    List? result = [];
    //this function runs the model on the image
    result = await Tflite.runModelOnImage(
      path: path,
      numResults: 137, //the amout of categories our neural network can predict
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
      asynch: true,
    );

    if (result!.isNotEmpty) {
      print(result[0]);
      label = result[0]['label'];
    }
  }

  @observable
  late String typeValue = type[0];

  @observable
  List type = ['Gram', 'Kilogram', 'Porsion'];

  setMapListDropdownMenuItem(List listItem) => listItem
      .map<DropdownMenuItem<String>>(
        (item) => DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        ),
      )
      .toList();

  @computed
  get getTypeDropdown => setMapListDropdownMenuItem(
        type.toList(),
      );

  @action
  void setWorkFlowTextValue(value) => typeValue = value;
}
