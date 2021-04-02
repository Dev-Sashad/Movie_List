
// class MovieModel {
//   int page;
//   List<Results> results;
//   int totalResults;
//   int totalPages;

//   MovieModel({this.page, this.results, this.totalResults, this.totalPages});

//   MovieModel.fromJson(Map<String, dynamic> json) {
//     if(json["page"] is int)
//       this.page = json["page"];
//     if(json["results"] is List)
//       this.results = json["results"]==null?[]:(json["results"] as List).map((e)=>Results.fromJson(e)).toList();
//     if(json["total_results"] is int)
//       this.totalResults = json["total_results"];
//     if(json["total_pages"] is int)
//       this.totalPages = json["total_pages"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data["page"] = this.page;
//     if(this.results != null)
//       data["results"] = this.results.map((e)=>e.toJson()).toList();
//     data["total_results"] = this.totalResults;
//     data["total_pages"] = this.totalPages;
//     return data;
//   }
// }

// class Results {
//   String posterPath;
//   bool adult;
//   String overview;
//   String releaseDate;
//   List<int> genreIds;
//   int id;
//   String originalTitle;
//   String originalLanguage;
//   String title;
//   String backdropPath;
//   double popularity;
//   int voteCount;
//   bool video;
//   double voteAverage;

//   Results({this.posterPath, this.adult, this.overview, this.releaseDate, this.genreIds, this.id, this.originalTitle, this.originalLanguage, this.title, this.backdropPath, this.popularity, this.voteCount, this.video, this.voteAverage});

//   Results.fromJson(Map<String, dynamic> json) {
//     if(json["poster_path"] is String)
//       this.posterPath = json["poster_path"];
//     if(json["adult"] is bool)
//       this.adult = json["adult"];
//     if(json["overview"] is String)
//       this.overview = json["overview"];
//     if(json["release_date"] is String)
//       this.releaseDate = json["release_date"];
//     if(json["genre_ids"] is List)
//       this.genreIds = json["genre_ids"]?.cast<List<int>>() ?? [];
//     if(json["id"] is int)
//       this.id = json["id"];
//     if(json["original_title"] is String)
//       this.originalTitle = json["original_title"];
//     if(json["original_language"] is String)
//       this.originalLanguage = json["original_language"];
//     if(json["title"] is String)
//       this.title = json["title"];
//     if(json["backdrop_path"] is String)
//       this.backdropPath = json["backdrop_path"];
//     if(json["popularity"] is double)
//       this.popularity = json["popularity"];
//     if(json["vote_count"] is int)
//       this.voteCount = json["vote_count"];
//     if(json["video"] is bool)
//       this.video = json["video"];
//     if(json["vote_average"] is double)
//       this.voteAverage = json["vote_average"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data["poster_path"] = this.posterPath;
//     data["adult"] = this.adult;
//     data["overview"] = this.overview;
//     data["release_date"] = this.releaseDate;
//     if(this.genreIds != null)
//       data["genre_ids"] = this.genreIds;
//     data["id"] = this.id;
//     data["original_title"] = this.originalTitle;
//     data["original_language"] = this.originalLanguage;
//     data["title"] = this.title;
//     data["backdrop_path"] = this.backdropPath;
//     data["popularity"] = this.popularity;
//     data["vote_count"] = this.voteCount;
//     data["video"] = this.video;
//     data["vote_average"] = this.voteAverage;
//     return data;
//   }
// }
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

MovieModel welcomeFromJson(String str) => MovieModel.fromJson(json.decode(str));

String welcomeToJson(MovieModel data) => json.encode(data.toJson());

class MovieModel {
    MovieModel({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    int page;
    List<Results> results;
    int totalPages;
    int totalResults;

    factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        page: json["page"],
        results: List<Results>.from(json["results"].map((x) => Results.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class Results {
    Results({
        this.adult,
        this.backdropPath,
        this.genreIds,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
    });

    bool adult;
    String backdropPath;
    List<int> genreIds;
    int id;
    String originalLanguage;
    String originalTitle;
    String overview;
    double popularity;
    String posterPath;
    DateTime releaseDate;
    String title;
    bool video;
    double voteAverage;
    int voteCount;

    factory Results.fromJson(Map<String, dynamic> json) => Results(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}
