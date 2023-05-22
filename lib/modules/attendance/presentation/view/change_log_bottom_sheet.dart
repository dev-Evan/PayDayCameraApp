import 'package:flutter/material.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';

import '../../../../utils/app_string.dart';

class ChangeLogBottomSheet extends StatelessWidget {
  const ChangeLogBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: .8,
      maxChildSize: .8,
      minChildSize: .5,
      builder: (BuildContext context, ScrollController scrollController) =>
          Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16))),
              child: Column(
                children: [
                  bottomSheetAppbar(
                      context: context, appbarTitle: AppString.text_change_log),
                  _contentBody(),
                ],
              )),
    );
  }

  _contentBody() {
    return Column(
      children: [
        Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    onPressed: () {}, child:  Text(AppString.text_button_button))))
      ],
    );
  }
}
