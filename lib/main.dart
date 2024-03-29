// ignore_for_file: prefer_const_constructors

import 'package:project_template/cache/prefs_controller.dart';
import 'package:project_template/locale/locale.dart';
import 'package:project_template/locale/locale_controller.dart';
import 'package:project_template/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  PrefsController sharedPrefs = PrefsController();
  await sharedPrefs.initialize();

  runApp(MyApp(shaeedPrefs: sharedPrefs));
}

class MyApp extends StatelessWidget {
  final PrefsController? shaeedPrefs;

  const MyApp({this.shaeedPrefs, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ytek',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff326CB4)),
        useMaterial3: true,
      ),
      locale: Locale(shaeedPrefs!.pref.get('lang').toString()),
      translations: MyLocale(),
      home: HomeScreen(),
    );
  }
}
