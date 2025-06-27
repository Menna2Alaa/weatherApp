import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          String? condition;
          if (state is WeatherDataLoaded) {
            condition = state.weatherModel.weatherCondition;
          }

          return MaterialApp(
            theme: ThemeData(primarySwatch: getThemeColor(condition)),
            debugShowCheckedModeBanner: false,
            home: HomeView(),
          );
        },
      ),
    );
  }
}

MaterialColor getThemeColor(String? weatherCondition) {
  if (weatherCondition == null) {
    return Colors.blue;
  }
  switch (weatherCondition.toLowerCase()) {
    case 'sunny':
      return Colors.orange;
    case 'partly cloudy':
    case 'cloudy':
    case 'overcast':
      return Colors.blueGrey;
    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.blue;
    case 'patchy rain possible':
    case 'light rain':
    case 'moderate rain':
    case 'heavy rain':
      return Colors.lightBlue;
    case 'patchy snow possible':
    case 'light snow':
    case 'moderate snow':
    case 'heavy snow':
      return Colors.blueGrey;
    case 'blizzard':
    case 'ice pellets':
      return Colors.grey;
    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
      return Colors.indigo;
    case 'light drizzle':
    case 'heavy freezing drizzle':
      return Colors.cyan;
    case 'patchy light rain':
      return Colors.lightBlue;
    default:
      return Colors.blue;
  }
}
