import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAP_-qYS6QnWaW_-cJcEXBvf3Bl87Dmv6o",
            authDomain: "claimsentinel.firebaseapp.com",
            projectId: "claimsentinel",
            storageBucket: "claimsentinel.appspot.com",
            messagingSenderId: "84705233733",
            appId: "1:84705233733:web:e50e1b5ece65dbb1524c2c"));
  } else {
    await Firebase.initializeApp();
  }
}
