import 'package:geolocator/geolocator.dart';
import 'package:sizzle_starter/src/feature/home/widget/app_lat_long.dart';
import 'package:sizzle_starter/src/feature/home/widget/app_location.dart';

class LocationService implements AppLocation {
  final defLocation = const MoscowLocation();

  @override
  Future<AppLatLong>
      getCurrentLocation() async => Geolocator.getCurrentPosition()
          .then(
              (value) => AppLatLong(lat: value.latitude, long: value.longitude))
          .catchError(
            (_) => defLocation,
          );

  @override
  Future<bool> requestPermission() => Geolocator.requestPermission()
      .then((value) =>
          value == LocationPermission.always ||
          value == LocationPermission.whileInUse)
      .catchError((_) => false);

  @override
  Future<bool> checkPermission() => Geolocator.checkPermission()
      .then((value) =>
          value == LocationPermission.always ||
          value == LocationPermission.whileInUse)
      .catchError((_) => false);
}
