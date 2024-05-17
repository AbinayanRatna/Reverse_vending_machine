import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'first_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: 'AIzaSyBMpGuLH2RDlSFZP0IoRse4QNCsuh5DgYc',
            appId: '1:602523507187:android:cfcb2ac1be18bd6a489a86',
            messagingSenderId: '602523507187',
            projectId: 'recycle-machine-a3cf3',
            storageBucket: 'recycle-machine-a3cf3.appspot.com',
          ),
        )
      : await Firebase.initializeApp(); //need to add firebase for ios
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (_, child) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstPage(),
      );
    });
  }
}
