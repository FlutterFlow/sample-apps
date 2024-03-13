import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyASlAPmD18Mc_RHfm4N2iditj_kQ63Pfo8",
            authDomain: "school-social-uni-demo-ttazup.firebaseapp.com",
            projectId: "school-social-uni-demo-ttazup",
            storageBucket: "school-social-uni-demo-ttazup.appspot.com",
            messagingSenderId: "558943550851",
            appId: "1:558943550851:web:31b051519dbe15d3e6cab6"));
  } else {
    await Firebase.initializeApp();
  }
}
