import 'package:flutter/material.dart';

import 'ItemPositionsListener.dart';

class ItemPositionsNotifier implements ItemPositionsListener {
  @override
  final ValueNotifier<Iterable<ItemPosition>> itemPositions = ValueNotifier([]);
}