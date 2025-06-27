import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class WeatherDataLoading extends WeatherState {}

class WeatherDataLoadedSuccess extends WeatherState {
  final WeatherModel weatherModel;

  WeatherDataLoadedSuccess(this.weatherModel);
}

class WeatherFailureState extends WeatherState {
  final String errorMessage;

  WeatherFailureState(this.errorMessage);
}
