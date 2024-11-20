import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'package:dartz/dartz.dart';
import 'package:weather_package/src/models/weather_model.dart';
import 'package:weather_package/src/service/utils/constants.dart';

import 'failure.dart';

class WeatherService {
  WeatherService(this._connect);

  final GetConnect _connect;

  String get appId => const String.fromEnvironment('APPID');

  Future<Either<Failure, WeatherModel>> getWeatherByPosition(
      Position position) async {
    try {
      final url =
          '$baseUrl?$kLat=${position.latitude}&lon=${position.longitude}&appid=$appId';
      final response = await _connect.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.body;
        final weather = await compute(getWeatherFromJson, data);
        Get.log('Get weather data - ${weather.current}');
        return Right(weather);
      } else {
        Get.log(
          'Error when get weather data - [${response.statusCode} - ${response.status}]',
          isError: true,
        );
        return Left(
          UnknowFailure(
            'Erro: ${response.statusCode} - ${response.status}',
          ),
        );
      }
    } on SocketException {
      Get.log(
        'Error when get weather data, user without internet connection',
        isError: true,
      );
      return Left(NoInternetConnectionFailure());
    } on FormatException {
      Get.log(
        'Error when get weather data, unprocessed data',
        isError: true,
      );
      return Left(UnprocessedDataFailure());
    } catch (e) {
      Get.log(
        'Unknow error when get weather data',
        isError: true,
      );
      return Left(UnknowFailure('Ocorreu um erro desconhecido: $e'));
    }
  }
}