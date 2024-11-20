import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:weather_package/src/models/weather_model.dart';
import 'package:weather_package/src/service/failure.dart';
import 'package:weather_package/src/service/position_service.dart';
import 'package:weather_package/src/service/weather_service.dart';

class WeatherController extends GetxController implements GetxService {
  WeatherController(this._service, this._positionService);
  final WeatherService _service;
  final PositionService _positionService;

  final RxBool _hasLocationPermission = true.obs;
  bool get hasLocationPermission => _hasLocationPermission.value;
  set hasLocationPermission(bool value) => _hasLocationPermission.value = value;

  final Rx<String?> _city = Rx(null);
  String? get city => _city.value;
  set city(String? value) => _city.value = value;

  final Rx<String?> _error = Rx(null);
  String? get error => _error.value;
  set error(String? value) => _error.value = value;

  final Rx<WeatherModel?> _weather = Rx(null);
  WeatherModel? get weather => _weather.value;
  set weather(WeatherModel? value) => _weather.value = value;

  void _checkIfPermissionError(Failure failure) {
    final isPermissionError = failure is PermissionDeniedFailure ||
        failure is LocationServiceDisabledFailure;
    if (isPermissionError) hasLocationPermission = false;
  }

  Future<void> getWeatherData() async {
    if (_weather.value != null) return;

    final positionOrError = await _positionService.getUserPosition();
    positionOrError.fold((failure) {
      hasLocationPermission = false;
      error = failure.message;
    }, (position) async {
      final weatherOrError = await _service.getWeatherByPosition(position);
      weatherOrError.fold((failure) {
        _checkIfPermissionError(failure);
        error = failure.message;
      }, (weather) async {
        await getUserCity();
        _weather.value = weather;
      });
    });
  }

  Future<void> getUserCity() async {
    final cityOrError = await _positionService.getCityFromCoordinates();
    cityOrError.fold(
      (failure) {
        _checkIfPermissionError(failure);
        error = failure.message;
      },
      (city) => this.city = city,
    );
  }

  @override
  void onInit() {
    initializeDateFormatting('pt_BR');
    super.onInit();
  }
}
