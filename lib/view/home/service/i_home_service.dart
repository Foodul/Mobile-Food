import 'package:vexana/vexana.dart';

import '../../../../core/base/model/base_response_model.dart';

abstract class IHomeService {
  final INetworkManager manager;

  IHomeService(this.manager);

  Future<BaseResponseModel?> fetchInitMobile();
}
