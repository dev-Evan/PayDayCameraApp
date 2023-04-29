import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

abstract class CustomRenderViewport
    extends RenderViewportBase<CustomSliverPhysicalContainerParentData> {
  /// Creates a viewport for [RenderSliver] objects.
  ///
  /// If the [center] is not specified, then the first child in the `children`
  /// list, if any, is used.
  ///
  /// The [offset] must be specified. For testing purposes, consider passing a
  /// [new ViewportOffset.zero] or [new ViewportOffset.fixed].
  CustomRenderViewport({
    AxisDirection axisDirection = AxisDirection.down,
    required AxisDirection crossAxisDirection,
    required ViewportOffset offset,
    double anchor = 0.0,
    List<RenderSliver>? children,
    RenderSliver? center,
    double? cacheExtent,
    CacheExtentStyle cacheExtentStyle = CacheExtentStyle.pixel,
    Clip clipBehavior = Clip.hardEdge,
  })  : assert(anchor != null),
        assert(anchor >= 0.0 && anchor <= 1.0),
        assert(cacheExtentStyle != CacheExtentStyle.viewport ||
            cacheExtent != null),
        assert(clipBehavior != null),
        _center = center,
        super(
          axisDirection: axisDirection,
          crossAxisDirection: crossAxisDirection,
          offset: offset,
          cacheExtent: cacheExtent,
          cacheExtentStyle: cacheExtentStyle,
          clipBehavior: clipBehavior,
        ) {
    addAll(children);
    if (center == null && firstChild != null) _center = firstChild;
  }

  /// If a [RenderAbstractViewport] overrides
  /// [RenderObject.describeSemanticsConfiguration] to add the [SemanticsTag]
  /// [useTwoPaneSemantics] to its [SemanticsConfiguration], two semantics nodes
  /// will be used to represent the viewport with its associated scrolling
  /// actions in the semantics tree.
  ///
  /// Two semantics nodes (an inner and an outer node) are necessary to exclude
  /// certain child nodes (via the [excludeFromScrolling] tag) from the
  /// scrollable area for semantic purposes: The [SemanticsNode]s of children
  /// that should be excluded from scrolling will be attached to the outer node.
  /// The semantic scrolling actions and the [SemanticsNode]s of scrollable
  /// children will be attached to the inner node, which itself is a child of
  /// the outer node.
  ///
  /// See also:
  ///
  /// * [RenderViewportBase.describeSemanticsConfiguration], which adds this
  ///   tag to its [SemanticsConfiguration].
  static const SemanticsTag useTwoPaneSemantics =
      SemanticsTag('RenderViewport.twoPane');

  /// When a top-level [SemanticsNode] below a [RenderAbstractViewport] is
  /// tagged with [excludeFromScrolling] it will not be part of the scrolling
  /// area for semantic purposes.
  ///
  /// This behavior is only active if the [RenderAbstractViewport]
  /// tagged its [SemanticsConfiguration] with [useTwoPaneSemantics].
  /// Otherwise, the [excludeFromScrolling] tag is ignored.
  ///
  /// As an example, a [RenderSliver] that stays on the screen within a
  /// [Scrollable] even though the user has scrolled past it (e.g. a pinned app
  /// bar) can tag its [SemanticsNode] with [excludeFromScrolling] to indicate
  /// that it should no longer be considered for semantic actions related to
  /// scrolling.
  static const SemanticsTag excludeFromScrolling =
      SemanticsTag('RenderViewport.excludeFromScrolling');

  @override
  void setupParentData(RenderObject child) {
    if (child.parentData is! CustomSliverPhysicalContainerParentData)
      child.parentData = CustomSliverPhysicalContainerParentData();
  }

  /// The relative position of the zero scroll offset.
  ///
  /// For example, if [anchor] is 0.5 and the [axisDirection] is
  /// [AxisDirection.down] or [AxisDirection.up], then the zero scroll offset is
  /// vertically centered within the viewport. If the [anchor] is 1.0, and the
  /// [axisDirection] is [AxisDirection.right], then the zero scroll offset is
  /// on the left edge of the viewport.
  double get anchor;

  set anchor(double value);

  /// The first child in the [GrowthDirection.forward] growth direction.
  ///
  /// This child that will be at the position defined by [anchor] when the
  /// [ViewportOffset.pixels] of [offset] is `0`.
  ///
  /// Children after [center] will be placed in the [axisDirection] relative to
  /// the [center]. Children before [center] will be placed in the opposite of
  /// the [axisDirection] relative to the [center].
  ///
  /// The [center] must be a child of the viewport.
  RenderSliver? get center => _center;
  RenderSliver? _center;

  set center(RenderSliver? value) {
    if (value == _center) return;
    _center = value;
    markNeedsLayout();
  }

  @override
  bool get sizedByParent => true;

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    assert(() {
      if (!constraints.hasBoundedHeight || !constraints.hasBoundedWidth) {
        switch (axis) {
          case Axis.vertical:
            if (!constraints.hasBoundedHeight) {
              throw FlutterError.fromParts(<DiagnosticsNode>[
                ErrorSummary('Vertical viewport was given unbounded height.'),
                ErrorDescription(
                    'Viewports expand in the scrolling direction to fill their container. '
                    'In this case, a vertical viewport was given an unlimited amount of '
                    'vertical space in which to expand. This situation typically happens '
                    'when a scrollable widget is nested inside another scrollable widget.'),
                ErrorHint(
                    'If this widget is always nested in a scrollable widget there '
                    'is no need to use a viewport because there will always be enough '
                    'vertical space for the children. In this case, consider using a '
                    'Column instead. Otherwise, consider using the "shrinkWrap" property '
                    '(or a ShrinkWrappingViewport) to size the height of the viewport '
                    'to the sum of the heights of its children.')
              ]);
            }
            if (!constraints.hasBoundedWidth) {
              throw FlutterError(
                  'Vertical viewport was given unbounded width.\n'
                  'Viewports expand in the cross axis to fill their container and '
                  'constrain their children to match their extent in the cross axis. '
                  'In this case, a vertical viewport was given an unlimited amount of '
                  'horizontal space in which to expand.');
            }
            break;
          case Axis.horizontal:
            if (!constraints.hasBoundedWidth) {
              throw FlutterError.fromParts(<DiagnosticsNode>[
                ErrorSummary('Horizontal viewport was given unbounded width.'),
                ErrorDescription(
                    'Viewports expand in the scrolling direction to fill their container. '
                    'In this case, a horizontal viewport was given an unlimited amount of '
                    'horizontal space in which to expand. This situation typically happens '
                    'when a scrollable widget is nested inside another scrollable widget.'),
                ErrorHint(
                    'If this widget is always nested in a scrollable widget there '
                    'is no need to use a viewport because there will always be enough '
                    'horizontal space for the children. In this case, consider using a '
                    'Row instead. Otherwise, consider using the "shrinkWrap" property '
                    '(or a ShrinkWrappingViewport) to size the width of the viewport '
                    'to the sum of the widths of its children.')
              ]);
            }
            if (!constraints.hasBoundedHeight) {
              throw FlutterError(
                  'Horizontal viewport was given unbounded height.\n'
                  'Viewports expand in the cross axis to fill their container and '
                  'constrain their children to match their extent in the cross axis. '
                  'In this case, a horizontal viewport was given an unlimited amount of '
                  'vertical space in which to expand.');
            }
            break;
        }
      }
      return true;
    }());
    return constraints.biggest;
  }

  // Out-of-band data computed during layout.
  late double _minScrollExtent;
  late double _maxScrollExtent;
  bool _hasVisualOverflow = false;

  double growSize = 0;

  @override
  bool get hasVisualOverflow => _hasVisualOverflow;

  @override
  void updateOutOfBandData(
      GrowthDirection growthDirection, SliverGeometry childLayoutGeometry) {
    switch (growthDirection) {
      case GrowthDirection.forward:
        _maxScrollExtent += childLayoutGeometry.scrollExtent;
        break;
      case GrowthDirection.reverse:
        _minScrollExtent -= childLayoutGeometry.scrollExtent;
        break;
    }
    if (childLayoutGeometry.hasVisualOverflow) _hasVisualOverflow = true;
  }

  @override
  void updateChildLayoutOffset(RenderSliver child, double layoutOffset,
      GrowthDirection growthDirection) {
    final CustomSliverPhysicalContainerParentData childParentData =
        child.parentData! as CustomSliverPhysicalContainerParentData;
    childParentData.layoutOffset = layoutOffset;
    childParentData.growthDirection = growthDirection;
  }

  @override
  Offset paintOffsetOf(RenderSliver child) {
    final CustomSliverPhysicalContainerParentData childParentData =
        child.parentData! as CustomSliverPhysicalContainerParentData;
    return computeAbsolutePaintOffset(
        child, childParentData.layoutOffset!, childParentData.growthDirection!);
  }

  @override
  double scrollOffsetOf(RenderSliver child, double scrollOffsetWithinChild) {
    assert(child.parent == this);
    final GrowthDirection growthDirection = child.constraints.growthDirection;
    switch (growthDirection) {
      case GrowthDirection.forward:
        double scrollOffsetToChild = 0.0;
        RenderSliver? current = center;
        while (current != child) {
          scrollOffsetToChild += current!.geometry!.scrollExtent;
          current = childAfter(current);
        }
        return scrollOffsetToChild + scrollOffsetWithinChild;
      case GrowthDirection.reverse:
        double scrollOffsetToChild = 0.0;
        RenderSliver? current = childBefore(center!);
        while (current != child) {
          scrollOffsetToChild -= current!.geometry!.scrollExtent;
          current = childBefore(current);
        }
        return scrollOffsetToChild - scrollOffsetWithinChild;
    }
  }

  @override
  double maxScrollObstructionExtentBefore(RenderSliver child) {
    assert(child.parent == this);
    final GrowthDirection growthDirection = child.constraints.growthDirection;
    switch (growthDirection) {
      case GrowthDirection.forward:
        double pinnedExtent = 0.0;
        RenderSliver? current = center;
        while (current != child) {
          pinnedExtent += current!.geometry!.maxScrollObstructionExtent;
          current = childAfter(current);
        }
        return pinnedExtent;
      case GrowthDirection.reverse:
        double pinnedExtent = 0.0;
        RenderSliver? current = childBefore(center!);
        while (current != child) {
          pinnedExtent += current!.geometry!.maxScrollObstructionExtent;
          current = childBefore(current);
        }
        return pinnedExtent;
    }
  }

  @override
  void applyPaintTransform(RenderObject child, Matrix4 transform) {
    final Offset offset = paintOffsetOf(child as RenderSliver);
    transform.translate(offset.dx, offset.dy);
  }

  @override
  double computeChildMainAxisPosition(
      RenderSliver child, double parentMainAxisPosition) {
    final CustomSliverPhysicalContainerParentData childParentData =
        child.parentData! as CustomSliverPhysicalContainerParentData;
    switch (applyGrowthDirectionToAxisDirection(
        child.constraints.axisDirection, child.constraints.growthDirection)) {
      case AxisDirection.down:
      case AxisDirection.right:
        return parentMainAxisPosition - childParentData.layoutOffset!;
      case AxisDirection.up:
        return (size.height - parentMainAxisPosition) -
            childParentData.layoutOffset!;
      case AxisDirection.left:
        return (size.width - parentMainAxisPosition) -
            childParentData.layoutOffset!;
    }
  }

  @override
  int get indexOfFirstChild {
    assert(center != null);
    assert(center!.parent == this);
    assert(firstChild != null);
    int count = 0;
    RenderSliver? child = center;
    while (child != firstChild) {
      count -= 1;
      child = childBefore(child!);
    }
    return count;
  }

  @override
  String labelForChild(int index) {
    if (index == 0) return 'center child';
    return 'child $index';
  }

  @override
  Iterable<RenderSliver> get childrenInPaintOrder sync* {
    if (firstChild == null) return;
    RenderSliver? child = firstChild;
    while (child != center) {
      yield child!;
      child = childAfter(child);
    }
    child = lastChild;
    while (true) {
      yield child!;
      if (child == center) return;
      child = childBefore(child);
    }
  }

  @override
  Iterable<RenderSliver> get childrenInHitTestOrder sync* {
    if (firstChild == null) return;
    RenderSliver? child = center;
    while (child != null) {
      yield child;
      child = childAfter(child);
    }
    child = childBefore(center!);
    while (child != null) {
      yield child;
      child = childBefore(child);
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('anchor', anchor));
  }
}

class CustomSliverPhysicalContainerParentData
    extends SliverPhysicalContainerParentData {
  /// The position of the child relative to the zero scroll offset.
  ///
  /// The number of pixels from from the zero scroll offset of the parent sliver
  /// (the line at which its [SliverConstraints.scrollOffset] is zero) to the
  /// side of the child closest to that offset. A [layoutOffset] can be null
  /// when it cannot be determined. The value will be set after layout.
  ///
  /// In a typical list, this does not change as the parent is scrolled.
  ///
  /// Defaults to null.
  double? layoutOffset;

  GrowthDirection? growthDirection;
}