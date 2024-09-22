import 'controller_main.dart';
import 'details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    MainControllerIMP controller = Get.put(MainControllerIMP());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: [
            IconButton(onPressed: () {
      
            }, icon: IconButton(onPressed:(){
              showSearch(context: context, delegate: datasearch());
            },icon:Icon(Icons.search)))
          ],
        ),
        body: FutureBuilder(
            future: controller.loadmovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.data != null) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
      
                      // Tredening movies
                      Text(" Trending ",style: TextStyle(fontSize: 30),),
                      SizedBox(width: 10,height: 10),
                      Container(
                        height: MediaQuery.of(context).orientation==Orientation.portrait?
                        MediaQuery.of(context).size.height/3+15:
                        MediaQuery.of(context).size.height/2+15
                        ,
                        width: MediaQuery.of(context).orientation==Orientation.portrait?
                        MediaQuery.of(context).size.width:
                        MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  InkWell(
                                    splashColor: null,
                                    onTap: (){
                                      Get.to(()=>Details(details: controller.topmovies["results"][index]));
      
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 4),
                                      child: FadeInImage(
                                        fit: BoxFit.cover,
                                          height: MediaQuery.of(context).orientation==Orientation.portrait?
                                          MediaQuery.of(context).size.height/4:
                                          MediaQuery.of(context).size.height/3,
                                          width: MediaQuery.of(context).orientation==Orientation.portrait?
                                          MediaQuery.of(context).size.width/3:
                                          MediaQuery.of(context).size.height/4,
                                          placeholder: MemoryImage(kTransparentImage),
                                          image:NetworkImage(
                                              controller.topmovies["results"][index]["poster_path"]==null?
                                              controller.topmovies["results"][index]["backdrop_path"]==null?
                                              "https://w0.peakpx.com/wallpaper/20/806/HD-wallpaper-friends-animated-tv-series.jpg"
                                                  :
                                              "https://image.tmdb.org/t/p/original${controller.topmovies["results"][index]["backdrop_path"]}"
                                                  : "https://image.tmdb.org/t/p/original${controller.topmovies["results"][index]["poster_path"]}"
                                          )),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).orientation==Orientation.portrait?
                                    MediaQuery.of(context).size.width/3:
                                    MediaQuery.of(context).size.height/4,
                                    child: Text(controller.topmovies["results"][index]["name"]==null?
                                    controller.topmovies["results"][index]["title"]:
                                    controller.topmovies["results"][index]["name"],
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
      
                                ],
                              );
                          },
                          itemCount: controller.topmovies["results"].length,
                        ),
                      ),
                      // popular movies
                      Text(" Puplar ",style: TextStyle(fontSize: 30),),
                      SizedBox(width: 10,height: 10),
                      Container(
                        height: MediaQuery.of(context).orientation==Orientation.portrait?
                        MediaQuery.of(context).size.height/3+40:
                        MediaQuery.of(context).size.height/2+15                      ,
                        width: MediaQuery.of(context).orientation==Orientation.portrait?
                        MediaQuery.of(context).size.width:
                        MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  splashColor: null,
                                  onTap: (){
                                    Get.to(()=>Details(details: controller.puplarmovies["results"][index]));
      
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    child: FadeInImage(
                                        fit: BoxFit.cover,
                                        height: MediaQuery.of(context).orientation==Orientation.portrait?
                                        MediaQuery.of(context).size.height/4:
                                        MediaQuery.of(context).size.height/3,
                                        width: MediaQuery.of(context).orientation==Orientation.portrait?
                                        MediaQuery.of(context).size.width/3:
                                        MediaQuery.of(context).size.height/4,
                                        placeholder: MemoryImage(kTransparentImage),
                                        image:  NetworkImage(
                                            controller.puplarmovies["results"][index]["poster_path"]==null?
                                            controller.puplarmovies["results"][index]["backdrop_path"]==null?
                                            "https://w0.peakpx.com/wallpaper/20/806/HD-wallpaper-friends-animated-tv-series.jpg"
                                                :
                                            "https://image.tmdb.org/t/p/original${controller.puplarmovies["results"][index]["backdrop_path"]}"
                                                : "https://image.tmdb.org/t/p/original${controller.puplarmovies["results"][index]["poster_path"]}"
                                        )),
      
      
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).orientation==Orientation.portrait?
                                  MediaQuery.of(context).size.width/3:
                                  MediaQuery.of(context).size.height/4,
                                  child: Text(controller.puplarmovies["results"][index]["name"]==null?
                                  controller.puplarmovies["results"][index]["title"]:
                                  controller.puplarmovies["results"][index]["name"],
                                    textAlign: TextAlign.center,
                                  ),
                                ),
      
                              ],
                            );
                          },
                          itemCount: controller.puplarmovies["results"].length,
                        ),
                      ),
      
      
                      SizedBox(width: 10,height: 10),
      
      
                      Text(" Trending Movies",style: TextStyle(fontSize: 30),),
                      SizedBox(width: 10,height: 10),
                      Container(
                        height: MediaQuery.of(context).orientation==Orientation.portrait?
                        MediaQuery.of(context).size.height/3+15:
                        MediaQuery.of(context).size.height/2+15                      ,
                        width: MediaQuery.of(context).orientation==Orientation.portrait?
                        MediaQuery.of(context).size.width:
                        MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  splashColor: null,
                                  onTap: (){
                                    Get.to(()=>Details(details: controller.anothermoviestop["results"][index]));
      
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    child: FadeInImage(
                                        fit: BoxFit.cover,
                                        height: MediaQuery.of(context).orientation==Orientation.portrait?
                                        MediaQuery.of(context).size.height/4:
                                        MediaQuery.of(context).size.height/3,
                                        width: MediaQuery.of(context).orientation==Orientation.portrait?
                                        MediaQuery.of(context).size.width/3:
                                        MediaQuery.of(context).size.height/4,
                                        placeholder: MemoryImage(kTransparentImage),
                                        image:  NetworkImage(
                                            controller.anothermoviestop["results"][index]["poster_path"]==null?
                                            controller.anothermoviestop["results"][index]["backdrop_path"]==null?
                                            "https://w0.peakpx.com/wallpaper/20/806/HD-wallpaper-friends-animated-tv-series.jpg"
                                                :
                                            "https://image.tmdb.org/t/p/original${controller.anothermoviestop["results"][index]["backdrop_path"]}"
                                                : "https://image.tmdb.org/t/p/original${controller.anothermoviestop["results"][index]["poster_path"]}"
                                        )),
      
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).orientation==Orientation.portrait?
                                  MediaQuery.of(context).size.width/3:
                                  MediaQuery.of(context).size.height/4,
                                  child: Text(controller.anothermoviestop["results"][index]["name"]==null?
                                  controller.anothermoviestop["results"][index]["title"]:
                                  controller.anothermoviestop["results"][index]["name"],
                                    textAlign: TextAlign.center,
                                  ),
                                ),
      
                              ],
                            );
                          },
                          itemCount: controller.anothermoviestop["results"].length,
                        ),
                      ),
      
                      Text(" Trending Movies",style: TextStyle(fontSize: 30),),
                      SizedBox(width: 10,height: 10),
                      Container(
                        height: MediaQuery.of(context).orientation==Orientation.portrait?
                        MediaQuery.of(context).size.height/3+15:
                        MediaQuery.of(context).size.height/2+15                      ,
                        width: MediaQuery.of(context).orientation==Orientation.portrait?
                        MediaQuery.of(context).size.width:
                        MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  splashColor: null,
                                  onTap: (){
                                    Get.to(()=>Details(details: controller.moviespuplar["results"][index]));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    child: FadeInImage(
                                        fit: BoxFit.cover,
                                        height: MediaQuery.of(context).orientation==Orientation.portrait?
                                        MediaQuery.of(context).size.height/4:
                                        MediaQuery.of(context).size.height/3,
                                        width: MediaQuery.of(context).orientation==Orientation.portrait?
                                        MediaQuery.of(context).size.width/3:
                                        MediaQuery.of(context).size.height/4,
                                        placeholder: MemoryImage(kTransparentImage),
                                        image: NetworkImage(
                                            controller.moviespuplar["results"][index]["poster_path"]==null?
                                            controller.moviespuplar["results"][index]["backdrop_path"]==null?
                                            "https://w0.peakpx.com/wallpaper/20/806/HD-wallpaper-friends-animated-tv-series.jpg"
                                                :
                                            "https://image.tmdb.org/t/p/original${controller.moviespuplar["results"][index]["backdrop_path"]}"
                                                : "https://image.tmdb.org/t/p/original${controller.moviespuplar["results"][index]["poster_path"]}"
                                        )),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).orientation==Orientation.portrait?
                                  MediaQuery.of(context).size.width/3:
                                  MediaQuery.of(context).size.height/4,
                                  child: Text(controller.moviespuplar["results"][index]["name"]==null?
                                  controller.moviespuplar["results"][index]["title"]:
                                  controller.moviespuplar["results"][index]["name"],
                                    textAlign: TextAlign.center,
                                  ),
                                ),
      
                              ],
                            );
                          },
                          itemCount: controller.moviespuplar["results"].length,
                        ),
                      ),
      
      
                      SizedBox(width: 10,height: 10),
      
      
      
                    //   Trending tv
                      Text(" Trending Tv",style: TextStyle(fontSize: 30),),
                      SizedBox(width: 10,height: 10),
                      Container(
                        height: MediaQuery.of(context).orientation==Orientation.portrait?
                        MediaQuery.of(context).size.height/3+40:
                        MediaQuery.of(context).size.height/2+15                      ,
                        width: MediaQuery.of(context).orientation==Orientation.portrait?
                        MediaQuery.of(context).size.width:
                        MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  splashColor: null,
                                  onTap: (){
                                    Get.to(()=>Details(details: controller.toptv["results"][index]));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    child: FadeInImage(
                                        fit: BoxFit.cover,
                                        height: MediaQuery.of(context).orientation==Orientation.portrait?
                                        MediaQuery.of(context).size.height/4:
                                        MediaQuery.of(context).size.height/3,
                                        width: MediaQuery.of(context).orientation==Orientation.portrait?
                                        MediaQuery.of(context).size.width/3:
                                        MediaQuery.of(context).size.height/4,
                                        placeholder: MemoryImage(kTransparentImage),
                                        image: NetworkImage(
                                            controller.toptv["results"][index]["poster_path"]==null?
                                            controller.toptv["results"][index]["backdrop_path"]==null?
                                            "https://w0.peakpx.com/wallpaper/20/806/HD-wallpaper-friends-animated-tv-series.jpg"
                                                :
                                            "https://image.tmdb.org/t/p/original${controller.toptv["results"][index]["backdrop_path"]}"
                                                : "https://image.tmdb.org/t/p/original${controller.toptv["results"][index]["poster_path"]}"
                                        )),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).orientation==Orientation.portrait?
                                  MediaQuery.of(context).size.width/3:
                                  MediaQuery.of(context).size.height/4,
                                  child: Text(controller.toptv["results"][index]["name"]==null?
                                  controller.toptv["results"][index]["title"]:
                                  controller.toptv["results"][index]["name"],
                                    textAlign: TextAlign.center,
                                  ),
                                ),
      
                              ],
                            );
                          },
                          itemCount: controller.toptv["results"].length,
                        ),
                      ),
      
                    //
                      //
                      //
                      //
                      //
                      //   Puplar tv
      
      
                      Text(" Puplar Tv",style: TextStyle(fontSize: 30),),
                      SizedBox(width: 10,height: 10),
                      Container(
                        height: MediaQuery.of(context).orientation==Orientation.portrait?
                        MediaQuery.of(context).size.height/3+40:
                        MediaQuery.of(context).size.height/2+15                      ,
                        width: MediaQuery.of(context).orientation==Orientation.portrait?
                        MediaQuery.of(context).size.width:
                        MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  splashColor: null,
                                  onTap: (){
                                   Get.to(()=>Details(details: controller.puplartv["results"][index]));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    child: FadeInImage(
                                        fit: BoxFit.cover,
                                        height: MediaQuery.of(context).orientation==Orientation.portrait?
                                        MediaQuery.of(context).size.height/4:
                                        MediaQuery.of(context).size.height/3,
                                        width: MediaQuery.of(context).orientation==Orientation.portrait?
                                        MediaQuery.of(context).size.width/3:
                                        MediaQuery.of(context).size.height/4,
                                        placeholder: MemoryImage(kTransparentImage),
                                        image: NetworkImage(
                                            controller.puplartv["results"][index]["poster_path"]==null?
                                        controller.puplartv["results"][index]["backdrop_path"]==null?
                                        "https://w0.peakpx.com/wallpaper/20/806/HD-wallpaper-friends-animated-tv-series.jpg"
                                            :
                                        "https://image.tmdb.org/t/p/original${controller.puplartv["results"][index]["backdrop_path"]}"
                                           : "https://image.tmdb.org/t/p/original${controller.puplartv["results"][index]["poster_path"]}"
                                        )),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).orientation==Orientation.portrait?
                                  MediaQuery.of(context).size.width/3:
                                  MediaQuery.of(context).size.height/4,
                                  child: Text(controller.puplartv["results"][index]["name"]==null?
                                  controller.puplartv["results"][index]["title"]:
                                  controller.puplartv["results"][index]["name"],
                                    textAlign: TextAlign.center,
                                  ),
                                ),
      
                              ],
                            );
                          },
                          itemCount: controller.puplartv["results"].length,
                        ),
                      ),
      
                      //
                      //
                      //
                      //
                      //   Puplar tv
                    //   tester
      
                      Text(" Upcoming ",style: TextStyle(fontSize: 30),),
                      SizedBox(width: 10,height: 10),
                      Container(
                        height: MediaQuery.of(context).orientation==Orientation.portrait?
                        MediaQuery.of(context).size.height/3+40:
                        MediaQuery.of(context).size.height/2+15                      ,
                        width: MediaQuery.of(context).orientation==Orientation.portrait?
                        MediaQuery.of(context).size.width:
                        MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  splashColor: null,
                                  onTap: (){
                                    Get.to(()=>Details(details: controller.upcoming["results"][index]));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    child: FadeInImage(
                                        fit: BoxFit.cover,
                                        height: MediaQuery.of(context).orientation==Orientation.portrait?
                                        MediaQuery.of(context).size.height/4:
                                        MediaQuery.of(context).size.height/3,
                                        width: MediaQuery.of(context).orientation==Orientation.portrait?
                                        MediaQuery.of(context).size.width/3:
                                        MediaQuery.of(context).size.height/4,
                                        placeholder: MemoryImage(kTransparentImage),
                                        image: NetworkImage(
                                            controller.upcoming["results"][index]["poster_path"]==null?
                                            controller.upcoming["results"][index]["backdrop_path"]==null?
                                            "https://w0.peakpx.com/wallpaper/20/806/HD-wallpaper-friends-animated-tv-series.jpg"
                                                :
                                            "https://image.tmdb.org/t/p/original${controller.upcoming["results"][index]["backdrop_path"]}"
                                                : "https://image.tmdb.org/t/p/original${controller.upcoming["results"][index]["poster_path"]}"
                                        )),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).orientation==Orientation.portrait?
                                  MediaQuery.of(context).size.width/3:
                                  MediaQuery.of(context).size.height/4,
                                  child: Text(controller.upcoming["results"][index]["name"]==null?
                                  controller.upcoming["results"][index]["title"]:
                                  controller.upcoming["results"][index]["name"],
                                    textAlign: TextAlign.center,
                                  ),
                                ),
      
                              ],
                            );
                          },
                          itemCount: controller.upcoming["results"].length,
                        ),
                      ),
      
      
                    ],
                  ),
                );
              } else {
                return Text("Nothing yet");
              }
            }),
      ),
    );
  }
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////


class datasearch extends SearchDelegate{
  MainControllerIMP controller = Get.put(MainControllerIMP());
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return[ IconButton(icon: Icon(Icons.close),onPressed: (){
      query="";

    },)];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(icon: Icon(Icons.arrow_back),onPressed: (){

      close(context, context);},);
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    controller.searchdata(query);
    return FutureBuilder(
      future:  controller.searchdata(query),
      builder: (context,snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting)
          return Center(child: CircularProgressIndicator(),);
        return ListView.builder(
          itemBuilder: (context, index) {
            print("the data [$index]:${controller.searched["results"][index]}");
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: null,
                    onTap: (){
                      Get.to(()=>Details(details: controller.searched["results"][index]));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: FadeInImage(
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).orientation==Orientation.portrait?
                          MediaQuery.of(context).size.height/4:
                          MediaQuery.of(context).size.height/3,
                          width: MediaQuery.of(context).orientation==Orientation.portrait?
                          MediaQuery.of(context).size.width/3:
                          MediaQuery.of(context).size.height/4,
                          placeholder: MemoryImage(kTransparentImage),
                          image: NetworkImage(
                              controller.searched["results"][index]["poster_path"]==null?
                              controller.searched["results"][index]["backdrop_path"]==null?
                              "https://w0.peakpx.com/wallpaper/20/806/HD-wallpaper-friends-animated-tv-series.jpg"
                                  :
                              "https://image.tmdb.org/t/p/original${controller.searched["results"][index]["backdrop_path"]}"
                                  : "https://image.tmdb.org/t/p/original${controller.searched["results"][index]["poster_path"]}"
                          )),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).orientation==Orientation.portrait?
                    MediaQuery.of(context).size.width/5:
                    MediaQuery.of(context).size.height/7,
                    child: Text(controller.searched["results"][index]["name"]==null?
                    controller.searched["results"][index]["title"]:
                    controller.searched["results"][index]["name"],
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).orientation==Orientation.portrait?
                    MediaQuery.of(context).size.width/5:
                    MediaQuery.of(context).size.height/7,
                    child: Text("Date: ${controller.searched["results"][index]["release_date"].toString()}",
                      textAlign: TextAlign.center,
                    ),
                  ),

                ],
              ),
            );
          },
          itemCount: controller.searched["results"].length,
        );
      }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // List filter =anime.where((element) =>
    //     element.toString().startsWith(query)).toList();
    // TODO: implement buildSuggestions
    // controller.searchdata(query);
    return  FutureBuilder(
        future:  controller.searchdata(query),
        builder: (context,snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting)
            return Center(child: CircularProgressIndicator(),);
          return ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                splashColor: null,
                onTap: (){
                  Get.to(()=>Details(details: controller.searched["results"][index]));
                },
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(controller.searched["results"][index]["name"]==null?
                      controller.searched["results"][index]["title"]:
                      controller.searched["results"][index]["name"],
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ) ,
              );
            },
            itemCount: controller.searched["results"].length,
          );
        }
    );
  }


}
