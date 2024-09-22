import 'package:com.example.app/constants.dart';
import 'package:get/get.dart';
import 'package:tmdb_api/tmdb_api.dart';

abstract class MainController extends GetxController{

  loadmovies();
}

class MainControllerIMP extends MainController{
  Map  toptv= {};
  Map  puplartv={};
  Map  puplarmovies={};
  Map  topmovies={};
  Map  anothermoviestop={};
  Map  moviespuplar={};
  Map another={};
  Map searched={};
  @override
  loadmovies()async {
   try {
      TMDB tmdb = TMDB(ApiKeys(API_KEY, API_TOKEN),
          logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
      toptv = await tmdb.v3.tv.getTopRated();
      puplartv= await tmdb.v3.tv.getPopular();
      puplarmovies= await tmdb.v3.movies.getPopular();
      topmovies = await tmdb.v3.trending.getTrending(timeWindow:TimeWindow.week);
      anothermoviestop= await tmdb.v3.movies.getTopRated();
      moviespuplar= await tmdb.v3.movies.getPopular();
      // another =await tmdb.v3.collections.getDetails(5);
      // print("the collection you have is :$another");




      update();
      return "done";
    }catch (e){
     return "failed";
   }
  }
  searchdata(String data)async{
    TMDB tmdb = TMDB(ApiKeys(API_KEY, API_TOKEN),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    searched = await tmdb.v3.search.queryMovies(data);
    return searched;

  }

}
