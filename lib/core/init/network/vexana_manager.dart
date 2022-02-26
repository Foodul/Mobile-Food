import 'package:vexana/vexana.dart';

class VexanaManager {
  static VexanaManager? _instace;
  static VexanaManager get instance {
    if (_instace != null) return _instace!;
    _instace = VexanaManager._init();
    return _instace!;
  }

  static const String _iosBaseUrl = 'http://f642-46-196-70-15.ngrok.io/';
  static const String _androidBaseUrl = 'http://10.0.2.2:7002/';

  VexanaManager._init();

  // TODO: change language header based on locale

  INetworkManager networkManager = NetworkManager(
    isEnableLogger: true,
    options: BaseOptions(
      followRedirects: false,
      validateStatus: (status) {
        if (status == 401) {
          return false;
        }
        return status! < 500;
      },
      // TODO: Add url
      baseUrl: 'https://oneri.io/api/',
      // baseUrl: 'http://192.168.1.220:7002/',
      // baseUrl: Platform.isAndroid ? _androidBaseUrl : _iosBaseUrl,
      // headers: {'language': 'en'},
    ),
  );
}
