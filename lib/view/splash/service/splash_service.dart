// import 'package:vexana/vexana.dart';

// import '../../../../core/base/model/base_response_model.dart';
// import '../../../../core/utility/service_helper.dart';
// import '../../../core/constants/network/network_route_enum.dart';
// import '../../login/model/init_model.dart';
// import 'i_splash_service.dart';

// class SplashService extends ISplashService with ServiceHelper {
//   SplashService(INetworkManager manager) : super(manager);

//   @override
//   Future<BaseResponseModel?> fetchInit() async {
//     var response = await requestJson(
//       manager,
//       NetworkRoutes.INIT,
//       RequestType.GET,
//       dataParser: InitModel(),
//     );
//     return response;
//   }
// }
