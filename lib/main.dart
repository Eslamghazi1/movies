import 'controller_main.dart';
import 'home.dart';
import 'splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ...
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Info',
      // darkTheme: ThemeData.dark(),

      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue,
        // scaffoldBackgroundColor: Colors.black12,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: Splash(),

      routes: {
        "home":(context)=>Home(),
      },
    );
  }
}



// https://api.themoviedb.org/3
