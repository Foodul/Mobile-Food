import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart' as filePicker;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodul/view/category_details/model/food_detail_navigation_model.dart';
import '../../../core/extension/string_extension.dart';
import 'package:kartal/kartal.dart';

// import 'package:kartal/kartal.dart';

import '../../../core/base/model/base_response_model.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/components/button/custom_icon_button.dart';
import '../../../core/constants/image/svg_constants.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../main.dart';
import '../viewmodel/camera_view_model.dart';
import 'package:path_provider/path_provider.dart';

class CameraView extends StatefulWidget {
  const CameraView({Key? key}) : super(key: key);

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> with WidgetsBindingObserver {
  CameraController? controller;
  bool _isCameraInitialized = false;
  bool _isRearCameraSelected = true;
  FlashMode? _currentFlashMode;
  filePicker.FilePickerResult? fileResult;

  String _imagePath = '';

  getPermissionStatus() async {}

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = controller;
    // Instantiating the camera controller
    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    // Dispose the previous controller
    await previousCameraController?.dispose();

    // Replace with the new controller
    if (mounted) {
      setState(() {
        controller = cameraController;
      });
    }

    // Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    // Initialize controller
    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      print('Error initializing camera: $e');
    }

    // Update the Boolean
    if (mounted) {
      setState(() {
        _isCameraInitialized = controller!.value.isInitialized;
      });
    }

    _currentFlashMode = controller!.value.flashMode;
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    if (cameras.isNotEmpty) {
      onNewCameraSelected(cameras[0]);
    }
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      // Free up memory when camera not active
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      // Reinitialize the camera with same properties
      onNewCameraSelected(cameraController.description);
    }
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;
    if (cameraController!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }
    try {
      XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      print('Error occured while taking picture: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<CameraViewModel>(
      viewModel: CameraViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, CameraViewModel viewModel) =>
          Scaffold(
        body: _imagePath.isEmpty
            ? Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  _isCameraInitialized
                      ? AspectRatio(
                          aspectRatio: 1 / controller!.value.aspectRatio,
                          child: controller!.buildPreview(),
                        )
                      : Container(
                          color: Colors.black,
                        ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.normalValue,
                          vertical: context.mediumValue,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomIconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              iconAsset: SVGImageConstants.instance.close,
                              padding: context.normalValue,
                              backgroundColor: Colors.white38,
                            ),
                            Row(
                              children: [
                                CustomIconButton(
                                  onPressed: _isCameraInitialized
                                      ? () {
                                          onNewCameraSelected(
                                            cameras[
                                                _isRearCameraSelected ? 0 : 1],
                                          );
                                          setState(() {
                                            _isRearCameraSelected =
                                                !_isRearCameraSelected;
                                          });
                                        }
                                      : () {},
                                  iconAsset: SVGImageConstants.instance.flip,
                                  padding: context.normalValue,
                                  backgroundColor: Colors.white38,
                                ),
                                SizedBox(width: context.lowValue),
                                CustomIconButton(
                                  onPressed: _isCameraInitialized
                                      ? () async {
                                          switch (_currentFlashMode) {
                                            case FlashMode.off:
                                              setState(() {
                                                _currentFlashMode =
                                                    FlashMode.auto;
                                              });
                                              await controller!.setFlashMode(
                                                FlashMode.auto,
                                              );
                                              break;
                                            case FlashMode.auto:
                                              setState(() {
                                                _currentFlashMode =
                                                    FlashMode.always;
                                              });
                                              await controller!.setFlashMode(
                                                FlashMode.always,
                                              );
                                              break;
                                            case FlashMode.always:
                                              if (!_isRearCameraSelected) {
                                                setState(() {
                                                  _currentFlashMode =
                                                      FlashMode.torch;
                                                });
                                                await controller!.setFlashMode(
                                                  FlashMode.torch,
                                                );
                                              } else {
                                                setState(() {
                                                  _currentFlashMode =
                                                      FlashMode.off;
                                                });
                                                await controller!.setFlashMode(
                                                  FlashMode.off,
                                                );
                                              }
                                              break;
                                            case FlashMode.torch:
                                              setState(() {
                                                _currentFlashMode =
                                                    FlashMode.off;
                                              });
                                              await controller!.setFlashMode(
                                                FlashMode.off,
                                              );
                                              break;
                                            default:
                                              throw Exception(
                                                  'No statu found!');
                                          }
                                        }
                                      : () {},
                                  iconAsset: _currentFlashMode.icon,
                                  padding: context.normalValue,
                                  backgroundColor: Colors.white38,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.highValue / 2,
                          vertical: context.highValue / 2,
                        ),
                        child: Column(
                          children: [
                            CustomIconButton(
                              onPressed: () async {
                                try {
                                  fileResult = await filePicker
                                      .FilePicker.platform
                                      .pickFiles(
                                    allowMultiple: false,
                                    type: filePicker.FileType.media,
                                  );
                                  if (fileResult != null) {
                                    setState(() {
                                      _imagePath = fileResult!.paths[0]!;
                                    });
                                  }
                                } on PlatformException {
                                  viewModel.showMessage(
                                    message: LocaleKeys
                                        .ValidateMessage_selectContent.locale,
                                  );
                                }
                              },
                              iconAsset: SVGImageConstants.instance.gallery,
                              padding: context.normalValue,
                              backgroundColor: Colors.white38,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: context.mediumValue,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: _isCameraInitialized
                              ? () async {
                                  XFile? rawImage = await takePicture();
                                  File imageFile = File(rawImage!.path);

                                  int currentUnix =
                                      DateTime.now().millisecondsSinceEpoch;
                                  final directory =
                                      await getApplicationDocumentsDirectory();
                                  String fileFormat =
                                      imageFile.path.split('.').last;

                                  await imageFile.copy(
                                    '${directory.path}/$currentUnix.$fileFormat',
                                  );
                                  setState(() {
                                    _imagePath = imageFile.path;
                                  });
                                }
                              : () {},
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(Icons.circle,
                                  color: Colors.white38,
                                  size: context.dynamicWidth(0.25)),
                              Icon(Icons.circle,
                                  color: Colors.white,
                                  size: context.dynamicWidth(0.22)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Stack(
                children: [
                  Center(child: Image.asset(_imagePath)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.normalValue,
                      vertical: context.mediumValue,
                    ),
                    child: CustomIconButton(
                      onPressed: () {
                        setState(() {
                          _imagePath = '';
                        });
                      },
                      iconAsset: SVGImageConstants.instance.close,
                      padding: context.normalValue,
                      backgroundColor: Colors.white38,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: context.paddingNormal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: MaterialButton(
                              padding: EdgeInsets.symmetric(
                                vertical: context.normalValue,
                                horizontal: context.mediumValue,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(context.lowValue),
                              ),
                              color: Colors.white,
                              onPressed: () {
                                setState(() {
                                  _imagePath = '';
                                });
                              },
                              child: Container(
                                height: context.dynamicHeight(0.03),
                                alignment: Alignment.center,
                                child: Text(
                                  'Take again',
                                  style: context.textTheme.headline6!.copyWith(
                                    color: context.colorScheme.tertiary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: context.normalValue),
                          Expanded(
                            child: MaterialButton(
                              height: context.dynamicHeight(0.05),
                              padding: EdgeInsets.symmetric(
                                vertical: context.normalValue,
                                horizontal: context.mediumValue,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(context.lowValue)),
                              color: context.colorScheme.primary,
                              onPressed: () {
                                viewModel.navigation
                                    .navigateToPage(
                                  path: NavigationConstants.FOOD_DETAIL,
                                  data: FoodDetailNavigationModel(
                                    path: _imagePath,
                                    isNetwork: false,
                                  ),
                                )
                                    .then((value) {
                                  SystemChrome.setEnabledSystemUIMode(
                                    SystemUiMode.manual,
                                    overlays: [],
                                  );
                                });
                              },
                              child: SizedBox(
                                height: context.dynamicHeight(0.03),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Detect',
                                      style:
                                          context.textTheme.headline6!.copyWith(
                                        color: context.colorScheme.tertiary,
                                      ),
                                    ),
                                    SizedBox(width: context.normalValue),
                                    SvgPicture.asset(
                                      SVGImageConstants.instance.send,
                                      color: context.colorScheme.tertiary,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

extension FlashModeToIcon on FlashMode? {
  String get icon {
    switch (this) {
      case FlashMode.off:
        return SVGImageConstants.instance.flashOff;
      case FlashMode.auto:
        return SVGImageConstants.instance.flashAuto;
      case FlashMode.always:
        return SVGImageConstants.instance.flash;
      case FlashMode.torch:
        return SVGImageConstants.instance.flashOn;
      default:
        return SVGImageConstants.instance.flashAuto;
    }
  }
}
