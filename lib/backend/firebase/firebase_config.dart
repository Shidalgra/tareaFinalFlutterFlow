import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAVjrvqlajlut5X9yjOZOYbbMynV6O3zXQ",
            authDomain: "tareafinal-7f06f.firebaseapp.com",
            projectId: "tareafinal-7f06f",
            storageBucket: "tareafinal-7f06f.appspot.com",
            messagingSenderId: "227145690059",
            appId: "1:227145690059:web:4b83b1f5dd22fe99fd644e",
            measurementId: "G-Z38YZY9568"));
  } else {
    await Firebase.initializeApp();
  }
}
