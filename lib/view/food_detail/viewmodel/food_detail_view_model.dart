import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodul/core/base/viewmodel/base_view_model.dart';
import 'package:mobx/mobx.dart';
import 'package:tflite/tflite.dart';
part 'food_detail_view_model.g.dart';

class FoodDetailViewModel = _FoodDetailViewModelBase with _$FoodDetailViewModel;

abstract class _FoodDetailViewModelBase with Store, BaseViewModel {
  final String? filePath;

  _FoodDetailViewModelBase(this.filePath);

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
    ]);
    print('init view model');
    await loadModel();
    if (filePath != null) {
      await classifyImage(filePath!);
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
  ObservableList? output = ObservableList.of([]);

  classifyImage(String path) async {
    inspect(path);
    //this function runs the model on the image
    final result = await Tflite.runModelOnImage(
      path: path,
      numResults: 137, //the amout of categories our neural network can predict
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
      asynch: true,
    );

    output = ObservableList.of(result!);

    inspect(output);
  }
}
