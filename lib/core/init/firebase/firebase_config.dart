import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (Platform.isIOS || Platform.isMacOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '1:541990764473:ios:80bb34337c060337b34068',
        apiKey: 'AIzaSyBiEC4sG9mLd9EF1jTdsJOIki6wvlE_hi',
        projectId: 'oneri-sistemi-mobile',
        messagingSenderId: '541990764473',
        iosBundleId: 'com.mdptech.onerisistemi',
        iosClientId:
            '541990764473-93gr7704kcmq2o92jr9vreco4ien9h10.apps.googleusercontent.com',
        androidClientId:
            '541990764473-9po8ik9msu7fkr169bgr385f63t4mprt.apps.googleusercontent.com',
        storageBucket: 'oneri-sistemi-mobile.appspot.com',
      );
    } else {
      // Android
      return const FirebaseOptions(
        appId: '1:541990764473:android:2f260c4db0f035efb34068',
        apiKey: 'AIzaSyCNJGA0p3GuckhobRVyG6oHNhAhO6rZHaA',
        projectId: 'oneri-sistemi-mobile',
        messagingSenderId: '541990764473',
      );
    }
  }
}
