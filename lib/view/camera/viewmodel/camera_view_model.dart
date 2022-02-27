import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../../../core/base/viewmodel/base_view_model.dart';
import 'package:mobx/mobx.dart';
part 'camera_view_model.g.dart';

class CameraViewModel = _CameraViewModelBase with _$CameraViewModel;

abstract class _CameraViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}
}
