import 'package:flutter/material.dart';
import 'package:sample_app/app.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'firebase_options.dart';
/// Main entry point to the app.
///
/// This should be kept as simple as possible.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Don't initialize on Windows or Linux as Firebase is not supported there
  if (kIsWeb || !(Platform.isWindows || Platform.isLinux)) {
    await Firebase.initializeApp(
      // TODO Run the setup tool to configure firebase and generate this
      // Or run flutterfire configure yourself
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  runApp(MyApp());
}
