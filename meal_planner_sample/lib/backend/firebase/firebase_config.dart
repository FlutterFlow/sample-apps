import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC60LWWGMOA6bWdiPvXey2E8z5xeSdFuPM",
            authDomain: "meal-planner-3841f.firebaseapp.com",
            projectId: "meal-planner-3841f",
            storageBucket: "meal-planner-3841f.appspot.com",
            messagingSenderId: "921473207936",
            appId: "1:921473207936:web:57d3d363b2aeb24d182065",
            measurementId: "G-V0P4VG9DJX"));
  } else {
    await Firebase.initializeApp();
  }
}
