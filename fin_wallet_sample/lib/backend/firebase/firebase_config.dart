import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAaUfG2Bb-wd1CEG1GwXfm_QouBRHhF08U",
            authDomain: "finance-app-32589.firebaseapp.com",
            projectId: "finance-app-32589",
            storageBucket: "finance-app-32589.appspot.com",
            messagingSenderId: "180463640197",
            appId: "1:180463640197:web:12626955157c6fcd90d3ec",
            measurementId: "G-G7842LZYLB"));
  } else {
    await Firebase.initializeApp();
  }
}
