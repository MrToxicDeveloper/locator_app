import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locator_app/locator/controlle/locator_controller.dart';

class Mapscreen extends StatefulWidget {
  const Mapscreen({Key? key}) : super(key: key);

  @override
  State<Mapscreen> createState() => _MapscreenState();
}

class _MapscreenState extends State<Mapscreen> {
  LocatorController locatorController = Get.put(LocatorController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // body: GoogleMap(
        //   initialCameraPosition: CameraPosition(
        //     target: LatLng(21.1702, 72.8311),
        //   ),
        // ),
        body: GoogleMap(
          // indoorViewEnabled: true,
          // liteModeEnabled: true,
          // myLocationButtonEnabled: true,
          //

          rotateGesturesEnabled: true,
          myLocationEnabled: true,
          mapToolbarEnabled: true,
          markers: {
            Marker(
              markerId: MarkerId("Me"),
              position: LatLng(
                  locatorController.Lat.value, locatorController.Lon.value),
            ),
          },
          compassEnabled: true,
          // indoorViewEnabled: true,
          // markers: Set<Markers>,
          buildingsEnabled: true,
          onCameraMove: (position) =>
              LatLng(locatorController.Lat.value, locatorController.Lon.value),
          initialCameraPosition: CameraPosition(
            target: LatLng(
                locatorController.Lat.value, locatorController.Lon.value),
          ),
        ),
      ),
    );
  }
}
