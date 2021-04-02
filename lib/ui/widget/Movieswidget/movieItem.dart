import 'package:flutter/material.dart';
import 'package:movie_download_app/core/model/movie_model.dart';
import 'package:movie_download_app/utils/helpers.dart';
import 'package:movie_download_app/utils/styles/textstyles.dart';

class MovieItem extends StatelessWidget {
  final Results movieModel;

  MovieItem({this.movieModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          Row(children: [
            Container(
              height: 80,
              width: 80,
              child: Image.network(Uri.https(
                      "image.tmdb.org", "/t/p/w500${movieModel.backdropPath}")
                  .toString()),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text(
                  movieModel.title,
                  style: movieDetailStyle,
                ),

                Text(
                  movieModel.overview,
                  style: movieDetailStyle,
                ),

                Text(
                  formatDate(movieModel.releaseDate).toString(),
                  style: movieDetailStyle,
                ),
                Row(children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Text(
                    movieModel.voteAverage.toString(),
                    style: movieDetailStyle,
                  )
                ]),
              ],
            ))
          ]),
          Divider(
            color: Colors.grey,
          ),
        ]));
  }
}
