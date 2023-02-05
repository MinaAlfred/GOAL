import 'package:flutter/material.dart';
import 'package:goal/constants/appColors.dart';

class DividerItem extends StatelessWidget {
  const DividerItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Divider(
        color: MyColors.mediumGreyColor,
        thickness: 0.5,
      ),
    );
  }
}
