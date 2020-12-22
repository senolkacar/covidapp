import 'package:flutter/material.dart';
import 'constants.dart';

class RichTextStyle extends StatelessWidget {
  RichTextStyle({@required this.title,this.number});
  final TextSpan title;
  final TextSpan number;
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          style: kTextStyle,
          children: [
            title,number,
          ]
      ),
    );
  }
}
