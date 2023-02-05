import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goal/constants/appColors.dart';
import 'package:goal/modules/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: SystemUiOverlay.values,
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: MyColors.appBackgroundColor,
  ));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      MaterialApp(
        home: Splash(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
