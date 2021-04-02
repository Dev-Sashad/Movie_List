import 'package:flutter/material.dart';
import 'package:movie_download_app/ui/screens/movies_list/movies_view.dart';
import 'package:movie_download_app/utils/constants/colors.dart';
import 'package:movie_download_app/utils/styles/textstyles.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'splahscreen_viewmodel.dart';

class SplashscreenView extends StatelessWidget {
  const SplashscreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SplashScreenViewModel>.withConsumer(
      viewModelBuilder: () => SplashScreenViewModel(),
      builder: (context, model, child) =>  AnimatedSplashScreen(
          backgroundColor: AppColors.primaryColor ,
          splash: Column(
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //mainAxisSize: MainAxisSize.max,
            children: [

              Text('Movies', style: splashTextStyle,)
            
            ],
          ), 

          splashTransition: SplashTransition.slideTransition,
          nextScreen: Movies (),
      ),
    );
  }
}
