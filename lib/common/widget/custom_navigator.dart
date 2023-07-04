import 'package:flutter/cupertino.dart';

Future CustomNavigator({context, pageName}) {
  return Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => pageName,
      ));
}

