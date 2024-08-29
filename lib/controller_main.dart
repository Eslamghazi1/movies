import 'package:com.example.app/constants.dart';
import 'package:get/get.dart';
import 'package:tmdb_api/tmdb_api.dart';

abstract class MainController extends GetxController{

  loadmovies();
}

class MainControllerIMP extends MainController{
  Map  trendingresults= {};

  @override
  loadmovies()async {
    TMDB tmdb=TMDB(ApiKeys(API_KEY,API_TOKEN),
    logConfig: ConfigLogger(showLogs: true,
    showErrorLogs: true));

    Map trendingresults=await tmdb.v3.tv.getPopular();
    print("++++++++++++++++++++");
    print(trendingresults);
    return trendingresults;
    update();
  }

}
