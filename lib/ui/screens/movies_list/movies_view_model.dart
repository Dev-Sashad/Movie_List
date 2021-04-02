
import 'package:movie_download_app/core/model/error_model.dart';
import 'package:movie_download_app/core/model/movie_model.dart';
import 'package:movie_download_app/core/services/api_service.dart';
import 'package:movie_download_app/utils/baseModel.dart';
import 'package:movie_download_app/utils/locator.dart';

class MoviesViewModel extends BaseModel {
  final MovieApiService _movies= locator<MovieApiService>();

  Future<List<Results>> fetchMovies() async {
    //setBusy(true);
    var result = await _movies.getMovies();
    if (result is ErrorModel) {
      // showToast('Login failed');
      print(result.error);
      notifyListeners();
      throw Exception('Failed to load internet');
      //return ErrorModel(result.error);
    }
    print(result);
    return result;
  }
}
