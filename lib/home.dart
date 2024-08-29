import 'package:com.example.app/controller_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Home extends StatelessWidget {
  Home({super.key});
  @override
  Widget build(BuildContext context) {
    // MainControllerIMP controller=Get.find<MainControllerIMP>();
    MainControllerIMP controller=Get.put(MainControllerIMP());

    // await  controller.loadmovies();
    print("the contrlller is tiowf");
    print(controller.trendingresults);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
              },
              icon: Icon(Icons.output_outlined))
        ],
      ),
      body:
        ListView.builder(itemBuilder: (context,index){
          return FutureBuilder(
            future: controller.loadmovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }
              print(snapshot.data);
              if(snapshot.data!=null){

              return Container(height: 300,width: 100,
              decoration: BoxDecoration(image: DecorationImage(
                  image: NetworkImage("https://image.tmdb.org/t/p/original${controller.trendingresults["results"
                      ][index]["poster_path"].toString()}"))),);
              }else {
                return Text("Nothing yet");
    }

              // return Container();
            }
          );
        },itemCount:
        controller.trendingresults["resluts"].length,
        ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
