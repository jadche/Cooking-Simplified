import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCtjSz75xEooKMPSi-ZOi8gocYm5rloWdA",
            authDomain: "cookingsimplified-f8f94.firebaseapp.com",
            projectId: "cookingsimplified-f8f94",
            storageBucket: "cookingsimplified-f8f94.appspot.com",
            messagingSenderId: "735892953618",
            appId: "1:735892953618:web:c7e67c391f9221f39796cb",
            measurementId: "G-4GNW4FT2EF"));
  } else {
    await Firebase.initializeApp();
  }
}
