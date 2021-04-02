
// import 'package:shared_preferences/shared_preferences.dart';

// SharedPreferences prefs;

// class ApiService {
//   final String apiKey = "384c56b9f94e97aae0a79a9e9a47d908";
//   final String baseUrl = "https://api.openweathermap.org/data/2.5/onecall";

//   // Future<WeatherData> getEventDetails() async {
//   //   final String url =
//   //       "$baseUrl?lat=3.95&lon=-0.12&units=metric&exclude=minutely,hourly&appid=$apiKey";
//   //   final response = await http.get(url);

//   //   print(url);

//   //   var responseJson = json.decode(response.body);
//   //   WeatherData weatherData = WeatherData.fromJson(responseJson);

//   //   return weatherData;
//   // }
// }


import 'package:movie_download_app/core/model/error_model.dart';
import 'package:movie_download_app/core/model/movie_model.dart';
import 'package:movie_download_app/utils/helpers.dart';
import 'package:movie_download_app/utils/http/api_keys.dart';
import 'package:movie_download_app/utils/http/paths.dart';

import 'index.dart';

class MovieApiService {


  getMovies() async {
    try {
      final result = await http.get(Paths.fetchMovies + apiKey + Paths.completeUrl);
      if (result is ErrorModel) {
        print("ERROR");
        showErrorToast('Fetch failed');
        print(result.error);
        var data = result.error;
        List<Results> postList = List<Results>.from(
            data.map((item) => MovieModel.fromJson(item)));
         return ErrorModel(postList);

      }

      var data = result.data["results"];
      // var list = (data as List)
      //     .map((item) => new PlaceholderModel.fromJson(item))
      //     .toList();
     // print(list.runtimeType);
      //return list;
      List<Results> movieList = List<Results>.from(
          data.map((item) => Results.fromJson(item)));
      return movieList;
    } catch (e) {
      print(e.toString());
      return ErrorModel('$e');
    }
  }
}
