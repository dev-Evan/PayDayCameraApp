import 'package:flutter/cupertino.dart';

import '../../utils/images.dart';
import 'custom_appbar.dart';
import 'custom_spacer.dart';

Center get noDataFound{
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        customSpacerHeight(height: 158),
        svgIcon(
          height: 160,
          width: 160,
          url: Images.no_data_found,
        ),
      ],
    ),
  );
}