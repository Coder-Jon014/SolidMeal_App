import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCvSMktzTY38u5whlrUdHMzqU4LbMqxXtc",
            authDomain: "solidmeal.firebaseapp.com",
            projectId: "solidmeal",
            storageBucket: "solidmeal.appspot.com",
            messagingSenderId: "676324613133",
            appId: "1:676324613133:web:a303cbdc6d4f286e7e4944"));
  } else {
    await Firebase.initializeApp();
  }
}
