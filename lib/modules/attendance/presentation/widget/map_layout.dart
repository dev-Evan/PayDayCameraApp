import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/dimensions.dart';
import '../controller/attendance_controller.dart';

class MapSample extends GetView<AttendanceController> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  MapSample({super.key});

  @override
  Widget build(BuildContext context) {
    double lat = controller.lat.value;
    double long = controller.long.value;
    return controller.obx((state) => Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
      width: double.infinity,
      height: AppLayout.getHeight(168),
      child: GoogleMap(
          mapType: MapType.normal,
          zoomControlsEnabled: false,
          zoomGesturesEnabled: false,
          initialCameraPosition: CameraPosition(
              target: LatLng(lat, long),
              zoom: 17),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: <Marker>{
            Marker(
              markerId: const MarkerId('SomeId'),
              position: LatLng(lat, long),
            )
          }),
    ),onLoading: const LoadingIndicator());
  }
}
