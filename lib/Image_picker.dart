import 'test.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Details extends StatelessWidget {
   Details({super.key,required this.details});
   Map details={};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: SafeArea(
  child: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            splashColor: null,
            onTap: (){
              showDialog(context: context,
                builder: (BuildContext context) {
                  return AlertDialog( backgroundColor: Colors.white.withOpacity(0.0),
                    content:  FadeInImage(
                        fit: BoxFit.fitHeight,
                        height: MediaQuery.of(context).orientation==Orientation.portrait?
                        MediaQuery.of(context).size.height/2:
                        MediaQuery.of(context).size.height/2,
                        width: MediaQuery.of(context).orientation==Orientation.portrait?
                        MediaQuery.of(context).size.width/2:
                        MediaQuery.of(context).size.height/2,
                        placeholder: MemoryImage(kTransparentImage),
                        image:NetworkImage(
                            details["poster_path"]==null?
                            details["backdrop_path"]==null?
                            "https://w0.peakpx.com/wallpaper/20/806/HD-wallpaper-friends-animated-tv-series.jpg"
                                :
                            "https://image.tmdb.org/t/p/original${details["backdrop_path"]}"
                                : "https://image.tmdb.org/t/p/original${details["poster_path"]}"
                        )),);},
              );
            },
            child: FadeInImage(
                fit: BoxFit.fitHeight,
                height: MediaQuery.of(context).orientation==Orientation.portrait?
                MediaQuery.of(context).size.height/4:
                MediaQuery.of(context).size.height/3,
                width: MediaQuery.of(context).orientation==Orientation.portrait?
                MediaQuery.of(context).size.width/3:
                MediaQuery.of(context).size.height/4,
                placeholder: MemoryImage(kTransparentImage),
                image:NetworkImage(
                    details["poster_path"]==null?
                    details["backdrop_path"]==null?
                    "https://w0.peakpx.com/wallpaper/20/806/HD-wallpaper-friends-animated-tv-series.jpg"
                        :
                    "https://image.tmdb.org/t/p/original${details["backdrop_path"]}"
                        : "https://image.tmdb.org/t/p/original${details["poster_path"]}"
                )),
          ),

          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Ratewidget(rate:details["vote_average"]),
                  ],
                ),
                Text( details["name"]==null? details["title"]
                              :details["name"] ,
                      textAlign: TextAlign.center,style: TextStyle(fontSize: 20),
                  overflow: TextOverflow.fade,
                ),
                SizedBox(width: 3,height: 3,),
                Text("Country: ${details["origin_country"].toString()}",
                  style: TextStyle(fontSize: 20),
                  overflow: TextOverflow.fade,
                ),
                SizedBox(width: 3,height: 3,),
                Text( "Language :${details["original_language"].toString()}",
                  style: TextStyle(fontSize: 20),
                  overflow: TextOverflow.fade,
                ),


                SizedBox(width: 3,height: 3,),

                Text( details["adult"]==true?"+18":"+12",
                style: TextStyle(fontSize: 20),
                  overflow: TextOverflow.fade,
                ),

              ],
            ),
          )
        ],
      ),
      SizedBox(width: 10,height: 10,),
      Text(" Overview",style:TextStyle(fontSize: 30,color: Theme.of(context).primaryColor) ),
      Text( details["overview"],
      style: TextStyle(fontSize: 20),
        overflow: TextOverflow.fade,
      ),
    ],
  ),),
),
    );
  }
}
