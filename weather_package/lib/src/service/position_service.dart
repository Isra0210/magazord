import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_package/src/service/failure.dart';

class PositionService {
  Future<Either<Failure, Position>> getUserPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) return left(LocationServiceDisabledFailure());

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.log('Permission was denied', isError: true);
        return left(PermissionDeniedFailure());
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.log('Permission was denied forever', isError: true);
      return left(PermissionDeniedFailure());
    }

    final position = await Geolocator.getCurrentPosition();

    Get.log(
      'User position lat:[${position.latitude}] | long:[${position.longitude}]',
    );
    return right(position);
  }

  Future<Either<Failure, String>> getCityFromCoordinates() async {
    final positionOrError = await getUserPosition();

    return positionOrError.fold((failure) {
      return Left(failure);
    }, (position) async {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks.isNotEmpty && placemarks.first.locality != null) {
        Get.log('User city: ${placemarks.first.locality}');
        return Right(
          '${placemarks.first.locality} - ${placemarks.first.administrativeArea}',
        );
      } else {
        Get.log('User city not found', isError: true);
        return Left(CityNotFound());
      }
    });
  }
}
