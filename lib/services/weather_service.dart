import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'cf78c57d1cd54e3889d163432252205';

  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1',
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMeage =
          e.response?.data['erro']['message'] ??
          'oops there is an error, try later';
      throw Exception(errorMeage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there is an error, try later');
    }
  }
}
