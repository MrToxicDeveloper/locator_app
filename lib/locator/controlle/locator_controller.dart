import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class LocatorController extends GetxController{
  RxDouble Lat = 0.0.obs;
  RxDouble Lon = 0.0.obs;

  RxList<Placemark> locate = <Placemark>[].obs;
}