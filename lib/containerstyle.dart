import 'package:flutter/material.dart';
import 'constants.dart';


class containerStyle extends StatelessWidget {
  containerStyle({@required this.richTextChild});

  final Widget richTextChild;

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: kBoxDecoration,
      child: richTextChild,

    );
  }
}

