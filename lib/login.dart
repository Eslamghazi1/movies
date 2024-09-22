
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller_main.dart';
import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  MainControllerIMP controller = Get.put(MainControllerIMP());
  loading()async{
   await Future.delayed(Duration(seconds: 1));
   Get.offAll(()=>Home());
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        body: Container(
          color: Colors.blueGrey.withAlpha(30),
          height: double.infinity,
          width: double.infinity,
          child:Center(child: Image.asset("images/movies.png",
            width: 100,
            height: 100,
          ),)
        ),
        ),

    );
  }
}
