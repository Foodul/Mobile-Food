// import 'package:vexana/vexana.dart';

// import '../../../../core/base/model/base_response_model.dart';
// import '../../../../core/utility/service_helper.dart';
// import '../../../core/constants/network/network_route_enum.dart';
// import '../model/home_model.dart';
// import 'i_home_service.dart';

// class HomeService extends IHomeService with ServiceHelper {
//   HomeService(INetworkManager manager) : super(manager);

//   @override
//   Future<BaseResponseModel?> fetchInitMobile() async {
//     var response = await requestJson(
//       manager,
//       NetworkRoutes.HOME,
//       RequestType.GET,
//       dataParser: HomeModel(),
//     );
//     return response;
//   }
// }
