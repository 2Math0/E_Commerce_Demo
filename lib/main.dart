import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_task/controller/binding.dart';
import 'package:get/get.dart';

import 'view/constants/const_colors.dart';
import 'view/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
  // for transparent status Bar
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'eighty Three Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kPrimaryColor83,
          fontFamily: 'Poppins',
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: kPrimaryColor83),
          scaffoldBackgroundColor: kWhiteGreyColor83,
          iconTheme: const IconThemeData(color: kPrimaryColor83)),
      initialRoute: "/",
      initialBinding: InitialBinding(),
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
      ],
    );
  }
}
