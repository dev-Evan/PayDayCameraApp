import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future CustomNavigator({context, pageName}) {
  return Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => pageName,
      ));
}
