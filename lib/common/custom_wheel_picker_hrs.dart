import 'package:flutter/cupertino.dart';
import '../utils/app_color.dart';
import '../utils/app_style.dart';

class CustomWheelPickerHrs extends StatefulWidget {
  List list;

  CustomWheelPickerHrs({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  State<CustomWheelPickerHrs> createState() => _CustomWheelPickerHrsState();
}

class _CustomWheelPickerHrsState extends State<CustomWheelPickerHrs> {
  late int currentIndex;
  late FixedExtentScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker.builder(
      itemExtent: 24,
      useMagnifier: true,
      squeeze: 1.1,
      diameterRatio: 1,
      magnification: 1.5,
      selectionOverlay: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              //<--- top side
              color: AppColor.primary_blue,
              width: 1.0,
            ),
            bottom: BorderSide(
              //  <--- top side
              color: AppColor.primary_blue,
              width: 1.0,
            ),
          ),
        ),
      ),
      scrollController: scrollController,
      childCount: widget.list.length,
      onSelectedItemChanged: (int value) => setState(() {
        currentIndex = value;
      }),
      itemBuilder: (BuildContext context, int index) {
        return Text("${widget.list[index]}",
            style: currentIndex == index
                ? AppStyle.large_text_black.copyWith(
                    fontWeight: FontWeight.w600, color: AppColor.primary_blue)
                : AppStyle.large_text_black.copyWith(
                    fontWeight: FontWeight.w400,
                  ));
      },
    );
  }

  @override
  void initState() {
    super.initState();
    currentIndex = (widget.list.length / 2).floor();
    scrollController = FixedExtentScrollController(
        initialItem: (widget.list.length / 2).floor());
  }
}
