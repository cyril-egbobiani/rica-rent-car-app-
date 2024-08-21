import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reca/injection_container.dart';
import 'package:reca/presentation/bloc/car_EVENT.dart';
import 'package:reca/presentation/bloc/car_bloc.dart';
import 'package:reca/presentation/pages/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyBxNOoJgMUmq6DOv6X_DVTrX3MjSQh-8HE",
              authDomain: "reca-ea63c.firebaseapp.com",
              projectId: "reca-ea63c",
              storageBucket: "reca-ea63c.appspot.com",
              messagingSenderId: "41550945400",
              appId: "1:41550945400:web:ff5fd9301b176f99d3a18d",
              measurementId: "G-DCDQ5ZJK4C"))
      : await Firebase.initializeApp();
  initInjection();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  void now() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final user = {"firstname": "Fabrice", "lastname": 'bbsv'};
    db.collection("users").add(user).then(
        (DocumentReference doc) => debugPrint("users with id : ${doc.id}"));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> getIt<CarBloc>()..add(LoadCars()),
      child: const ScreenUtilInit(
        designSize: Size(390, 844),
        child: MaterialApp(
            debugShowCheckedModeBanner: false, home: OnboardingPage()),
      ),
    );
  }
}
