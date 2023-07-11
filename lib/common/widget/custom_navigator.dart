import 'package:flutter/cupertino.dart';

Future customNavigator({context, pageName}) {
  return Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => pageName,
      ));
}

