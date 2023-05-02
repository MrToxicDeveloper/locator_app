import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:locator_app/locator/controlle/locator_controller.dart';
import 'package:permission_handler/permission_handler.dart';

class LocatorView extends StatefulWidget {
  const LocatorView({Key? key}) : super(key: key);

  @override
  State<LocatorView> createState() => _LocatorViewState();
}

class _LocatorViewState extends State<LocatorView> {
  LocatorController controller = Get.put(LocatorController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Locator",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () async {
                    var status = await Permission.location.status;
                    if (status.isDenied) {
                      Permission.location.request();
                    } else if (status.isGranted) {
                      Position position = await Geolocator.getCurrentPosition(
                          desiredAccuracy: LocationAccuracy.high);

                      controller.Lat.value = position.latitude;
                      controller.Lon.value = position.longitude;
                    }
                  },
                  child: Text("Get Lat & Lon"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(() => SelectableText(
                      "Latitude :- ${controller.Lat.value}",
                      style: TextStyle(fontSize: 20),
                    )),
                SizedBox(
                  height: 10,
                ),
                Obx(() => SelectableText(
                      "Longitude :- ${controller.Lon.value}",
                      style: TextStyle(fontSize: 20),
                    )),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    List<Placemark> placemarks = await placemarkFromCoordinates(
                        controller.Lat.value, controller.Lon.value);
                    controller.locate.value = placemarks;
                  },
                  child: Text("Get Address"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => SelectableText(
                    controller.locate.isEmpty ? " " : "${controller.locate[0]}",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => Get.toNamed('map'), child: Icon(Icons.pin_drop)),
      ),
    );
  }
}
