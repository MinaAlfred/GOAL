import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goal/constants/appColors.dart';
import 'package:goal/constants/utils/size_config.dart';
import 'package:goal/constants/widget/image.dart';
import 'package:goal/modules/home/veiw/home_screen.dart';
import 'package:page_transition/page_transition.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() =>  _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: MyColors.appBackgroundColor,
      child: AnimatedSplashScreen(
          duration: 3000,
          centered: true,
          splashIconSize: 500,
          animationDuration: const Duration(seconds: 3),
          splash: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyImage.drawImage(
                'assets/images/GOAL logo.png',
                fit: BoxFit.fill,
                width: getWidth(280),
                height: getHeight(220),
              ),
              Transform.scale(
                scale: 0.5,
                child: LinearProgressIndicator(
                  minHeight: getHeight(7),
                  backgroundColor: MyColors.appBackgroundColor,
                  color: MyColors.whiteColor,
                ),
              ),
            ],
          ),
          nextScreen: HomeScreen(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          backgroundColor: Colors.transparent),
    );
  }
}
