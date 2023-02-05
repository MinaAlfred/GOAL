import 'package:flutter/material.dart';
import 'package:goal/constants/appColors.dart';
import 'package:goal/constants/utils/size_config.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyToast {
  MyToast(message, {double fontSize, Color fontColor, Color background,String color}) {
    Fluttertoast.showToast(
        webBgColor: color,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 15,
        msg: message.toString(),
        fontSize: fontSize ?? getFont(20),
        textColor: MyColors.appBackgroundColor,
        backgroundColor: MyColors.whiteColor);
  }
}
