import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherDataLoaded extends WeatherState {
  final WeatherModel weatherModel;

  WeatherDataLoaded(this.weatherModel);
}

class WeatherFailureState extends WeatherState {
  final String errorMessage;

  WeatherFailureState(this.errorMessage);
}
